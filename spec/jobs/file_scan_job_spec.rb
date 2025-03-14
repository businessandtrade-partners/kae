require "rails_helper"

RSpec.describe FileScanJob do
  describe "perform" do
    let(:attachment) { create(:form_answer_attachment) }
    let(:file) { attachment.file }
    let(:scan_result) { { malware: false } }

    before do
      allow(VirusScanner).to receive(:scan_file).and_return({ scan_result: scan_result })
    end

    describe "#perform" do
      context "when the record has a valid attachment to scan" do
        it "calls the scan_file method" do
          expect(VirusScanner).to receive(:scan_file)

          described_class.new.perform({}, attachment.class.name, attachment.id, :file)
        end

        context "and the virus scanner returns a scan_result of clean" do
          it "updates file_scan_results to clean on the record" do
            expect do
              described_class.new.perform({}, attachment.class.name, attachment.id, :file)
            end.to change { attachment.reload.file_scan_results }.from("pending").to("clean")
          end

          it "updates the attachment file path from /tmp to /permanent" do
            expect(attachment.reload.file.path.include?("/tmp")).to be true

            described_class.new.perform({}, attachment.class.name, attachment.id, :file)

            expect(attachment.reload.file.path.include?("/permanent")).to be true
          end
        end

        context "and the virus scanner raises VirusScanner::AuthenticationError" do
          before do
            allow(VirusScanner).to receive(:scan_file).and_raise(VirusScanner::AuthenticationError)
          end

          it "updates the file_scan_results to :error" do
            expect do
              described_class.new.perform({}, attachment.class.name, attachment.id, :file)
            end.to change { attachment.reload.file_scan_results }.from("pending").to("error")
          end
        end

        context "and the virus scanner raises VirusScanner::FileTooLargeError" do
          before do
            allow(VirusScanner).to receive(:scan_file).and_raise(VirusScanner::FileTooLargeError)
          end

          it "updates the file_scan_results to :error" do
            expect do
              described_class.new.perform({}, attachment.class.name, attachment.id, :file)
            end.to change { attachment.reload.file_scan_results }.from("pending").to("error")
          end
        end

        context "and the virus scanner raises VirusScanner::ScanError" do
          before do
            allow(VirusScanner).to receive(:scan_file).and_raise(VirusScanner::ScanError)
          end

          it "updates the file_scan_results to :error" do
            expect do
              described_class.new.perform({}, attachment.class.name, attachment.id, :file)
            end.to change { attachment.reload.file_scan_results }.from("pending").to("error")
          end
        end
      end

      context "when the record does not have a valid attachment to scan" do
        before do
          FormAnswerAttachment.send(:attr_accessor, :attachment) # mock an alternative callable attribute
        end

        it "does not call the scan_file method" do
          expect(VirusScanner).not_to receive(:scan_file)

          described_class.new.perform({}, attachment.class.name, attachment.id, :attachment)
        end
      end
    end

    describe "#get_file_to_scan" do
      context "and the attached file type is FormAnswerAttachmentUploader" do
        it "gets the file to scan" do
          expect(described_class.new.send(:get_file_to_scan, file)).to eq file
        end
      end

      context "and the attached file type is a string" do
        it "gets the file to scan" do
          expect(described_class.new.send(:get_file_to_scan, file.path).inspect).to eq File.open(file.path).inspect
        end
      end

      context "and the attached file type is a CarrierWave::SanitzedFile but does not respond to read" do
        before { allow(file.file).to receive(:respond_to?).with(:read).and_return(false) }

        it "gets the file to scan" do
          expect(described_class.new.send(:get_file_to_scan, file.file).class).to eq File
        end
      end

      context "and the attached file type is a CarrierWave::SanitzedFile" do
        it "gets the file to scan" do
          expect(described_class.new.send(:get_file_to_scan, file.file).class).to eq CarrierWave::SanitizedFile
        end
      end

      context "and the attached file does not respond to read but does respond to file" do
        before do
          allow(file).to receive(:respond_to?).with(:read).and_return(false)
          allow(file).to receive(:respond_to?).with(:file).and_return(true)
        end

        it "gets the file to scan" do
          expect(described_class.new.send(:get_file_to_scan, file).class).to eq File
        end
      end

      context "and the attached file only responds to path" do
        before do
          allow(file).to receive(:respond_to?).with(:read).and_return(false)
          allow(file).to receive(:respond_to?).with(:file).and_return(false)
          allow(file).to receive(:respond_to?).with(:path).and_return(true)
        end

        it "gets the file to scan using the path" do
          expect(described_class.new.send(:get_file_to_scan, file).class).to eq File
        end
      end

      context "and the attached file type is not handled" do
        it "raises an ArgumentError" do
          expect do
            described_class.new.send(:get_file_to_scan, FormAnswer)
          end.to raise_error(ArgumentError, "Don't know how to handle Class")
        end
      end
    end
  end
end
