class CreateItemCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :item_categories do |t|
      t.string :name, null: false, default: ''
      t.timestamps
    end
  end
end
