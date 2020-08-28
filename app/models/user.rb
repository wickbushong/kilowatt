class User < ActiveRecord::Base
    has_secure_password
    has_many :groups
    has_many :devices, through: :groups
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validate :email_validation

    def email_validation
        if !(email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/)
            errors.add(:email, "is not a valid address")
        end
    end
end