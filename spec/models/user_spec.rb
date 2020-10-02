require 'rails_helper'

describe "A user" do
  before do 
    @user_attributes = {name: "Example User", email: "user@example.com", password: "secret456", password_confirmation: "secret456"}
    @bad_email = {name: "Example User", email: "user@example.com", password: "secret456", password_confirmation: "secret"}
  end

  it "requires a user name" do
    user = User.new(name: "")
    user.valid? # populates errors

    expect(user.errors[:name].first).to eq("can't be blank")
    expect(user.errors[:name].any?).to eq(true)
  end

  describe 'email' do
    it "requires an user email" do
      user = User.new(email: "")
      user.valid?
      
      expect(user.errors[:email].any?).to eq(true)
      expect(user.errors[:email][0]).to eq("can't be blank")
      expect(user.errors[:email][1]).to eq("is invalid")
    end
  
    it "accepts properly formatted email addresses" do
      emails = %w[user@example.com first.last@example.com]
      emails.each do |email|
        user = User.new(email: email)
        user.valid?
  
        expect(user.errors[:email].any?).to eq(false)
      end
    end
  
    it "rejects improperly formatted email addresses" do
      emails = %w[@ user@ @example.com]
      emails.each do |email|
        user = User.new(email: email)
        user.valid?
  
        expect(user.errors[:email].first).to eq("is invalid")
        expect(user.errors[:email].any?).to eq(true)
      end
    end
  
    it "requires a unique, case insensitive email address" do
      user1 = User.create!(@user_attributes)
      user2 = User.create(@bad_email)
      user2.valid?
  
      expect(user2.errors[:email].any?).to eq(true)
      expect(user2.errors[:email].first).to eq("has already been taken")
    end
  end

  describe 'passwords' do
    it "requires a password" do
      user = User.new(password: "")
      user.valid?
      
      expect(user.errors[:email].first).to eq("can't be blank")
      expect(user.errors[:password].any?).to eq(true)
    end
  
    it "requires a password confirmation when a password is present" do
      user = User.new(password: "secret", password_confirmation: "")
      user.valid?
  
      expect(user.errors[:password_confirmation].any?).to eq(true)
      expect(user.errors[:password_confirmation].last).to eq("doesn't match Password")
    end
  
    it "requires the password to match the password confirmation" do
      user = User.new(password: "secret", password_confirmation: "nomatch")
      user.valid?
  
      expect(user.errors[:password_confirmation].first).to eq("doesn't match Password")
    end
  
    it "requires a password and matching password confirmation when creating" do
      user = User.create!(@user_attributes)
  
      expect(user.valid?).to eq(true)
    end
  
    it "does not require a password when updating" do
      user = User.create!(@user_attributes)
      user.password = ""
  
      expect(user.valid?).to eq(true)
    end
  
    it "automatically encrypts the password into the password_digest attribute" do
      user = User.new(password: "secret")
  
      expect(user.password_digest.present?).to eq(true)
    end
  end
  it "is valid with example attributes" do
    user = User.new(@user_attributes)

    expect(user.valid?).to eq(true)
  end


end