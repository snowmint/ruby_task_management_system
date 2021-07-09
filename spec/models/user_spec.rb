require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe User, type: :model do
  before do
    @user = User.new(username: "Example User", email: "user@example.com",
                     password: "Foobar1234", password_confirmation: "Foobar1234")
  end
  subject { @user }

  it { should respond_to(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:password_confirmation) }
  # it { is_expected.to validate_presence_of(:username) }
  # it { is_expected.to validate_presence_of(:email) }
  # it { is_expected.to validate_presence_of(:password_digest) }
  # it { is_expected.to validate_presence_of(:password) }
  # it { is_expected.to validate_presence_of(:password_confirmation) }

  it { should be_valid }

  describe "when username is not present" do
    before { @user.username = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end

  describe "email address with mixed case" do
    let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

    it "should be saved as all lower-case" do
      @user.email = mixed_case_email
      @user.save
      @user.reload.email.should == mixed_case_email.downcase
    end
  end

end
