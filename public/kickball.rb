require 'csv'

team_list = []

CSV.foreach('lackp_starting_rosters.csv', headers: true) do |row|
	team_list << row.to_hash
end
