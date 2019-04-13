class CoursesController < ApplicationController
    def index
        @courses = Course.all

        render json: CourseSerializer.new(@courses).serialized_json, status: :ok
    end
    def create
        if auth_user == false
            render json:{"message"=>"not loged in"}, status: :unprocessable_entity
        else
            @course = Course.new(course_params)
            if !:auth_user
                render json:{"ok"=>"no"}
            end
            if @course.save
                render json: @course, status: :created
            else
                render json: @course.errors.full_messages, status: :unprocessable_entity
                # head(:unprocessable_entity)
            end
        end
    end

    def update
        if auth_user == false
            render json:{"message"=>"not loged in"}, status: :unprocessable_entity
        else
            @course = Course.find(params[:id])
            flag = params[:course][:email] != @course.number
            if @course.update(course_params(flag))
                head(:ok)
            else 
                render json: @course.errors.full_messages, status: :unprocessable_entity
                # head(:unprocessable_entity)
            end
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
        
        def auth_user
            user = User.where(authentication_token: params[:token]).first
            if user == nil
                return false
            else
                return true
            end
        end
end
