class User < ApplicationRecord
    has_many :posts, dependent: :destroy

    before_save :encrypt_password

    def password
        @password ||= BCrypt::Password.new(password_hash)
    end

    def password=(new_password)
        @password =  BCrypt::Password.create(new_password)
        self.password_hash = @password
    end

    def self.authenticate(email, password)

        user = find_by(email: email)
        
        if user && (user.password == password)
            user
        else
            nil
        end
    end

    def encrypt_password
        if password_hash.present?
            puts "encrypted before saving"
            self.password = password_hash
        end
    end

    private :encrypt_password

end
