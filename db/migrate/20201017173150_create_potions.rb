class CreatePotions < ActiveRecord::Migration[6.0]
  def change
    create_table :potions do |t|
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
