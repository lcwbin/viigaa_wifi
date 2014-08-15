class CreateCreditdetails < ActiveRecord::Migration
  def change
    create_table :creditdetails do |t|
      t.string :cid
      t.integer :credit
      t.string :intype
      t.string :way
      t.string :userid

      t.timestamps
    end
  end
end
