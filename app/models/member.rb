class Member < ApplicationRecord
  belongs_to :user
  belongs_to :project

  # Validations Macros
  validates :user_id, uniqueness: { scope: :project_id }
end
