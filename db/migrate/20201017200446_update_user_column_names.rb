class UpdateUserColumnNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :phone_number, :phone
    rename_column :users, :expiration, :exp
    rename_column :users, :address, :street_1
    add_column :users, :street_2, :string
    add_column :users, :cc_num, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    remove_column :users, :last_four
    rename_column :transactions, :total_amount, :total
    add_column :transactions, :quantity, :integer
  end
end
