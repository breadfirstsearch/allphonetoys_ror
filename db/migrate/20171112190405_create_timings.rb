class CreateTimings < ActiveRecord::Migration[5.1]
  def change
    create_table :timings do |t|
      t.string :day
      t.string :time

      t.timestamps
    end
  end
end
