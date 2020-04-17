class MoveNumberColumnDivisions < ActiveRecord::Migration
  def change
  	change_column :divisions, :number, :integer, after: :name
  end
end
