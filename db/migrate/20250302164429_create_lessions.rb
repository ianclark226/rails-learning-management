class CreateLessions < ActiveRecord::Migration[8.0]
  def change
    create_table :lessions do |t|
      t.string :title
      t.text :description
      t.boolean :paid
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
