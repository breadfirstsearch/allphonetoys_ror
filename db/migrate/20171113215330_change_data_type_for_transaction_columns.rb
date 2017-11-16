class ChangeDataTypeForTransactionColumns < ActiveRecord::Migration[5.1]
  def change
    change_column :transactions, :provider, :string
    change_column :transactions, :location, :string
  end
end
