class ChangeTransactionAmountToTotalAmount < ActiveRecord::Migration[6.0]
  def change
    rename_column :transactions, :amount, :total_amount
  end
end
