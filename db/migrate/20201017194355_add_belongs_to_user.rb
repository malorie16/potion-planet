class AddBelongsToUser < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to :transactions, :user
  end
end
