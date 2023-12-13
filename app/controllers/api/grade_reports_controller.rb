module Api
  class GradeReportsController < ApplicationController
    def index
      query = <<-SQL
      WITH student_grade_summary AS (
        SELECT
          student_scores.id AS id,
          students.first_name,
          students.last_name,
          subject1,
          subject2,
          subject3,
          subject4,
          (subject1 + subject2 + subject3 + subject4) AS grand_total,
          CASE
            WHEN (subject1 + subject2 + subject3 + subject4) >= COALESCE(average_score.avg_score, 0) THEN 'ABOVE'
            ELSE 'BELOW'
          END AS average_compare,
          CASE
            WHEN (subject1 + subject2 + subject3 + subject4) >= 340 THEN 'A'
            WHEN (subject1 + subject2 + subject3 + subject4) >= 300   AND (subject1 + subject2 + subject3 + subject4) < 340 THEN 'B'
            ELSE 'C'
          END AS grade
        FROM
          student_scores
        INNER JOIN
          students ON student_scores.student_id = students.id
        LEFT JOIN (
          SELECT
            student_id,
            AVG(subject1 + subject2 + subject3 + subject4) AS avg_score
          FROM
            student_scores
          GROUP BY
            student_id
        ) AS average_score ON student_scores.student_id = average_score.student_id
      ),

      cte AS (
        SELECT
          grade,
          AVG(grand_total) AS average_total_score
        FROM
          student_grade_summary
        GROUP BY
          grade
      )

        SELECT 'Number of students in A Grade' AS Description, COUNT(CASE WHEN sgs.grade = 'A' THEN 1 END) AS Count
        FROM student_grade_summary sgs
        UNION ALL
        SELECT 'Number of students in B Grade', COUNT(CASE WHEN sgs.grade = 'B' THEN 1 END)
        FROM student_grade_summary sgs
        UNION ALL
        SELECT 'Number of students in C Grade', COUNT(CASE WHEN sgs.grade = 'C' THEN 1 END)
        FROM student_grade_summary sgs
        UNION ALL
        SELECT 'Number of students above their grade average', COUNT(CASE WHEN sgs.grand_total >= cte.average_total_score THEN 1 END)
        FROM student_grade_summary sgs
        INNER JOIN cte ON sgs.grade = cte.grade
        UNION ALL
        SELECT 'Number of students below their grade average', COUNT(CASE WHEN sgs.grand_total < cte.average_total_score THEN 1 END)
        FROM student_grade_summary sgs
        INNER JOIN cte ON sgs.grade = cte.grade;
      SQL

      @grade_report = ActiveRecord::Base.connection.exec_query(query)

      respond_to do |format|
        format.json { render json: @grade_report }
        format.html # Render index.html.erb with optimized data
      end
    end
  end
end
