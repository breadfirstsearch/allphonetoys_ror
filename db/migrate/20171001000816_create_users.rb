class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :phone, :limit => 8
      t.string :password
      t.string :pref_provider
      t.integer :pref_amount
      t.string :pref_location
      t.timestamps
    end
  end
end
