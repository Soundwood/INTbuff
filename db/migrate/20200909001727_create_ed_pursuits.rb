class CreateEdPursuits < ActiveRecord::Migration[6.0]
  def change
    create_table :ed_pursuits do |t|
      t.belongs_to :ed_type, foreign_key: true
      t.string :name
      t.string :subject
      t.string :provider
      t.string :instructor
      t.datetime :start_date
      t.integer :duration_d

      t.timestamps
    end
  end
end
