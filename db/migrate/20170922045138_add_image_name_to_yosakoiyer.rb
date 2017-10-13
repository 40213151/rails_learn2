class AddImageNameToYosakoiyer < ActiveRecord::Migration[5.0]
  def change
    add_column :yosakoiyers, :image_name, :string
  end
end
