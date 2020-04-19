DatabaseCleaner.clean_with :truncation, except: %w(ar_internal_metadata)

def add_players_to_teams(players, teams)
	players.in_groups_of(6).each_with_index do |player_group, index|
		teams[index].players << player_group
		teams[index].save
	end
end

def add_teams_to_divisions(divisions, teams)
	teams.in_groups_of(5).each_with_index do |team_group, index|
		divisions[index].teams << team_group
		divisions[index].save
	end
end

puts "Create players"
players = FactoryBot.create_list(:player, 120)

puts "Create Admin User"
FactoryBot.create(:user, role: :admin, password: "12345678")

puts "Create Teams"
teams = FactoryBot.create_list(:team, 20)
add_players_to_teams(players, teams)

puts "Create Season"
FactoryBot.create(:season)

divisions = [
	{ number: 1, name: "One" },
	{ number: 2, name: "Two" },
	{ number: 3, name: "Three" },
	{ number: 4, name: "Four" },
	{ number: 5, name: "Five" }
]

puts "Create Divisions"
divisions = Division.create!(divisions)
add_teams_to_divisions(divisions, teams)
