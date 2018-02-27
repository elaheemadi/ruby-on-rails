class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.string :description
      t.float :price
      t.string :code

      t.timestamps
    end
  end
end
