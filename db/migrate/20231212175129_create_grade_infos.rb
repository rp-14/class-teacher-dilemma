# db/migrate/20231212120100_create_grade_infos.rb
class CreateGradeInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :grade_infos do |t|
      t.string :grade, limit: 1
      t.string :operator, limit: 2
      t.integer :total_score
      t.timestamps
    end
  end
end
