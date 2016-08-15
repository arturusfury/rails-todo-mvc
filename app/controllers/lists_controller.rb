# Lists Controller
class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :set_items, only: [:show, :edit, :update, :destroy]

  # Create
  def create
    @list = List.new(list_params(:name))

    if @list.save
      redirect_to @list
    else
      @lists = List.all
      render :index
    end
  end

  # Retreive / Read
  def index
    @list = List.new
    @lists = List.all
  end

  def show
  end

  # Update

  # Destroy
  def destroy
    @list.items.each { |item| item.destroy }
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params(*args)
    params.require(:list).permit(*args)
  end

  def set_list
    @list = List.find(params[:id])
  end

  def set_items
    @items = List.find(params[:id]).items
    @item = Item.new # Builds a blank item for our form
  end
end
