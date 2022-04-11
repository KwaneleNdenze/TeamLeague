class Manager < ApplicationRecord
 belongs_to :team
 has_many :players
 validates :name, presence: true, 
                    length: { minimum: 3 }, uniqueness: { scope: :name, message: "Manager is already employed by another team." }

end