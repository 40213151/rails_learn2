class AddYosakoiyerIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts,:yosakoiyer_id,:integer
  end
end
