require 'data_mapper'
require 'dm-validations'
require './app/models/peep'
require './app/models/user'
require 'sinatra/base'
require 'sinatra/flash'
require_relative '../spec/factories/user'

env = ENV['RACK_ENV'] || 'development'

if ENV['RACK_ENV'] == "production"
  DataMapper.setup(:default, ENV['DATABASE_URL'])
else
  DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
end

DataMapper.finalize

DataMapper.auto_upgrade!
