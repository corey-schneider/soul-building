class AddDefaultAdminUser < ActiveRecord::Migration[6.1]
  def change
    User.create(email: 'soulbuilding@mail.com', password: 'thisIsAFakePassword1', first_name: 'James',
                last_name: 'Schneider')
  end
end
