class QaeFormBuilder
  class SubFieldsQuestionValidator < QuestionValidator
    def errors
      result = super

      if question.required?
        question.required_sub_fields.each do |sub_field|
          suffix = sub_field.keys[0]
          if question.input_value(suffix: suffix).blank?
            result[question.hash_key(suffix: suffix)] ||= ""
            result[question.hash_key(suffix: suffix)] << "Question #{question.ref || question.sub_ref} is incomplete. #{suffix.to_s.humanize} is required and and must be filled in."
          end
        end
      end

      question.sub_fields.each do |sub_field|
        suffix = sub_field.keys[0]

        length = question.input_value(suffix: suffix).to_s.split(" ").count { |element| element.present? }

        limit = question.delegate_obj.sub_fields_words_max

        if limit && length && length > limit
          result[question.hash_key(suffix: suffix)] ||= ""
          result[question.hash_key(suffix: suffix)] << " Exceeded #{limit} word limit."
        end
      end

      # need to add govuk-form-group--errors class
      result[question.hash_key] ||= "" if result.any?

      result
    end
  end

  class SubFieldsQuestionDecorator < QuestionDecorator
    NO_VALIDATION_SUB_FIELDS = [:honours]

    def required_sub_fields
      sub_fields.select do |f|
        NO_VALIDATION_SUB_FIELDS.exclude?(f.keys.first)
      end
    end

    def rendering_sub_fields
      sub_fields.map do |f|
        { key: f.keys.first, title: f.values.first, hint: f.try(:[], :hint), type: f.fetch(:type, "text"), classes: f.fetch(:classes, "") }
      end
    end
  end

  class SubFieldsQuestionBuilder < QuestionBuilder
    def sub_fields fields
      @q.sub_fields = fields
    end

    def sub_fields_words_max(value)
      @q.sub_fields_words_max = value
    end
  end

  class SubFieldsQuestion < Question
    attr_accessor :sub_fields, :sub_fields_words_max
  end
end
