class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :yelpID
      t.string :name
      t.string :image_url
      t.string :url
      t.string :categories
      t.string :price
      t.string :location
      t.string :display_phone

      t.timestamps
    end
  end
end
