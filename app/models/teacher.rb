class Teacher < ApplicationRecord
    has_and_belongs_to_many :courses
    validates :name , presence: true
    validates :email , presence: true, uniqueness: true
end
