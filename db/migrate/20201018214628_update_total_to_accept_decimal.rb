class UpdateTotalToAcceptDecimal < ActiveRecord::Migration[6.0]
    def up
    change_column :transactions, :total, :decimal
  end
  
  def down
    change_column :transactions, :total, :real
  end
end
