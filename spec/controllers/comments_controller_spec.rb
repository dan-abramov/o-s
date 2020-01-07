require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:item) { create(:item) }

    it 'creates comment' do
      expect{ post :create, params: { comment: { body: 'MyText', item_id: item.id, user_id: user.id }, item_id: item.id } }.to change(item.comments, :count).by(1)
    end

    it 'redirects to item' do
      post :create, params: { comment: { body: 'MyText', item_id: item.id, user_id: user.id }, item_id: item.id }
      expect(response).to redirect_to("/items/#{item.id}")
    end

    it 'does not create comment' do
      expect{ post :create, params: { comment: { body: nil, item_id: item.id, user_id: user.id }, item_id: item.id } }.to change(item.comments, :count).by(0)
    end
  end

  describe 'PUT #update' do
    let(:item)    { create(:item) }
    let(:comment) { create(:comment, item: item) }

    before do
      put :update, params: { id: comment.id, comment: { body: 'UpdatedBody', user: comment.user, item: comment.item }, item_id: comment.item.id }
    end

    it 'updates comment' do
      comment.reload
      expect(comment.body).to eq 'UpdatedBody'
    end

    it 'redirects to item' do
      comment.reload
      expect(response).to redirect_to(items_url("/items/#{item.id}"))
    end
  end
end
