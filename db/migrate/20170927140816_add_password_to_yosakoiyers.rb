class AddPasswordToYosakoiyers < ActiveRecord::Migration[5.0]
  def change
    add_column :yosakoiyers, :password, :string
  end
end
