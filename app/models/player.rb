class Player < ApplicationRecord
belongs_to :manager
validates :name, presence: true, length: { minimum: 3 }, uniqueness: { scope: :name, message: "Player is already employed by another team." }
validates :jersey, presence: true, length: { minimum: 1, maximum: 2 }
end