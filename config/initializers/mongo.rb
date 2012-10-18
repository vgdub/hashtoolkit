

config = YAML.load_file(Rails.root + 'config' + 'mongo.yml')
MongoMapper.setup(config, Rails.env, { :logger => Rails.logger })

