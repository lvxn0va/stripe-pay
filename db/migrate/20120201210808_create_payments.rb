class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :amount, :precision => 8, :scale => 2
      t.string :email
      t.timestamps
    end
  end
end
