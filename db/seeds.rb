DatabaseCleaner.clean_with :truncation, except: %w(ar_internal_metadata)

players = [
	{ email: 'loui.amon@gmail.com', name: 'Louis Amon', password: 'chicken', password_confirmation: 'chicken', role: :player, status: :active }
	{ email: 'atil.selik@gmail.com', name: 'Atil Selik', password: 'chicken', password_confirmation: 'chicken', role: :player, status: :active }
	{ email: 'cedric.roux@gmail.com', name: 'Cedric Roux', password: 'chicken', password_confirmation: 'chicken', role: :player, status: :active }
	{ email: 'fu.amon@gmail.com', name: 'Fu Amon', password: 'chicken', password_confirmation: 'chicken', role: :player, status: :active }
]

puts "Create players"
Player.create!(players)

teams = [
 { name: 'United Nations' }
 { name: 'Sweet and Sour' }
 { name: 'Luking Good' }
 { name: 'National Joel Appreciation Club' }
]

puts "Create Teams"
Team.create!(teams)

divisions = [
	{ number: 1, name: "One" },
	{ number: 2, name: "Two" },
	{ number: 3, name: "Three" },
	{ number: 4, name: "Four" },
	{ number: 5, name: "Five" }
]

puts "Create Divisions"
Division.create!(divisions)

def add_players_to_teams

end

def add_teams_to_divisions
end
