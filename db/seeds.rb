Player.destroy_all
p1 = Player.create :email => 'loui.amon@gmail.com', :name => 'Louis Amon', :password => 'chicken', :password_confirmation => 'chicken', :admin => true
p2 = Player.create :email => 'atil.selik@gmail.com', :name => 'Atil Selik', :password => 'chicken', :password_confirmation => 'chicken'
p3 = Player.create :email => 'cedric.roux@gmail.com', :name => 'Cedric Roux', :password => 'chicken', :password_confirmation => 'chicken'
p4 = Player.create :email => 'fu.amon@gmail.com', :name => 'Fu Amon', :password => 'chicken', :password_confirmation => 'chicken'

Team.destroy_all
t1 = Team.create :name => 'United Nations', :points => 0
t2 = Team.create :name => 'Sweet and Sour', :points => 0
t3 = Team.create :name => 'Luking Good', :points => 0
t4 = Team.create :name => 'National Joel Appreciation Club', :points => 0


Division.destroy_all
d1 = Division.create :division_number => 1
d2 = Division.create :division_number => 2
d3 = Division.create :division_number => 3

Game.destroy_all
g1 = Game.create :team_a_id => Team.all[0].id, :team_a_score => 3, :team_b_id => Team.all[1].id, :team_b_score => 0
g2 = Game.create :team_a_id => Team.all[0].id, :team_a_score => 5, :team_b_id => Team.all[2].id, :team_b_score => 5
g3 = Game.create :team_a_id => Team.all[1].id, :team_a_score => 1, :team_b_id => Team.all[3].id, :team_b_score => 4
g4 = Game.create :team_a_id => Team.all[2].id, :team_a_score => 9, :team_b_id => Team.all[3].id, :team_b_score => 2

t1.players << p1 << p2
t2.players << p3
t3.players << p4

d1.teams << t3 << t4
d2.teams << t1 << t2

Game.add_current_points
