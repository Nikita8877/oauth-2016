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
#  email      :string
#  token      :string
#  secret     :string
#

class User < ActiveRecord::Base
  validates :uid, presence: true
  validates :provider, presence: true
  validates :uid, uniqueness: { scope: :provider }

  has_many :appointments, dependent: :nullify
  has_many :physicians, through: :appointments
  has_many :pictures, as: :imageable
  has_many :orders, dependent: :destroy

  after_commit :flush_cache

  def self.from_omniauth(auth_hash)
    user = User.find_or_initialize_by({uid: auth_hash['uid'], provider: auth_hash['provider']})
    user.name = auth_hash['info']['name']
    user.email = auth_hash['info']['email']# if auth_hash['provider'] == "facebook"
    if auth_hash['provider'] == "twitter"
      user.token = auth_hash['credentials']['token']
      user.secret = auth_hash['credentials']['secret']
    end
    user.save!
    user
  end

  def self.all_cached
    Rails.cache.fetch('all_users') { User.includes(:orders).order('created_at ASC') }
  end

  def self.find_by_id_cached(id)
    Rails.cache.fetch("user_#{id}") { find_by(id: id) }
  end

  private

  def flush_cache
    Rails.cache.delete('all_users')
    Rails.cache.delete("user_#{self.id}")
  end
end
