class StudentSerializer
    include FastJsonapi::ObjectSerializer

    attributes :name, :email
    has_many :courses

end