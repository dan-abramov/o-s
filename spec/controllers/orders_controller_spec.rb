require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe 'POST #create' do
    let(:user) { create(:user) }
    it 'creates new order' do
      expect { post :create, params: { order: { user_id: user.id } } }.to change(Order, :count).by(1)
    end
  end

  describe 'DELETE #destroy' do
    let!(:order) { create(:order) }
    
    it 'loads order' do
      delete :destroy, params: { id: order.id }
      expect(order).to eq assigns(:order)
    end

    it 'deletes order' do
      expect { delete :destroy, params: { id: order.id } }.to change(Order, :count).by(-1)
    end
  end
end
