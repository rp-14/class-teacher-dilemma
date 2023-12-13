class AddGradeToStudentScores < ActiveRecord::Migration[7.1]
  def change
    add_column :student_scores, :grade, :string
  end
end
