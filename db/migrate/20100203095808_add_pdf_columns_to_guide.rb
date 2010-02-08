class AddPdfColumnsToGuide < ActiveRecord::Migration
  def self.up
    add_column :guides, :pdf_file_name, :string
    add_column :guides, :pdf_content_type, :string
    add_column :guides, :pdf_file_size, :integer
    add_column :guides, :pdf_updated_at, :datetime
  end

  def self.down
    remove_column :guides, :pdf_updated_at
    remove_column :guides, :pdf_file_size
    remove_column :guides, :pdf_content_type
    remove_column :guides, :pdf_file_name
  end
end
