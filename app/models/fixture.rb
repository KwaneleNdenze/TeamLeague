class Fixture < ApplicationRecord
  belongs_to :league
  validate :same_team_validation
  validates :date, presence: true

  def same_team_validation
    if self.home_team == self.away_team
        errors.add(:home_team, "Teams must be different") 
    end
  end
end