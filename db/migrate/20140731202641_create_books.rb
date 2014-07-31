class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :genre
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
