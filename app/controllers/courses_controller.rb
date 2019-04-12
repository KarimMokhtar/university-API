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
            head(:unprocessable_entity)
        end
    end

    def update
        @course = Course.find(params[:id])
        if @course.update(course_params)
            head(:ok)
        else 
            head(:unprocessable_entity)
        end

    end

    private
        def course_params
            params.require(:course).permit(:name,:number)
        end
end
