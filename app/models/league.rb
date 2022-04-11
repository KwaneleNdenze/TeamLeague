class League < ApplicationRecord
  
  has_many :teams, dependent: :destroy
  has_many :fixtures, dependent: :destroy
  has_many :logs, dependent: :destroy
  validates_associated :teams
  validates :name, presence: true,
                    length: { minimum: 3 }, uniqueness: { message: "League already exists." }
  validates :country, presence: true,
                    length: { minimum: 3 }
                    
end