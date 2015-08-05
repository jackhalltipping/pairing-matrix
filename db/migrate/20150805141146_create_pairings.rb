class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.date :day
      t.integer :user_id
      t.integer :pair_id
      t.boolean :paired_with, default: false

      t.timestamps null: false
    end
  end
end
