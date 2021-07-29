RSpec.describe User, type: :model do

  before(:each) do
    @test_user = User.new(name: "AAAA", email: "123@123.com", password: "123123", password_confirmation: "123123")
  end

    describe 'Validations' do
      # validation examples here
      it "cannot have user without name" do
        @test_user.name = nil
        expect(@test_user).to_not be_valid
        expect(@test_user.errors.full_messages).to include("Name can't be blank")
      end

      it "cannot have user without password" do
        @test_user.password = nil
        expect(@test_user).to_not be_valid
        expect(@test_user.errors.full_messages).to include("Password can't be blank")
      end
    
      it "cannot have user with password < 6" do
        @test_user.password = "123"
        expect(@test_user).to_not be_valid
        expect(@test_user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "cannot have user without email" do
        @test_user.email = nil
        expect(@test_user).to_not be_valid
        expect(@test_user.errors.full_messages).to include("Email can't be blank")
      end
    
      it "should have password & password_confirmation match" do
        @match_password = User.new(name: "AAA", email: "123@123.com", password: "123123", password_confirmation: "321321")
        expect(@match_password).to_not be_valid
      end
 
    end
  
    describe '.authenticate_with_credentials' do
      # examples for this class method here

      it "authenticates successfully" do
        @user1 = User.new(name: "312421", email: "123@123.com", password: "123123", password_confirmation: "123123")
        @user1.save
        @user2 = User.authenticate_with_credentials("123@123.com", "123123")
        expect(@user2).to eq(@user1)
      end

      it "authenticates successfully with capital letters" do
        @user1 = User.new(name: "312421", email: "123A@123.com", password: "123123", password_confirmation: "123123")
        @user1.save
        @user2 = User.authenticate_with_credentials("123a@123.com", "123123")
        expect(@user2).to eq(@user1)
      end


    end
  
  end