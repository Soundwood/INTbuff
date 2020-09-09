class CreateEdTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :ed_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
