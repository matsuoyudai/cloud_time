class CreateApplies < ActiveRecord::Migration[5.2]
  def change
    create_table :applies do |t|
      t.integer :user_id
      t.integer :attendance_schedule_id
      t.integer :status

      t.timestamps
    end
  end
end
