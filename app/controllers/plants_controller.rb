class PlantsController < ApplicationController
    # GET /plants
    def index        
        render json: Plant.all
    end

    #GET /plants/:id
    def show
       render json: find_plant #A privately defined method to hold the logic for finding a given plant\
       rescue ActiveRecord::RecordNotFound  #catches the specified active recrd error
        send_error  #A custome error incoked when the action catches the active record error.
    end

    #POST /plants
    def create
      plant= Plant.create(plant_params)
      render json: plant, status: :created  #This returns a 201 status code from the server
    end


     private

     #Logic to find a specified plant
     def find_plant
        plant = Plant.find(params[:id])
     end
     
     #Clean the required parameters
     def plant_params
        params.permit(:name, :image,:price)
     end

     #Send an error message.
     def send_error
        render json: {error: "Plant was not found!"},status: :not_found
     end
end
