class Password < ApplicationRecord
    self.table_name ="password_resets"


    def generate_password_token
        self.token = generate_token
    end

    def password_token_valid?
        (self.updated_at + 4.hours) > Time.now.utc
    end
    
    def set_token
        self.token  =  nil
    end

    def generate_token
        SecureRandom.hex(10)
    end


end
