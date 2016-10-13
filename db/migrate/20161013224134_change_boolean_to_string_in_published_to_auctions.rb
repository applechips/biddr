class ChangeBooleanToStringInPublishedToAuctions < ActiveRecord::Migration[5.0]
  def change
    remove_column :auctions, :published
    add_column :auctions, :published, :string
  end
end
