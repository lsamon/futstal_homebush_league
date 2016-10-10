class DivisionsController < ApplicationController
  def index
    @divisions = Division.all
  end

  def new
    @division = Division.new
  end

  def create
    division = Division.create division_params

    redirect_to division
  end

  def show
    @division = Division.find params[:id]
  end

  def edit
  end

  def destroy
  end

  private

  def division_params
    params.require(:division).permit(:division_number)
  end
end
