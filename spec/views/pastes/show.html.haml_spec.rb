require 'spec_helper'

describe "pastes/index.html.haml" do
  xit "should contain" do
    get :index
    response.status.should be(200)
  end
end
