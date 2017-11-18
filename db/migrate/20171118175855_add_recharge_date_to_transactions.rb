class AddRechargeDateToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :rechargeDate, :string
  end
end
