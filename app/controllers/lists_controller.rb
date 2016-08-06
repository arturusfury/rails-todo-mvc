# Lists Controller
class ListsController < ApplicationController
  # Create
  def create
    @list = List.new(list_params(:name))

    if @list.save
      redirect_to @list
    else
      render :index
    end
  end

  # Retreive / Read
  def index
    @list = List.new
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  # Update

  # Destroy

  private

  def list_params(*args)
    params.require(:list).permit(*args)
  end
end
