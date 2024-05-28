class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :description
      t.integer :year
      t.integer :pages

      t.timestamps
    end
  end
end
