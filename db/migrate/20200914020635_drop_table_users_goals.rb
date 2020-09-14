class DropTableUsersGoals < ActiveRecord::Migration[6.0]
  def change
    drop_table :goals_users
  end
end
