class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.text :name
      t.date :dob
      t.text :email
      t.text :image
      t.integer :team_id
      t.text :password_digest

      t.timestamps null: false
    end
  end
end
