class RenthousesController < ApplicationController
  before_action :set_renthouse, only: %i[ show edit update destroy ]

  def index
    @renthouse = Renthouse.all
  end

  def new
    @renthouse = Renthouse.new
    @renthouse.stations.build
  end

  def create
    @renthouse = Renthouse.new(renthouse_params)
    if @renthouse.save
      redirect_to renthouses_path, notice: "登録しました"
    else
      redirect_to new_renthouse_path
    end
  end

  def show
  end

  def edit
    @renthouse.stations.build
  end
  
  def update
    if @renthouse.update(renthouse_params)
      redirect_to renthouse_path, notice: "編集しました"
    else
      render :edit
    end
  end

  def destroy
    @renthouse.destroy
    redirect_to renthouses_path, notice: "削除しました"
  end

  private
  
  def set_renthouse
    @renthouse = Renthouse.find(params[:id])
  end

  def renthouse_params
    params.require(:renthouse).permit(:name, :rent, :address, :age, :remarks, stations_attributes: [:id, :route, :stationname, :time, :_destroy])
  end

end
