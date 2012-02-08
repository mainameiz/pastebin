require 'spec_helper'

describe "PasswordResets" do
  it "emails user when requesting password reset" do
    user = Factory(:user)
    visit new_user_session_path
    click_link "Forgot"
    fill_in "Email", :with => user.email
    click_button "reset password"
    current_path.should eq(new_user_session_path)
    page.should have_content("You will receive an email")
  end
end
