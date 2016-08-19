require 'rails_helper'

RSpec.describe Admin::SpeakersController, type: :controller do
  describe 'GET #index' do
    it 'respond 200' do
      get :index

      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #new' do
    it 'respond 200' do
      get :new

      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    it 'create new record when post' do
      expect{
        post :create, speaker: { name: 'test' }
      }.to change(Speaker, :count).by(1)
    end

    it 'redirect to admin_speakers_path when update success' do
      post :create, speaker: { name: 'test' }

      expect(response).to redirect_to(admin_speakers_path)
    end
  end

  describe 'GET #edit' do
    it 'respond 200'
  end

  describe 'PATCH #update' do
  end

  describe 'DELETE #destroy' do
  end
end
