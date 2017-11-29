class RemoveUserFromTransactions < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :transactions, :user
  end
end
