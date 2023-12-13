class Api::ScorecardsController < ApplicationController
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
            WHEN (subject1 + subject2 + subject3 + subject4) >= 300 AND (subject1 + subject2 + subject3 + subject4) < 340 THEN 'B'
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

      SELECT
        sgs.id,
        sgs.first_name,
        sgs.last_name,
        sgs.subject1,
        sgs.subject2,
        sgs.subject3,
        sgs.subject4,
        sgs.grand_total,
        sgs.grade,
        CASE
          WHEN sgs.grand_total >= cte.average_total_score THEN 'ABOVE'
          ELSE 'BELOW'
        END AS average_compare
      FROM
        student_grade_summary sgs
      INNER JOIN
        cte ON sgs.grade = cte.grade
    SQL

    @scorecards = ActiveRecord::Base.connection.exec_query(query)

    respond_to do |format|
      format.html
      format.json { render json: @scorecards }
    end
  end
end
