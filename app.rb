require 'rubygems'
require 'sinatra'
require 'json'
require 'mongo'

enable :static
set :root, File.dirname(__FILE__)

get "/" do
 redirect "index.html"
end

get "/table" do
 redirect "table.html"
end

get "/skills.json" do	
	content_type :json
	conn = Mongo::Connection.new
	db = conn["planit"]
	collection = db["skills"]
	collection.find().to_a.to_json
end