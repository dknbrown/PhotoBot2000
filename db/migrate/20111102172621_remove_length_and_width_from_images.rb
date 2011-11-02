class RemoveLengthAndWidthFromImages < ActiveRecord::Migration
  def self.up
    remove_column :images, :length
    remove_column :images, :width
  end

  def self.down
    add_column :images, :width, :string
    add_column :images, :length, :string
  end
end
