class AddAuthorToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :author, :string,
    :limit => 30, :default => 'anonymus', :null => false
  end

  def self.down
    remove_column :products, :author
  end
end
