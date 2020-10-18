class UpdateTotalToAcceptFloat < ActiveRecord::Migration[6.0]
   def up
    change_column :transactions, :total, :real
  end
  
  def down
    change_column :transactions, :total, :integer
  end
end
