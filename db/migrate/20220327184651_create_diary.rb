class CreateDiary < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.string :title
      t.text :content
      
      t.timestamps
      t.references :book, null: false, foreign_key: true
    end
  end
end
