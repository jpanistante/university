class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :gender
      t.string :email
      t.string :username
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
