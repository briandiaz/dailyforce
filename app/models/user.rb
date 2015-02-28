# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  provider      :string(255)
#  uid           :string(255)
#  name          :string(255)
#  email         :string(255)
#  nick_name     :string(255)
#  oauth_token   :string(255)
#  refresh_token :string(255)
#  instance_url  :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class User < ActiveRecord::Base
    def self.from_omniauth(auth)
      where(auth.slice(:provider, :uid).permit!).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email
        user.nick_name = auth.info.nick_name
        user.oauth_token = auth.credentials.token
        user.refresh_token = auth.credentials.refresh_token
        user.instance_url = auth.credentials.instance_url
        user.save!
      end
    end
end
