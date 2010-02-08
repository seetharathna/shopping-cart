class CreatePurchaseDetails < ActiveRecord::Migration
  def self.up
    create_table :purchase_details do |t|
      t.string :guide_id
      t.string :customer_name
      t.string :customer_email
      t.string :payment
      t.string :ip

      t.timestamps
    end
  end

  def self.down
    drop_table :purchase_details
  end
end
