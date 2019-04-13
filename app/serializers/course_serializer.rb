class CourseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :number
  has_many :students
  has_many :teachers
end
