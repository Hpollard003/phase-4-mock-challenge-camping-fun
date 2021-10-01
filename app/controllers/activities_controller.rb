class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        activities = Activity.all 
        render json: activities
    end

    def show
        activity = Activity.find(params[:id])
        render json: activity, status: :ok
    end

    def destroy
        activity = Activity.find(params[:id])
        activity.destroy
    end


    private

    def activity_params
        params.permit
    end

    def record_not_found
      render json: { error: "Activity not found" }, status: :not_found
    end
end
