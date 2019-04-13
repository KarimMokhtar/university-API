class StudentsController < ApplicationController
    def index
        @students = Student.all
        render json: StudentSerializer.new(@students).serialized_json, status: :ok
    end

    def create
        if auth_user == false
            render json:{"message"=>"not loged in"}, status: :unprocessable_entity
        else
            @student = Student.new(student_params)

            if @student.save
                render json: StudentSerializer.new(@student).serialized_json, status: :created
            else
                render json: @student.errors.full_messages, status: :unprocessable_entity
                # head(:unprocessable_entity)
            end
        end
    end

    def update
        if auth_user == false
            render json:{"message"=>"not loged in"}, status: :unprocessable_entity
        else 
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

    end

    private
        def student_params(flag=true)
            if flag
                params.require(:student).permit(:name,:email,course_ids:[])
            else
                params.require(:student).permit(:name,course_ids:[])
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
