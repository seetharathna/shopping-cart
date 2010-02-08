class AddExpressTokenToPurchaseDetails < ActiveRecord::Migration
  def self.up
    add_column :purchase_details, :express_token, :string
    add_column :purchase_details, :express_payer_id, :string
  end

  def self.down
    remove_column :purchase_details, :express_payer_id
    remove_column :purchase_details, :express_token
  end
end
