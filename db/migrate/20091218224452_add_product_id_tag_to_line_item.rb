class AddProductIdTagToLineItem < ActiveRecord::Migration
  def self.up
    add_column :line_items, :product_id_tag, :integer
  end

  def self.down
    remove_column :line_items, :product_id_tag
  end
end
