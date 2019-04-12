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
            head(:unprocessable_entity)
        end
    end

    def update
        @teacher = Teacher.find(params[:id])
        if @teacher.update(teacher_params)
            head(:ok)
        else
            head(:unprocessable_entity)
        end

    end

    private
        def teacher_params
            params.require(:teacher).permit(:name,:email)
        end
end
