class RenameColumnTypeInEdType < ActiveRecord::Migration[6.0]
  def change
    rename_column :ed_types, :type, :name
  end
end
