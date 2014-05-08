class AdventuresController < ApplicationController
  def index

    if params[:search_states] && params[:search_category]
    @adventures = Adventure.search_model(params[:search_states,], params[:search_category]).paginate(:page => params[:page], :per_page => 5)
    else
      @adventures = Adventure.all.paginate(:page => params[:page], :per_page => 5)
    end
  end
  def show
    @adventure = Adventure.find(params[:id])
  end
  def new
    @adventure = Adventure.new
  end

  def create
    @adventure = Adventure.new(adventure_params)
    if @adventure.save
      redirect_to adventure_path(@adventure)
    else
      render :new
    end
  end

  def edit
    @adventure = Adventure.find(params[:id])
  end

  def update
    @adventure = Adventure.find(params[:id])
    if @adventure.update(adventure_params)
      redirect_to adventure_path(@adventure)
    else
      render :edit
    end
  end
  def destroy
    @adventure = Adventure.find(params[:id])
    @adventure.destroy
    redirect_to :action => :index
  end
  private
  def adventure_params
    params.require(:adventure).permit(:title, :description, :state, :category, :price, :photo)
  end
end
