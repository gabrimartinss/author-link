class CreateAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.string :description
      t.integer :age
      t.string :country

      t.timestamps
    end
  end
end
