class Payment < ActiveRecord::Base
  
  validates_presence_of :email
  validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/i
  
  attr_accessor :stripe_card_token
  
  def save_with_payment
    begin
      if valid?
        Stripe::Charge.create(
          :amount => (self.amount * 100).to_i,
          :currency => 'usd',
          :card => self.stripe_card_token,
          :description => self.email
        )
        save!
      end
    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error: #{e.message}"
      errors.add :base, "There was a problem with your credit card."
      false
    end
  end
end
