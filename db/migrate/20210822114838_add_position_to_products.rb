class AddPositionToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :position, :integer, after: :description
    Product.order(:updated_at).each.with_index(1) do |product, index|
      product.update_column :position, index
    end
  end
end
