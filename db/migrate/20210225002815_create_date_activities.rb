class CreateDateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :date_activities do |t|
      t.integer :userId
      t.integer :activityId

      t.timestamps
    end
  end
end
