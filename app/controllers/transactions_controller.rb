class TransactionsController < ApplicationController

  def show
    @user = User.find_by_uid(params[:id])
    @transactions = @user&.transactions

    if @user.nil?
      return render json: {
        error: "resource not found"
        }, status: 404
    end
    render json: format_data.to_json
  end

  def new
  end
  
  def create
    transaction = CreateTransaction.call(transaction_params)
    render json: { uid: transaction&.user&.uid }, status: 200 
  rescue StandardError => e
    render json: {
      error: e.to_s
    }, status: 422
  end

  def update
    @user = User.find_by_uid(params[:id])
    @transaction = @user&.transactions.first
    
    if @user.nil?
      return render json: {
        error: "resource not found"
        }, status: 404
    end
      
    @transaction.update!(fulfilled: params[:fulfilled])
    render json: format_update.to_json
  end

  def destroy
    user = User.find_by_uid(params[:id])

    if user.nil?
      return render json: {
        error: "resource not found"
        }, status: 404
    end

    user.destroy!
    render status: 200, json: { message: "resource deleted successfully" }
  end

  private

  def transaction_params
    params.require(:transaction).permit(
      :first_name, 
      :last_name, 
      :email, 
      :street_1,
      :street_2,
      :city,
      :state,
      :zip, 
      :phone, 
      :cc_num, 
      :exp, 
      :total, 
      :amount,
      :quantity
    )
  end
end
