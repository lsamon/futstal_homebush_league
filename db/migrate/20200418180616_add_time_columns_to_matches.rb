class AddTimeColumnsToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :end_at, :datetime, after: :start_at
    add_column :matches, :actual_start_at, :datetime, after: :end_at
  end
end
