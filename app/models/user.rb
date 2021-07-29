class User < ActiveRecord::Base
    validates :name, presence: true
    validates :email, presence: true
    validates :email, :uniqueness => {:case_sensitive => false}
    validates :password, presence: true, length: { minimum: 6 }

    has_secure_password

    def self.authenticate_with_credentials(email, password)
        user = User.find_by(email: email.downcase) 
        return user && user.authenticate(password)
      end
end
