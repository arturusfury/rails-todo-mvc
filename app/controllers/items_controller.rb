# Items Controller
class ItemsController < ApplicationController
  before_action :set_list, only: [:create, :update]

  def create
    @item = Item.new(item_params)
    @item.list_id = @list.id

    if @item.save
      redirect_to @list
    else
      @items = List.find(params[:list_id]).items
      render 'lists/show'
    end
  end

  def update
    @item = @list.items.find(params[:id])

    if @item
      @item.complete? ? @item.incomplete! : @item.complete!
      redirect_to @list
    else
      @items = List.find(params[:list_id]).items
      render 'lists/show'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to list_path(@item.list)
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
