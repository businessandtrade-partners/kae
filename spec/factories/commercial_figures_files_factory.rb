FactoryBot.define do
  factory :commercial_figures_file do
    association :form_answer, factory: :form_answer
    attachment do
      Rack::Test::UploadedFile.new(
        Rails.root.join("spec/fixtures/cat.jpg"),
      )
    end
  end
end
