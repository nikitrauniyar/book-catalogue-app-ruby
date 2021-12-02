class CreateBooks < ActiveRecord::Migration[6.1]
  belongs_to :category
  def change
    create_table :books do |t|
      t.string :title
      t.integer :category_id
      t.string :author
      t.date :published_date
      t.float :price
      t.string :description
    end
  end
end
