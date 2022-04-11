class Fixture < ApplicationRecord
  belongs_to :league
  validate :same_team_validation
  validates :date, presence: true

  # has_one :home_team, class_name: 'Team'
  # has_one :away_team, class_name: 'Team'


  def home_team
    Team.find(home_team_id)
  end

  def away_team
    Team.find(away_team_id)
  end

  def same_team_validation
    if self.home_team_id == self.away_team_id
        errors.add(:home_team, "Teams must be different") 
    end
  end
end
