class CoursesController < ApplicationController
    def index
        @courses = Course.all

        render json: @courses, status: :ok
    end
    def create
        @course = Course.new(course_params)
        if @course.save
            render json: @course, status: :created
        else
            render json: @course.errors.full_messages, status: :unprocessable_entity
            # head(:unprocessable_entity)
        end
    end

    def update
        @course = Course.find(params[:id])
        flag = params[:course][:email] != @course.number
        if @course.update(course_params(flag))
            head(:ok)
        else 
            render json: @course.errors.full_messages, status: :unprocessable_entity
            # head(:unprocessable_entity)
        end


    end

    private
        def course_params(flag=true)
            if flag
                params.require(:course).permit(:name,:number,student_ids:[],teacher_ids:[])
            else
                params.require(:course).permit(:name,student_ids:[],teacher_ids:[])
            end
        end
end
