class AddIndexPublishedToAuctions < ActiveRecord::Migration[5.0]
  def change
    add_index :auctions, :published
  end
end
