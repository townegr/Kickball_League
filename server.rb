require 'sinatra'
require 'csv'
require 'pry'

file = 'lackp_starting_rosters.csv'
before do 
	# Create an empty teams hash
	@teams = {}
	 
	# Open up the CSV and save it to the variable csv
	csv = CSV.open(file, headers: true)
	 
	# Iterate through the CSV and create a hash that looks like teams = {'Simpson Slammers' => {'players' => {}}}
	csv.each do |row|
	  team_name = row['team']
	  @teams[team_name] = {'players' => {} }
	end
	 
	# You need to do this so that you start from the top of the CSV again
	csv.rewind
	 
	# Iterate over the csv one more time and fill in the players data with the key being the full name
	# Set the value for full_name to be the players information
	csv.each do |row|
	  full_name = row['first_name'] + ' ' + row['last_name']
	  team_name = row['team']
	  @teams[team_name]['players'][full_name] = {'position' => row['position']}
	end
end


get '/' do
  @teams
  erb :index
end

get '/teams/:team' do 
	@teams = [params[:team].to_i]

  erb :teams
end


set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'