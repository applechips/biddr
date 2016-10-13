class ChangeReservePriceToFloat < ActiveRecord::Migration[5.0]
  def change
    remove_column :auctions, :reserve_price, :integer
    add_column :auctions, :reserve_price, :float
  end
end
