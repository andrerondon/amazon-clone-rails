class User < ApplicationRecord

    has_many :products
    has_many :reviews

    has_secure_password

    # validates :last_name :email :password_digest, presence: true

end



