class CreateTransaction < ApplicationService

    def initialize(transaction)
        @transaction = transaction
    end

    def call
        user = CreateUser.call(user_info)
        transaction = Transaction.create(total: @transaction["total"], quantity: @transaction["quantity"], user_id: user.id, fulfilled: false)
        potion = Potion.create(amount: @transaction["amount"])
        transaction

        unless transaction.save
            raise StandardError, 'Something went wrong, please check to see if you entered the correct information and that you\'re not buying too many potions!'
        end 
    end

    def user_info
        {
            first_name: @transaction["first_name"],
            last_name: @transaction["last_name"],
            email: @transaction["email"],
            street_1: @transaction["street_1"],
            street_2: @transaction["street_2"],
            city: @transaction["city"],
            state: @transaction["state"],
            zip: @transaction["zip"],
            phone: @transaction["phone"],
            cc_num: @transaction["cc_num"],
            exp: @transaction["exp"],
            uid: SecureRandom.hex(10)
        }
    end
end