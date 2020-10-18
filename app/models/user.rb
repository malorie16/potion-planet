class User < ApplicationRecord
    has_many :transactions, dependent: :destroy
    has_many :potions, through: :transactions

    validates :uid, :first_name, :last_name, :email, :street_1,:city,:state,:zip, :phone, :cc_num, :exp, presence: true, allow_blank: false
end
