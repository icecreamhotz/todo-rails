class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :products, :deleted_at
  end
end
