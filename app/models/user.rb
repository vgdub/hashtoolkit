class User # < ActiveRecord::Base
  include MongoMapper::Document
  
  key :avatar, String
  key :name, String
  key :nickname, String
  key :provider, String
  key :user_id,  String
  key :location, String

  def self.from_omniauth(auth)

      user = User.find_by_user_id(auth["uid"])
      if user
        return user
      end

      return create_new(auth)
  end

  def self.create_new(auth)
      user = User.new()

      user.name = auth["info"]["name"]
      user.user_id = auth["uid"].to_s
      user.location = auth["info"]["location"].to_s
      user.nickname = auth["info"]["nickname"]
      user.avatar = auth["info"]["image"]

      user.save!
      return user
  end

  # def to_param
  #   self.nickname
  # end

end
