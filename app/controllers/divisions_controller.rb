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
    @division = Division.find params[:id]
  end

  def update
    division = Division.find params[:id]

    division.update division_params
    redirect_to division
  end

  def destroy
    division = Division.find params[:id]

    division.destroy
    redirect_to :action => 'index'
  end

  private

  def division_params
    params.require(:division).permit(:division_number)
  end
end
