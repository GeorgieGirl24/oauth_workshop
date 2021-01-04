class User < ApplicationRecord
  def self.find_or_create_user(auth)
    user = User.find_or_create_by(uid: auth['uid'])
    user.username = auth['info']['nickname']
    user.uid = auth[:id]
    user.token = auth['credentials']['token']
    user.save
    user
  end
end
