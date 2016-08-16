require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe 'GET #home' do
    it 'response 200' do
      get :home

      expect(response).to have_http_status(200)
    end
  end
end
