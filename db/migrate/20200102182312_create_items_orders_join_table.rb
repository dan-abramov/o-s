class CreateItemsOrdersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :items, :orders
  end
end
