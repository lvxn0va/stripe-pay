class PaymentsController < ApplicationController
  
  def thankyou
  end
  
  # GET /payments
  def index
    @payments = Payment.all
    render :index, layout: 'admin'
  end

  # GET /payments/new
  def new
    @payment = Payment.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /payments
  def create
    @payment = Payment.new(params[:payment])
    respond_to do |format|
      if @payment.save_with_payment
        format.html { redirect_to thankyou_path }
      else
        format.html { render action: "new" }
      end
    end
  end
end
