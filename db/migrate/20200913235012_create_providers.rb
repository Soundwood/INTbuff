class CreateProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :genre
      t.timestamps
    end
    remove_column :ed_pursuits, :provider, :string
    add_reference :ed_pursuits, :provider, foreign_key: true
  end
end
