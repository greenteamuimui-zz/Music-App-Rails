require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) {User.new(email: "gg@gg.com", password:"123456")}

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "#is_password?" do
    it "checks whether the password is right" do
      expect(user.is_password?("123456")).to eq(true)
      expect(user.is_password?("456788")).to eq(false)
    end
  end

  describe "#reset_session_token!" do
    it "reset the users's session token" do
      old = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(old)
    end
  end

  describe ".find_by_credentials" do
    before {user.save!}
    it "find the user by the email" do
      expect(User.find_by_credentials("gg@gg.com", "123456")).to eq(user)
    end

    it "returns nil when info is incorrect" do
      expect(User.find_by_credentials("gg@gg.com", "345678")).to eq(nil)
    end
  end

end
