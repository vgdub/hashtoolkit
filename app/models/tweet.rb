
class Tweet
  include MongoMapper::EmbeddedDocument
  
  key :tweet_id, String
  key :text, String
  key :hashtag, String
  key :retweet_ccount, String

  one :tweet_user
  one :tweet_entity


end 


class TweetUser
  include MongoMapper::EmbeddedDocument

  key :user_id, String
  key :nickname, String
  key :followers_count, Integer
  key :friends_count, Integer

  belongs_to :tweet

end

class TweetEntity
  include MongoMapper::EmbeddedDocument

  key :hashtags, Array
  key :mentions, Array
  key :urls, Array

  belongs_to :tweet

end
