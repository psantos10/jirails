class Project < ApplicationRecord

  # Associations
  has_many :members
  has_many :users, through: :members

  # Validations Macros
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  def add_user(user)
    users << user
    #save
  end
end
