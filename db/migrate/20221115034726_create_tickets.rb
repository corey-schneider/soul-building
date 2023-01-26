class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :title
      t.text :body
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
