class AddPublishedColumnToAuctions < ActiveRecord::Migration[5.0]
  def change
    add_column :auctions, :published, :boolean, default: false
  end
end
