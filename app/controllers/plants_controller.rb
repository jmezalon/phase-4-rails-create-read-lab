class PlantsController < ApplicationController
    wrap_parameters format: []

    def index 
        # GET /plants
        render json: Plant.all, status: :ok 
    end

    def show 
        # GET /plants/:id
        plant = Plant.find(params[:id])

        if plant 
            render json: plant, status: :ok 
        else
            render json: {error: "plant not found"}, status: :not_found
        end
    end

    def create 
        # POST /plants
        render json: Plant.create(plant_params), status: :created
    end

    private 

    def plant_params
        params.permit(:name, :image, :price)
    end
end
