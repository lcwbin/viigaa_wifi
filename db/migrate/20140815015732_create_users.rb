class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userid
      t.string :username
      t.string :password_digest
      t.string :nickname
      t.integer :flow
      t.integer :credits
      t.integer :errorTime
      t.datetime :loginTime
      t.string :status

      t.timestamps
    end
  end
end
