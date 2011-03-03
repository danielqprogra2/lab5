class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer :id
      t.string :title
      t.string :description
      t.string :image_url
      t.float :price
      t.integer :projection
      t.integer :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
