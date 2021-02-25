class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :yelpID
      t.string :name
      t.string :img_url
      t.string :yelpUrl
      t.string :categories
      t.integer :price
      t.string :adress
      t.string :phone

      t.timestamps
    end
  end
end
