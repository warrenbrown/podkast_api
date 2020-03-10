require 'test_helper'

class UserTest < ActiveSupport::TestCase
 test 'user with a valid email should be valid' do
   user = User.new(email: 'test@test.org', password_digest: 'test')
   assert user.valid?
 end

 test 'user with an invalid email should be invalid' do
   user = User.new(email: 'testatest.org', password_digest: 'test')
   assert_not user.valid?
  end

 test 'user with a duplicate email should be invalid' do
  other_user = users(:one)
   user = User.new(email: 'one@one.com', password_digest: 'test')
   assert_not user.valid?
  end
end
