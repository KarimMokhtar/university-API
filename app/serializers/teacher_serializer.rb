class TeacherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email
  has_many :courses
end
