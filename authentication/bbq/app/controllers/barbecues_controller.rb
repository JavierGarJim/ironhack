class BarbecuesController < ApplicationController
  # before_action :authorize_user, only: [:show, :index]
  before_action :authenticate_user!

  def index
    @barbecues = Barbecue.order(:date)
  end

  def show
    @barbecue = Barbecue.find_by(id: params[:id])

    @item = Item.new
    # Don't add any code to this show action.
    # Implement your barbecue API in another action.
  end

  def api_show
    barbecue = Barbecue.find_by(id: params[:id])

    unless barbecue
      render json: {error: "barbecue not found"}, status: 404
      
      return
    end

    render json: barbecue
  end

  def api_join
    barbecue = Barbecue.find_by(id: params[:id])

    unless barbecue.users.exists?(current_user)
      barbecue.users.push(current_user)
    end

    render json: barbecue.to_json(include: [:users])
  end

  def api_add_item
    @barbecue = Barbecue.find_by(id: params[:id])

    unless @barbecue
      render json: {error: "barbecue not found"}, status: 404
      
      return
    end

    @item = Item.find_by(name: params[:item_name])

    if @item.nil?
      @item = Item.create(name: params[:item_name])
    end

    if @barbecue.items.exists?(@item)
      render json: {error: "item already exists"}, status: 404
    else
      @barbecue.items.push(@item)

      render json: @barbecue.to_json(include: [:items])
    end
  end

  def new
    @bbq = Barbecue.new
  end

  def create
    bbq_params = params.require(:barbecue).permit(:title, :venue, :date)
    @bbq = Barbecue.new(bbq_params)

    unless @bbq.save
      render(:new)
    else
      redirect_to(barbecues_path)
    end
  end
end
