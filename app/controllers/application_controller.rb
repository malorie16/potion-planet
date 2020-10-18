class ApplicationController < ActionController::API
    include ActionController::MimeResponds

    def format_update
        {
            uid: @user.uid,
            fulfilled: @transaction.fulfilled,
            message: "resource updated successfully"
        }
    end

    def format_data
        format_user
            .deep_merge!(format_user)
            .deep_merge!(format_address)
            .deep_merge!(format_payment)
            .deep_merge!(format_transactions)
    end

    def format_user
        {
            firstName: @user.first_name,
            lastName: @user.last_name,
            email: @user.city,
            phone: @user.phone,
        }
    end

    def format_address
        {
            address: {
                street1: @user.street_1,
                street2: @user.street_2,
                city: @user.city,
                state: @user.state,
                zip: @user.zip
            }
        }
    end

    def format_payment
        {
            payment: {
                ccNum: @user.cc_num,
                exp: @user.exp,
            }
        }
    end

    def format_transactions
        {
            quantity: @transactions.first.quantity,
            total: @transactions.first.total.to_f.to_s,
            orderDate: @transactions.first.created_at,
            fulfilled: @transactions.first.fulfilled
        }
    end
end
