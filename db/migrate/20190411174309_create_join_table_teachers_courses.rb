class CreateJoinTableTeachersCourses < ActiveRecord::Migration[5.2]
  def change
    create_join_table :teachers, :courses do |t|
      # t.index [:teacher_id, :course_id]
      # t.index [:course_id, :teacher_id]
    end
  end
end
