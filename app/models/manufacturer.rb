class Manufacturer < ActiveRecord::Base
  validates :name, uniqueness: {scope: :country}, presence: true
  validates :country, presence: true

end
