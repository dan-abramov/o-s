require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:product) { create(:product) }

    it 'creates comment' do
      expect{ post :create, params: { comment: { body: 'MyText', user_id: user.id }, product_id: product.id } }.to change(product.comments, :count).by(1)
    end

    it 'redirects to product' do
      post :create, params: { comment: { body: 'MyText', user_id: user.id }, product_id: product.id }
      expect(response).to redirect_to("/products/#{product.id}")
    end

    it 'does not create comment' do
      expect{ post :create, params: { comment: { body: nil, user_id: user.id }, product_id: product.id } }.to change(product.comments, :count).by(0)
    end
  end

  describe 'PUT #update' do
    let(:product) { create(:product) }
    let(:comment) { create(:comment, commentable_type: 'Product', commentable_id: product.id) }

    before do
      put :update, params: { id: comment.id, comment: { body: 'UpdatedBody', user: comment.user }, product_id: comment.commentable_id }
    end

    it 'updates comment' do
      comment.reload
      expect(comment.body).to eq 'UpdatedBody'
    end

    it 'redirects to product' do
      comment.reload
      expect(response).to redirect_to("/products/#{product.id}")
    end
  end
end
