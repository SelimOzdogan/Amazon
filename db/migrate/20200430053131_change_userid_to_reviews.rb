class ChangeUseridToReviews < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :users_id, :user_id
  end
end
