class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :customer_name
      t.string :customer_email
      t.string :department
      t.string :subject
      t.string :uuid
      t.text   :description

      t.timestamps
    end
  end
end
