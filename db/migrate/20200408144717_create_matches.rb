class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :start_at
      t.string   :status

      t.timestamps null: false
    end
  end
end
