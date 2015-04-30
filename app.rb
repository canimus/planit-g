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

get "/chord" do
 redirect "chord.html"
end

get "/stats" do
 redirect "stats.html"
end

get "/skills.json" do	
	content_type :json
	conn = Mongo::Connection.new
	db = conn["planit"]
	collection = db["skills"]
	collection.find().to_a.to_json
end

get "/certs.json" do	
	content_type :json
	conn = Mongo::Connection.new
	db = conn["planit"]
	collection = db["certifications"]
	collection.find().to_a.to_json
end

get "/team_stats.json" do
	content_type :json
	conn = Mongo::Connection.new
	db = conn["planit"]
	db["skills"].aggregate([
		{
			"$project" => {_id:0,
							name: 1, 
							certifications: {"$size" => "$certifications"},
							tools: {"$size" => "$test_tools"},
							technologies: {"$size" => "$enterprise_tech"},
							languages: {"$size" => "$languages"}
						  }
		}
	]).to_a.to_json
end