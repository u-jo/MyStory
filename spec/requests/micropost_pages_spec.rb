require 'spec_helper'

describe "scribble pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "scribble creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a scribble" do
        expect { click_button "Post" }.not_to change(scribble, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'scribble_content', with: "Lorem ipsum" }
      it "should create a scribble" do
        expect { click_button "Post" }.to change(scribble, :count).by(1)
      end
    end
  end

  describe "scribble destruction" do
    before { FactoryGirl.create(:scribble, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a scribble" do
        expect { click_link "delete" }.to change(scribble, :count).by(-1)
      end
    end
  end
end