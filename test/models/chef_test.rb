require 'test_helper'

class ChefTest < ActiveSupport::TestCase
    
    def setup
        @chef = Chef.new(chefname: "Martin", email: "martin@example.com")
    end 
    
    test "Chef should be valid" do
        assert @chef.valid?
    end
    
    test "Chefname should be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
    end
    
    test "Chef name should not be too long" do
        @chef.chefname = "a" * 41
        assert_not @chef.valid?
    end
    
    test "Chefname should not be too short" do
        @chef.chefname = "aa" 
        assert_not @chef.valid?
    end
    
    test "Email should be present" do
    @chef.email = " "
    assert_not @chef.valid?
    end
    
    test "Email should be within bounds" do
        @chef.email = "a" * 100 + "@example.com"
        assert_not @chef.valid?
    end
    
   test "Email should be unique" do
     dup_chef = @chef.dup
     dup_chef.email = @chef.email.upcase
     @chef.save
     assert_not dup_chef.valid?
   end
   
   test "Email validation should accept a valid address" do
     valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eee.au mary+jean@monk.cm]  
     valid_addresses.each do |va|
         @chef.email = va
         assert @chef.valid?, '#{va.inspect} should be valid'
   end
  end
   
   test "Email validation should reject a invalid address" do
       invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_ad_.com goo@ee+aar.com]
       invalid_addresses.each do |ai|
           @chef.email = ai
           assert_not @chef.valid?, '#{ai.inspect} should be invalid'
       end
     end
end
 
