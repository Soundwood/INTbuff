class CreateJoinTableUsersGoals < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :goals do |t|
      t.index [:user_id, :goal_id]
      t.index [:goal_id, :user_id]
    end
  end
end
