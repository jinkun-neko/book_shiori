class CreateToPage < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.integer :pages_now
      
      t.timestamps
      t.references :book, null: false, foreign_key: true
    end
  end
end
