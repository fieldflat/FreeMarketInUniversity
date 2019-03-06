class AddPriceToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :price, :string
  end
end
