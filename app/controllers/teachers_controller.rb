class TeachersController < ApplicationController
    def index
        @teachers = Teacher.all
        render json: TeacherSerializer.new(@teachers).serialized_json, status: :ok
    end

    def create
        if auth_user == false
            render json:{"message"=>"not loged in"}, status: :unprocessable_entity
        else
            @teacher = Teacher.new(teacher_params)
            if @teacher.save
                render json: TeacherSerializer.new(@teacher).serialzed_json, status: :created
            else
                render json: @teacher.errors.full_messages , status: :unprocessable_entity
            end
        end
    end

    def update
        if auth_user == false
            render json:{"message"=>"not loged in"}, status: :unprocessable_entity
        else
            @teacher = Teacher.find(params[:id])
            flag = params[:teacher][:email] != @teacher.email
            if @teacher.update(teacher_params(flag))
                head(:ok)
            else
                render json: @teacher.errors.full_messages , status: :unprocessable_entity
                #head(:unprocessable_entity)
            end
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

        def auth_user
            user = User.where(authentication_token: params[:token]).first
            if user == nil
                return false
            else
                return true
            end
        end
end
