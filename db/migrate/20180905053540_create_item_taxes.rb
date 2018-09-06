class CreateItemTaxes < ActiveRecord::Migration[5.1]
  def change
    create_table :item_taxes do |t|
      t.belongs_to :item, index: true
      t.integer  :tax_type, null: false, default: 0
      t.decimal :tax, null: false, default: 0.0
      t.timestamps
    end
  end
end
