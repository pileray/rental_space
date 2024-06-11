class SpacesController < ApplicationController
  def index
    @q = Space.ransack(params[:q])
    @pagy, @spaces = pagy(@q.result.with_attached_images.includes(:features).order(created_at: :desc))
  end

  def show
    @space = Space.find(params[:id])
  end
end
