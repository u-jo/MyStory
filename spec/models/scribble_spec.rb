require 'spec_helper'

describe scribble do

  let(:user) { FactoryGirl.create(:user) }
  before { @scribble = user.scribbles.build(content: "Lorem ipsum") }

  subject { @scribble }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @scribble.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @scribble.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @scribble.content = "a" * 141 }
    it { should_not be_valid }
  end

end