class Station < ApplicationRecord
  validates :stationname, :route, :time, presence: true

  belongs_to :renthouse
end
