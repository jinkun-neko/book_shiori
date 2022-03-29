class CreateBook < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author
      t.date :new_date, null: false
      t.integer :pages, null: false
      t.string :image, null: false
      
      t.timestamps
      t.references :user, null: false, foreign_key: true
    end
  end
end
