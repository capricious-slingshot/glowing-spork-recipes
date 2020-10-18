require 'rails_helper'

describe "A recipe" do
  it "requires a recipe title" do
    user = Recipe.new(title: "")
    user.valid?

    expect(user.errors[:title].first).to eq("can't be blank")
    expect(user.errors[:title].any?).to eq(true)
  end
end