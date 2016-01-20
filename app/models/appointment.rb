class Appointment < ActiveRecord::Base
  belongs_to :phycisian
  belongs_to :user
end
