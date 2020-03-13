require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #history" do
    it "returns http success" do
      get :history
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #everyday" do
    it "returns http success" do
      get :everyday
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #support" do
    it "returns http success" do
      get :support
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #entry" do
    it "returns http success" do
      get :entry
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #publicinfo" do
    it "returns http success" do
      get :publicinfo
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #recruit" do
    it "returns http success" do
      get :recruit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #accsess" do
    it "returns http success" do
      get :accsess
      expect(response).to have_http_status(:success)
    end
  end

end
