class AddFulfilledToTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :fulfilled, :boolean
  end
end
