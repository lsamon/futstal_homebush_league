class AddKindToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :kind, :string, default: :league
  end
end
