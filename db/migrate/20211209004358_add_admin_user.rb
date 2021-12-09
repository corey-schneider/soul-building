class AddAdminUser < ActiveRecord::Migration[6.1]
  def change
    # user = User.new({email: 'soulbuilding@mail.com', password: 'thisIsAFakePassword1', password_confirmation: 'thisIsAFakePassword1'})
    User.create(email: 'soulbuilding@mail.com', password: 'thisIsAFakePassword1', first_name: "James", last_name: "Schneider")
  end
end
