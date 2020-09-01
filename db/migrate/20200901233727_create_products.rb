class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.string :integer
      t.string :image_url
      t.string :description
      t.string :available

      t.timestamps
    end
  end
end
