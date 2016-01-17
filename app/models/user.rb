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
  validates :uid, presence: true
  validates :provider, presence: true
  validates :uid, uniqueness: { scope: :provider }

  def self.from_omniauth(auth_hash)
    if auth_hash['provider'] == "vkontakte"
      user = User.find_or_initialize_by({uid: auth_hash['uid'], provider: auth_hash['provider']})
      user.name = auth_hash['info']['name']
      user.save!
      user
    else
      user = User.find_or_initialize_by({uid: auth_hash['uid'], provider: auth_hash['provider']})
      user.name = auth_hash['info']['name']
      user.email = auth_hash['info']['email']
      user.save!
      user
    end
  end
end
