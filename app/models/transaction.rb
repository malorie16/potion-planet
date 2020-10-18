class Transaction < ApplicationRecord
    belongs_to :user
    has_many :potions
    validates_presence_of :user
    validate :under_quantity_limit?

    QUANTITY_LIMIT = 3

    def under_quantity_limit?
        if quantity > QUANTITY_LIMIT 
            errors.add(:quantity, 'Can\'t be greater than 3')
        end
    end
end
