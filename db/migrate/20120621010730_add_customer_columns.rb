class AddCustomerColumns < ActiveRecord::Migration
  def self.up
      add_column :payments, :stripe_id, :string
      add_column :payments, :email, :string
      add_column :payments, :address_line1, :string
      add_column :payments, :address_line2, :string
      add_column :payments, :city, :string
      add_column :payments, :state, :string
      add_column :payments, :zip, :string
      add_column :payments, :stripe_card_token, :string
      add_column :payments, :description, :string
  end

  def down
  end
end
