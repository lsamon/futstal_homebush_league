# == Schema Information
#
# Table name: players
#
#  id              :integer          not null, primary key
#  name            :text
#  dob             :date
#  email           :text
#  image           :text
#  team_id         :integer
#  password_digest :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  admin           :boolean
#

class Player < ActiveRecord::Base
  has_secure_password
  validates :email, :presence => true
  belongs_to :team
end
