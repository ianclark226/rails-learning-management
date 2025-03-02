class CreateCategoriesCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :categories_courses, id: false do |t|
      t.references :category, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
    end
  end
end
