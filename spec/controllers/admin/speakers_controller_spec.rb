require 'rails_helper'

RSpec.describe Admin::SpeakersController, type: :controller do
  describe 'GET #index' do
    it 'response 200' do
      get :index

      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #new' do
    it 'response 200' do
      get :new

      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    it 'create new record when post' do
      speaker = build(:speaker)

      expect{
        post :create, speaker: speaker.attributes
      }.to change(Speaker, :count).by(1)

      # test for every attributes
      speaker_after = Speaker.last

      # remove auto create fields
      speaker_after.id = nil
      speaker_after.updated_at = nil
      speaker_after.created_at = nil

      expect(speaker_after.attributes).to eq(speaker.attributes)
    end

    it 'redirect to admin_speakers_path when update success' do
      post :create, speaker: attributes_for(:speaker)

      expect(response).to redirect_to(admin_speakers_path)
    end
  end

  describe 'GET #edit' do
    it 'response 200' do
      speaker = create(:speaker)

      get :edit, id: speaker.id

      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH #update' do
    it 'update record' do
      speaker = create(:speaker)
      speaker_update = build(:speaker)

      patch :update, id: speaker, speaker: speaker_update.attributes

      # remove attributes that don't need to test
      speaker = assigns(:speaker)
      speaker.id = nil
      speaker.created_at = nil
      speaker.updated_at = nil

      expect(speaker.attributes).to eq(speaker_update.attributes)
    end
  end

  describe 'DELETE #destroy' do
    it 'delete a record' do
      speaker = create(:speaker)

      expect{
        delete :destroy, id: speaker
      }.to change(Speaker, :count).by(-1)
    end
  end
end
