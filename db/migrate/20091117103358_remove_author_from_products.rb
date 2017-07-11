class RemoveAuthorFromProducts < ActiveRecord::Migration
  def self.up
    remove_column :products, :author
  end

  def self.down
    add_column :products, :author, :string
  end
end
