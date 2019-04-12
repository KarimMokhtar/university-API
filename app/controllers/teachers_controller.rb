class TeachersController < ApplicationController
    def index
        @teachers = Teacher.all
        render json: @teachers, status: :ok
    end

    def create
        @teacher = Teacher.new(teacher_params)
        if @teacher.save
            render json: @teacher, status: :created
        else
            render json: @teacher.errors.full_messages , status: :unprocessable_entity
        end
    end

    def update
        @teacher = Teacher.find(params[:id])
        flag = params[:teacher][:email] != @teacher.email
        if @teacher.update(teacher_params(flag))
            head(:ok)
        else
            render json: @teacher.errors.full_messages , status: :unprocessable_entity
            #head(:unprocessable_entity)
        end

    end

    private
        def teacher_params(flag = true)
            if flag
                params.require(:teacher).permit(:name,:email,course_ids:[])
            else
                params.require(:teacher).permit(:name,course_ids:[])
            end
        end
end
