class AddLinkToEdPursuits < ActiveRecord::Migration[6.0]
  def change
    add_column :ed_pursuits, :link, :string
    add_column :ed_pursuits, :short_description, :text
  end
end
