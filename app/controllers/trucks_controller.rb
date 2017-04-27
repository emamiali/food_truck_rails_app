class TrucksController < ApplicationController

  def index
    @trucks = Truck.all
  end

  def new
    @truck = Truck.new
  end

  def create
    @truck = Truck.create(truck_params)
    redirect_to trucks_path
  end

  def show
    @truck = Truck.find_by_id(params[:id])
  end

  def create
    Truck.create(truck_params)
    redirect_to trucks_path
  end

  def edit
    @truck = Truck.find_by_id(params[:id])
  end

  def update
  @truck = Truck.find(params[:id])
    if @truck.update(trucks_params)
      flash[:notice] = "Successfully updated truck."
      redirect_to trucks_path
    else
      flash[:error] = @truck.errors.full_messages.join(", ")
      redirect_to edit_trucks_path
    end
  end

  def destroy
    @truck = Truck.find(params[:id])
    @truck.destroy
    flash[:notice] = "Successfully deleted recipe."
    redirect_to trucks_path
end

  private

  def truck_params
    params.require(:truck).permit(:truck_name, :phone_number, :address, :is_cash_only, :picture, :info, :long, :lat, :category, :general_hours)
  end
end
