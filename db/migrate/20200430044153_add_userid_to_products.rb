class AddUseridToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :users, null: false, foreign_key: true
  end
end