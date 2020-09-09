class AddRelationToEdPusruit < ActiveRecord::Migration[6.0]
  def change
    add_reference :ed_pursuits, :user, foreign_key: true
  end
end
