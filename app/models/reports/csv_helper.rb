require "csv"

module Reports::CsvHelper
  def build
    CSV.generate(encoding: "UTF-8", force_quotes: true) do |csv|
      csv << headers

      @scope.each do |form_answer|
        form_answer = Reports::FormAnswer.new(form_answer)

        csv << mapping.map do |m|
          unescape_and_sanitize(form_answer.call_method(m[:method]))
        end
      end
    end
  end

  def prepare_response(scope, limited_access = false, builder = nil)
    CSV.generate(encoding: "UTF-8", force_quotes: true) do |csv|
      csv << headers

      find_each_with_order(scope) do |fa|
        f = if builder.nil?
          Reports::FormAnswer.new(fa, limited_access)
        else
          builder.new(fa)
        end

        csv << mapping.map do |m|
          unescape_and_sanitize(f.call_method(m[:method]))
        end
      end
    end
  end

  def prepare_stream(scope, limited_access = false)
    @_csv_enumerator ||= Enumerator.new do |yielder|
      yielder << CSV.generate_line(headers, encoding: "UTF-8", force_quotes: true)

      find_each_with_order(scope) do |fa|
        f = Reports::FormAnswer.new(fa, limited_access)

        row = mapping.map do |m|
          unescape_and_sanitize(f.call_method(m[:method]))
        end

        yielder << CSV.generate_line(row, encoding: "UTF-8", force_quotes: true)
      end
    end
  end

  private

  def unescape_and_sanitize(string)
    CGI.unescapeHTML(
      Utils::String.sanitize(
        string,
      ),
    )
  end

  def find_each_with_order(scope, batch_size: 100, &block)
    ordered_ids = scope.pluck(:id)

    ordered_ids.in_groups_of(batch_size, false) do |ids|
      scope.model.where(id: ids).index_by(&:id).values_at(*ordered_ids).compact.each do |fa|
        yield fa
      end
    end
  end

  def headers
    mapping.pluck(:label)
  end
end
