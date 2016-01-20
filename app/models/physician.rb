class Physician < ActiveRecord::Base
  has_many :appointments
  has_many :users, through: :appointments
  has_many :pictures, as: :imageable
end
