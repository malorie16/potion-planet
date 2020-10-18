require 'rails_helper'

RSpec.describe 'TransactionsController', type: :request do
  describe '#create' do
    context 'with valid params' do
      valid_params = { 
        transaction: {
          first_name: 'Malorie',
          last_name: 'C',
          email: 'malorie@malorie.com',
          street_1: '23 Awesome Way',
          street_2: '',
          city: 'Brooklyn',
          state: 'NY',
          zip: '11233',
          phone: '718-222-3030',
          cc_num: 1234,
          exp: '10/23',
          total: 55,
          amount: 5,
          quantity: 3
        }
      }

      before { post '/magic', params: valid_params}

      it 'creates a new user' do
        expect(User.count).to eq(1)
      end

      it 'creates a new transaction' do
        expect(Transaction.count).to eq(1)
      end

      it 'returns a 200 response' do
        expect(response).to have_http_status(200)
      end
    end

    context 'with invalid params' do
      invalid_params = { 
        transaction: {
          first_name: 'Malorie',
          last_name: 'C',
          email: 'malorie@malorie.com',
          street_1: '23 Awesome Way',
          street_2: '',
          city: 'Brooklyn',
          state: 'NY',
          zip: '11233',
          phone: '718-222-3030',
          cc_num: 1234,
          exp: '10/23',
          total: 500,
          amount: 5,
          quantity: 33
        }
      }

      before { post '/magic', params: invalid_params }

      it 'returns a 422 response' do
        expect(response).to have_http_status(422)
      end
    end 
  end

  describe '#show' do
    context 'with valid uid' do
      let!(:user) { create(:user, :with_transaction)}

      before { get "/magic/#{user.uid}"}

      it 'returns the user\'s information' do
        expect(json).to_not be_empty
      end

      it 'returns a 200 response' do
        expect(response).to have_http_status(200)
      end
    end

    context 'with invalid uid' do
      before { get '/magic/1234' }

      it 'returns a 404 response' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
