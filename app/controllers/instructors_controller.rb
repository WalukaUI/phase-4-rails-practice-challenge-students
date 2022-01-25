class InstructorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    
    def index
      ins=Instructor.all
      render json: ins
    end
    def show
        ins=Instructor.find(params[:id])
        render json: ins, include: :students
    end
    def create
        ins=Instructor.create!(inst_params)
        render json: ins
    end
    def destroy
        ins=Instructor.destroy(params[id])
        render json: ins
    end

    private

    def inst_params
      params.permit(:name)
    end

    def render_not_found
        render json: { error: "Instructor is not found" }, status: :not_found
    end

    def render_unprocessable_entity(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end
