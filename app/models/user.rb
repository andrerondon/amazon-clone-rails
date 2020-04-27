class User < ApplicationRecord

    has_many :products
    has_many :reviews

    
    validates :last_name :email :password_digest, presence: true

end



