require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has to exist' do
    expect{User.new}.to_not raise_error
  end
  it 'has an encrypted password that is a String' do
    user = User.new
    expect(user.encrypted_password).to be_a(String)
  end
  it 'has an email that is a String' do
    user = User.new
    expect(user.email).to be_a(String)
  end
end
