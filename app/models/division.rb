# == Schema Information
#
# Table name: divisions
#
#  id              :integer          not null, primary key
#  division_number :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Division < ActiveRecord::Base
  has_many :teams
  has_many :players, :through => :teams
end
