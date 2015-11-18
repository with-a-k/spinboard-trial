class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.string :location
      t.boolean :read, default: false

      t.timestamps null: false
    end
  end
end
