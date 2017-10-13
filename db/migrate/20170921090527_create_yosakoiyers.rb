class CreateYosakoiyers < ActiveRecord::Migration[5.0]
  def change
    create_table :yosakoiyers do |t|
      t.string :yosaname
      t.string :mail

      t.timestamps
    end
  end
end
