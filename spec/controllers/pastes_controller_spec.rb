require 'spec_helper'

describe PastesController  do
  include Devise::TestHelpers

  before do
    devise_set_mapping(:user)
    @user = Factory.create(:user)
  end

  describe 'CanCan ability' do
    it 'should throw exception' do
      paste = Factory.create(:paste)
      put :update, id: paste.id, paste: { code: "some more code" }
      response.code.should == '302'
    end
  end

  describe "#index" do
    context "user logged in" do
      it "should be success" do
        sign_in @user
        get :index
        response.should be_success
      end
    end

    context "user logged out" do
      it "should be success" do
        get :index
        response.should be_success
      end
    end
  end

  it "#new" do
    get :new
    response.should be_success
  end

  it "#show" do
    paste = Factory.create(:paste)
    get :show, id: paste.id
    response.should be_success
  end

  describe "#create" do
    context "paste hash is valid" do
      it "should create new paste and redirect to it" do

        lambda {
          post :create, paste: { title: "title", language: "text", code: "some code" }
        }.should change(Paste, :count).by(1)
        response.code.should == '302'
      end
    end

    context "paste hash is not valid" do
      it "should not redirect" do
        post :create, paste: { title: "title" }
        response.should be_success
      end
    end
  end

  context "needs authorized user for" do
    before do
      @paste = Factory.create(:paste)
      sign_in @user
      @paste.user = controller.current_user
      @paste.save
    end

    describe "#update action" do
      it "should redirect to updated paste" do
        put :update, id: @paste.id, paste: { code: "some more code" }
        response.code.should == '302'
      end

      it "should not redirect" do
        put :update, id: @paste.id, paste: { code: "" }
        response.should be_success
      end
    end

    describe "#edit action" do
      it "should be success" do
        get :edit, id: @paste.id
        response.should be_success
      end
    end

    describe "#destroy action" do
      it "should redirect to pastes_path" do
        delete :destroy, id: @paste.id
        response.should redirect_to(pastes_path)
      end
    end
  end
end
