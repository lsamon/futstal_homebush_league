class CreateAppSettings < ActiveRecord::Migration
  def change
    create_table :app_settings do |t|
      t.string :name
      t.text :value

      t.timestamps null: false
    end
  end
end
