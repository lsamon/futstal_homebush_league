class AddNumberToDivision < ActiveRecord::Migration
  def change
    add_column :divisions, :number, :integer
  end
end
