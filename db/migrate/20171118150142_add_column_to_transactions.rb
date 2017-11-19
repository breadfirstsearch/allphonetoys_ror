class AddColumnToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :pickupDate, :string
  end
end
