class Course < ApplicationRecord
    has_and_belongs_to_many :students
    has_and_belongs_to_many :teachers
    validates :name , presence: true
    validates :number , presence: true, uniqueness: true
end
