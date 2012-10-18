
class Search
  include MongoMapper::Document

  key :name, String
  key :query, String 
  key :results, Array

end
