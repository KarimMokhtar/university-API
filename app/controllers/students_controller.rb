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
            render json: @student.errors.full_messages, status: :unprocessable_entity
            # head(:unprocessable_entity)
        end
    end

    def update
        @student = Student.find(params[:id])
        flag = params[:student][:email] != @student.email
        p params[:student][:email],@student.email
        if @student.update(student_params(flag))
            head(:ok)
        else
            render json: @student.errors.full_messages, status: :unprocessable_entity
            # head(:unprocessable_entity)
        end

    end

    private
        def student_params(flag=true)
            if flag
                params.require(:student).permit(:name,:email,course_ids:[])
            else
                params.require(:student).permit(:name,course_ids:[])
            end
        end
end
