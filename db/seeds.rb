require 'faker'

students_data = []

50.times do |index|
  students_data << {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  }
end

students_data.each do |student_data|
  Student.create(student_data)
end


grade_infos_data = [
  { grade: 'A', operator: '>=', total_score: 340 },
  { grade: 'B', operator: '>=', total_score: 300 },
  { grade: 'C', operator: '<', total_score: 300 },
]

grade_infos_data.each do |grade_info_data|
  GradeInfo.create(grade_info_data)
end


student_scores_data = [
  [1, 88, 53, 69, 64],
  [2, 92, 86, 93, 77],
  [3, 53, 59, 72, 59],
  [4, 60, 52, 85, 62],
  [5, 85, 53, 74, 61],
  [6, 72, 91, 72, 89],
  [7, 72, 71, 77, 91],
  [8, 89, 60, 94, 59],
  [9, 63, 61, 80, 57],
  [10, 86, 84, 65, 72],
  [11, 83, 75, 89, 89],
  [12, 65, 63, 65, 80],
  [13, 57, 56, 56, 59],
  [14, 60, 52, 77, 75],
  [15, 67, 56, 85, 62],
  [16, 75, 84, 61, 90],
  [17, 64, 53, 56, 77],
  [18, 60, 51, 55, 66],
  [19, 83, 70, 69, 65],
  [20, 57, 76, 75, 59],
  [21, 63, 84, 52, 74],
  [22, 61, 64, 65, 53],
  [23, 73, 83, 86, 73],
  [24, 58, 67, 74, 85],
  [25, 52, 53, 55, 83],
  [26, 57, 81, 55, 70],
  [27, 61, 68, 55, 91],
  [28, 63, 68, 65, 72],
  [29, 71, 63, 87, 70],
  [30, 60, 65, 79, 81],
  [31, 52, 92, 78, 81],
  [32, 66, 65, 80, 73],
  [33, 73, 51, 55, 58],
  [34, 86, 80, 66, 71],
  [35, 91, 69, 69, 90],
  [36, 70, 78, 72, 78],
  [37, 66, 94, 89, 52],
  [38, 94, 52, 58, 82],
  [39, 70, 51, 57, 54],
  [40, 92, 90, 55, 84],
  [41, 66, 81, 86, 75],
  [42, 67, 54, 77, 94],
  [43, 56, 80, 67, 57],
  [44, 83, 72, 77, 86],
  [45, 55, 79, 79, 66],
  [46, 53, 57, 50, 84],
  [47, 57, 76, 78, 52],
  [48, 69, 51, 69, 90],
  [49, 68, 72, 56, 81],
  [50, 85, 63, 55, 54],
]

student_scores_data.each do |student_id, s1, s2, s3, s4|
  StudentScore.create(
    student_id: student_id,
    subject1: s1,
    subject2: s2,
    subject3: s3,
    subject4: s4
  )
end
