class User < ApplicationRecord
  has_many :contributions
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.avatar = auth['info']['image']
      end
    end
  end

  def auth_id
    "#{provider}-#{uid}"
  end

end
