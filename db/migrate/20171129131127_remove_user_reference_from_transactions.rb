class RemoveUserReferenceFromTransactions < ActiveRecord::Migration[5.1]
  def change
    remove_reference :transactions, :user, index: true
  end
end
