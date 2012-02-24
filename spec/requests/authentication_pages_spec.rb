require 'spec_helper'
describe "Authentication" do

subject { page }

  describe "signin" do
  before { visit signin_path }

    describe "with invalid information" do
    before { click_button "Sign in" }

    it { should have_selector('title', text: 'Sign in') }
    it { should have_selector('div.flash.error', text: 'Invalid') }
    end

    describe "with valid information" do
    let(:user) { FactoryGirl.create(:user) }
      before { valid_signin(user) }

    it { should have_selector('title', text: user.name) }
    it { should have_selector('a', 'Sign out', href: signout_path) }
      describe "followed by signout" do
      before { click_link "Sign out", method: :delete }
      it { should have_link('Sign in') }
      end
    end
  end
end
