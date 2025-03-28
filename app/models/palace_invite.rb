class PalaceInvite < ApplicationRecord
  POSSIBLE_TITLES = ["Mr.", "Mrs.", "Miss", "Ms", "Doctor", "Professor", "Sir", "Dame", "The Lord", "The Lady", "Lady"].freeze
  belongs_to :form_answer, optional: true

  has_many :palace_attendees, dependent: :destroy, autosave: true

  validates :form_answer_id, presence: true, uniqueness: true # rubocop:disable Rails/UniqueValidationWithoutIndex

  before_create :set_token

  def prebuild_if_necessary
    attendees = palace_attendees
    records = attendees.select { |a| !a.new_record? }
    unless records.size == attendees_limit
      to_build = attendees_limit - records.size
      to_build.times do
        palace_attendees.build
      end
    end
    self
  end

  def submit!
    self.submitted = true
    save
  end

  def attendees_limit
    1
  end

  private

  def set_token
    self.token = SecureRandom.urlsafe_base64(24)
  end
end
