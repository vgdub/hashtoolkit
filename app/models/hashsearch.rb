class hashsearch
	include MongoMapper::Document

	key :user_id, String
	key :query, String


end