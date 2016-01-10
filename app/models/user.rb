# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  uid        :string           not null
#  provider   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
end
