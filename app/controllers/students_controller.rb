class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
       studen=Student.all
        render json:studen, status: 200
      end
      def show
         studen=Student.find(params[:id])
          render json:studen
      end
      def create
         studen=Student.create!(student_params)
          render json:studen
      end
      def destroy
         studen=Student.destroy(params[id])
          render json:studen
      end
  
      private
  
      def student_params
        params.permit(:name, :age, :major, :instructor_id)
      end
  
      def render_not_found
          render json: { error: "Student is not found" }, status: :not_found
      end
  
      def render_unprocessable_entity(invalid)
          render json: { errors: invalid.record.errors }, status: :unprocessable_entity
      end
end
