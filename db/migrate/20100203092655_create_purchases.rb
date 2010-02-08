class CreatePurchases < ActiveRecord::Migration
  def self.up
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :guide_id
      t.integer :purchase_details_id
      t.integer :key

      t.timestamps
    end
  end

  def self.down
    drop_table :purchases
  end
end
