class ChangeDataTypeForUserColumns < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :pref_provider, :string
    change_column :users, :pref_location, :string
  end
end
