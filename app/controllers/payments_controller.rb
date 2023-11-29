class PaymentsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @payment = Payment.new
  end

  def create
    @category = Category.find(params[:category_id])
    @payment = Payment.new(payment_params)
    @payment.author = current_user

    if @payment.save
      flash[:notice] = 'Transaction successfully created.'
      redirect_to @category
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount, category_ids: [])
  end
end
