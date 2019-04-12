class StudentsController < ApplicationController
    def index
        @students = Student.all
        render json: @students, status: :ok
    end

    def create
        @student = Student.new(student_params)
        if @student.save
            render json: @student, status: :created
        else
            head(:unprocessable_entity)
        end
    end

    def update
        @student = Student.find(params[:id])
        if @student.update(student_params)
            head(:ok)
        else
            head(:unprocessable_entity)
        end

    end

    private
        def student_params
            params.require(:student).permit(:name,:email)
        end
end
