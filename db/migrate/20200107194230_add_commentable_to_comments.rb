class AddCommentableToComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :product_id
    add_reference :comments, :commentable, polymorphic: true
  end
end
