# Items Controller
class ItemsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)

    if @item.save
      redirect_to @list
    else
      @items = List.find(params[:list_id]).items
      render 'lists/show'
    end
  end

  def update
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])

    if @item
      if @item.complete?
        @item.incomplete!
      else
        @item.complete!
      end

      redirect_to @list
    else
      @items = List.find(params[:list_id]).items
      render 'lists/show'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
