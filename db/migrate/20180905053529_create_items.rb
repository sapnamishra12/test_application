class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.belongs_to :item_category, index: true
      t.string :name, null: false, default: ''
      t.decimal :rate, null: false, default: 0.0
      t.timestamps
    end
  end
end
