class ChangeNullInSubscription < ActiveRecord::Migration[6.0]
  def change
    change_column_null :subscriptions, :user_id, true
  end
end
