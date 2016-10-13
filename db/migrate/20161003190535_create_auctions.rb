class CreateAuctions < ActiveRecord::Migration[5.0]
  def change
    create_table :auctions do |t|
      t.string :title
      t.string :details
      t.string :ends_on
      t.string :reserve_price

      t.timestamps
    end
  end
end
