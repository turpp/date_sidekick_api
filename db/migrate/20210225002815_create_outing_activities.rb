class CreateOutingActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :outing_activities do |t|
      t.integer :outing_id
      t.integer :activity_id

      t.timestamps
    end
  end
end
