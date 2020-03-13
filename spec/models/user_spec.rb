require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
  it "is valid with a name, password" do
    user = User.new(
      name: "テスト太郎",
      password: "testtarou1234",
      email: "nil"
    )
    
    expect(user).to be_valid
  end
  
  it "is invalid without a name"
  
  it "returns a user's name as a string"
  
end
