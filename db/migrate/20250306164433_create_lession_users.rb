class CreateLessionUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :lession_users do |t|
      t.references :lession, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
