class CreateCategories < ActiveRecord::Migration[6.1]
  has_many :books
  def change
    create_table :categories do |t|
      t.string :name
    end
  end
end
