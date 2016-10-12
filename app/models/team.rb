# == Schema Information
#
# Table name: teams
#
#  id          :integer          not null, primary key
#  name        :text
#  division_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Team < ActiveRecord::Base
  belongs_to :division
  has_many :players

end
