require 'csv'
require 'pry'

file = 'lackp_starting_rosters.csv'

team = {}
CSV.foreach(file, headers: true) do |row|
	team_name = row['team']
	teams[team_name] = {'players' => {}}
binding.pry
end

=begin
CSV.foreach(file, headers:true) do |row|
	full_name = row['first_name'] + ' ' + row['last_name']
	team_name = row['team']
	teams[team_name]['players'][full_name] = row['position']
end
=end
