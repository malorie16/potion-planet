class Potion < ApplicationRecord
    validates :amount, presence: true, allow_blank: false
end
