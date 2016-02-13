class User < ApplicationRecord
  def self.from_omniauth(auth)
    info = auth['info']
    user = find_or_create_by(uid: get_uid(info['urls']['Profile']))

    user.nickname = info['nickname']
    user.avatar_url = info['image']
    user.profile_url = info['urls']['Profile']
    user.save!
    user
  end

  def self.get_uid(profile_url)
    profile_url.split('/').last
  end
end
