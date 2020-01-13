class AddCommentableToComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :item_id
    add_reference :comments, :commentable, polymorphic: true
  end
end
