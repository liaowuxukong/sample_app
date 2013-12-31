require 'spec_helper'

describe Micropost do
  let(:user) { FactoryGirl.create(:user)}
  before do
    @micropost = user.microposts.build(contect:"Lorem ipsum")
  end

  subject {@micropost}

  it { should respond_to(:contect)}
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) {should == user}

  it { should be_valid}

  describe "when user_id is not present" do
    before { @micropost.user_id = nil}
    it { should_not be_valid}
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Micropost.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end

  end

  describe "when  user_id is not present" do
    before{ @micropost.user_id = nil}
    it { should_not be_valid}
  end

  describe "with blank contect" do
    before { @micropost.contect = " "}
    it { should_not be_valid}
  end

  describe "with contect that is too long" do
    before{ @micropost.contect = "A" *141}
    it{ should_not be_valid}
  end

  

end
