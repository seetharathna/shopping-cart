class CreateGuides < ActiveRecord::Migration
  def self.up
    create_table :guides do |t|
      t.string :name
      t.string :category
      t.decimal :price,:precision => 8, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :guides
  end
end
