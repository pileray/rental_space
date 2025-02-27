class SpacesController < ApplicationController
  def index
    @q = Space.ransack(params[:q])
    @pagy, @spaces = pagy(@q.result.with_attached_images.includes(:features).order(created_at: :desc))
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    if @space.save
      redirect_to @space, success: '保存しました'
    else
      flash.now[:error] = '失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @space = Space.find(params[:id])
  end

  def update
    @space = Space.find(params[:id])
    if @space.update(space_params)
      redirect_to @space, success: '更新しました'
    else
      flash.now[:error] = '失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @space = Space.find(params[:id])
  end

  private
  def space_params
    params.require(:space).permit(:name, :description, :address, :nearest_station, :latitude, :longitude,
                                  { images: [] }, { feature_ids: [] }, { space_type_ids: [] })
  end
end
