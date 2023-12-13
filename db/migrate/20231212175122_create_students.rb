# db/migrate/20231212120000_create_students.rb
class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :first_name, limit: 50
      t.string :last_name, limit: 50
      t.timestamps
    end
  end
end
