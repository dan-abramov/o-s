require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe 'GET #index' do
    before do
      get :index
    end

    let!(:items) { create_list(:item, 2) }
    it 'renders all items' do
      expect(assigns(:items)).to match_array(items)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    before do
      @item_params = FactoryBot.attributes_for(:item)
      @incorrect_item = FactoryBot.attributes_for(:incorrect_item)
    end

    it 'creates new item' do
      expect{ post :create, params: { item: @item_params } }.to change(Item, :count).by(1)
    end

    it 'redirects to show view' do
      post :create, params: { item: @item_params }
      expect(response).to redirect_to(item_url(assigns(:item)))
    end

    it 'does not create new item' do
      expect{ post :create, params: { item: @incorrect_item } }.to change(Item, :count).by(0)
    end
  end

  describe 'PATCH #update' do
    let(:category) { create(:category) }
    let!(:item)    { create(:item) }

    it 'updates item' do
      patch :update, params: { id: item.id, item: { title: 'hello', body: 'my friend', category_id: category.id } }
      item.reload
      expect(item.title).to eq 'hello'
      expect(item.body).to eq 'my friend'
      expect(item.category).to eq category
    end

    it 'redirects to show view' do
      patch :update, params: { id: item.id, item: { title: 'hello', body: 'my friend', category_id: category.id } }
      expect(response).to redirect_to(item_url(assigns(:item)))
    end

    it 'will not update' do
      patch :update, params: { id: item.id, item: { title: 'hello', body: nil, category_id: category.id } }
      item.reload
      expect(item.body).to eq 'MyText'
    end
  end

  describe 'DELETE #destroy' do
    let!(:item) { create(:item) }

    it 'destoys item' do
      expect{ delete :destroy, params: { id: item.id } }.to change(Item, :count).by(-1)
    end

    it 'redirects to index view' do
      delete :destroy, params: { id: item.id }
      expect(response).to redirect_to(items_url)
    end
  end

  describe 'GET #show' do
    let!(:item) { create(:item) }
    it 'renders item' do
      get :show, params: { id: item.id }
      expect(assigns(:item)).to eq item
    end

    it 'renders show view' do
      get :show, params: { id: item.id }
      expect(response).to render_template :show
    end
  end
end
