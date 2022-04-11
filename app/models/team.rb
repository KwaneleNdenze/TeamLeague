class Team < ApplicationRecord
  belongs_to :league
  has_one :manager, dependent: :destroy
  
  validates :name, presence: true,
                    length: { minimum: 3 }, uniqueness: { scope: :name, message: "Team already exists." }
end