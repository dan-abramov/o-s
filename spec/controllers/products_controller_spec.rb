require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'GET #index' do
    before do
      get :index
    end

    let!(:products) { create_list(:product, 2) }
    it 'renders all products' do
      expect(assigns(:products)).to match_array(products)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    before do
      @product_params = FactoryBot.attributes_for(:product)
      @incorrect_product = FactoryBot.attributes_for(:incorrect_product)
    end

    it 'creates new product' do
      expect{ post :create, params: { product: @product_params } }.to change(Product, :count).by(1)
    end

    it 'redirects to show view' do
      post :create, params: { product: @product_params }
      expect(response).to redirect_to(product_url(assigns(:product)))
    end

    it 'does not create new product' do
      expect{ post :create, params: { product: @incorrect_product } }.to change(Product, :count).by(0)
    end
  end

  describe 'PATCH #update' do
    let(:category) { create(:category) }
    let!(:product)    { create(:product) }

    it 'updates product' do
      patch :update, params: { id: product.id, product: { title: 'hello', body: 'my friend', category_id: category.id } }
      product.reload
      expect(product.title).to eq 'hello'
      expect(product.body).to eq 'my friend'
      expect(product.category).to eq category
    end

    it 'redirects to show view' do
      patch :update, params: { id: product.id, product: { title: 'hello', body: 'my friend', category_id: category.id } }
      expect(response).to redirect_to(product_url(assigns(:product)))
    end

    it 'will not update' do
      patch :update, params: { id: product.id, product: { title: 'hello', body: nil, category_id: category.id } }
      product.reload
      expect(product.body).to eq 'MyText'
    end
  end

  describe 'DELETE #destroy' do
    let!(:product) { create(:product) }

    it 'destoys product' do
      expect{ delete :destroy, params: { id: product.id } }.to change(Product, :count).by(-1)
    end

    it 'redirects to index view' do
      delete :destroy, params: { id: product.id }
      expect(response).to redirect_to(products_url)
    end
  end

  describe 'GET #show' do
    let!(:product) { create(:product) }
    it 'renders product' do
      get :show, params: { id: product.id }
      expect(assigns(:product)).to eq product
    end

    it 'renders show view' do
      get :show, params: { id: product.id }
      expect(response).to render_template :show
    end
  end
end
