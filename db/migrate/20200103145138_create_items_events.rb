class CreateItemsEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :items_events do |t|
      t.references :item, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
