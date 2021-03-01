class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    belongs_to :location
    has_one_attached :avatar
    validates :username , :uniqueness => {message: "%{value} has been taken"}, :presence => { message: "Field cannot be blank" }
    validates :email ,  :uniqueness => {message: "%{value} has been taken"} , :presence => { message: "Field cannot be blank" }
    validates :password_hash , :presence => { message: "Field cannot be blank" }
    before_save :encrypt_password,  if: :password_hash_changed?  
    def password
        @password ||= BCrypt::Password.new(password_hash)
    end

    def password=(new_password)
        @password =  BCrypt::Password.create(new_password)
        self.password_hash = @password
    end
    
    def encrypt_password
        if password_hash.present?
            self.password = password_hash
        end
    end
    
    def self.authenticate(args)

        user = find_by(email: args[:email])
        
        if user && (user.password == args[:password])
            user
        else
            nil
        end
    end


    private :encrypt_password

end
