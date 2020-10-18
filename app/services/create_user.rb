class CreateUser < ApplicationService
    def initialize(info)
        @info = info
    end

    def call
        unless find_user
            User.create(@info)
        end
    end

    def find_user
        if User.exists?(first_name: @info[:first_name], last_name: @info[:last_name])
            raise StandardError, 'Sorry! You can\'t place more than one order!'
        end
    end
end