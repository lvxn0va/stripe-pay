class Payment < ActiveRecord::Base
  # set your secret key: remember to change this to your live secret key in production
  # see your keys here https://manage.stripe.com/account
   Stripe.api_key = "M0TrGI8bJB5gWUjvC7dYqvhzcfnuDt4K"
   # get the credit card details submitted by the form
   # strip_card_token = params[:stripeToken]
  
  validates_presence_of :name, :email
  #validates_numericality_of :amount, :greater_than => 0
  # validates :amount, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {:greater_than => 0}
    
  attr_accessor :stripe_card_token
  
  def save_with_payment
    begin
      if valid?
        customer = Stripe::Customer.create(card: self.stripe_card_token, email: email, description: self.name)
        self.stripe_id = customer.id
        save!
      end
    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error: #{e.message}"
      errors.add :base, "There was a problem with your credit card."
      false
    end
  end
  def charge_payment
    begin
      customer_id = get_stripe_id
      Stripe::Charge.create(
        #:amount => (self.amount * 100).to_i,
        :currency => 'usd',
        :card => self.stripe_card_token,
        :customer => customer_id,
        :description => self.name
      )
    end
  end
end
