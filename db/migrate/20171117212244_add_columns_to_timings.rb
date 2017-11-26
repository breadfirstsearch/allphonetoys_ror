class AddColumnsToTimings < ActiveRecord::Migration[5.1]
  def change
    add_column :timings, :hours, :string
    add_column :timings, :minutes, :string
    add_column :timings, :ampm, :string
  end
end
