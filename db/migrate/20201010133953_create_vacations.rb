class CreateVacations < ActiveRecord::Migration[5.2]
  def change
    create_table :vacations do |t|
      t.integer :apply_id
      t.string :name

      t.timestamps
    end
  end
end
