# db/migrate/20231212120200_create_student_scores.rb
class CreateStudentScores < ActiveRecord::Migration[6.0]
  def change
    create_table :student_scores do |t|
      t.references :student, foreign_key: true
      t.integer :subject1
      t.integer :subject2
      t.integer :subject3
      t.integer :subject4
      t.timestamps
    end
  end
end
