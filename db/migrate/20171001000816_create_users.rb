class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :phone, :limit => 8
      t.string :password
      t.integer :pref_provider
      t.integer :pref_amount
      t.integer :pref_location
      t.timestamps
    end
  end
end
