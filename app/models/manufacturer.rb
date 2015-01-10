class Manufacturer < ActiveRecord::Base
  validates :name, uniqueness: {scope: :country}, presence: true
  validates :country, presence: true

  has_many :vehicles

end
