class RenthousesController < ApplicationController
  before_action :set_renthouse, only: %i[ show edit update destroy ]

  def index
    @renthouse = Renthouse.all
  end

  def new
    @renthouse = Renthouse.new
  end

  def create
    Renthouse.create(name: params[:renthouse][:name], rent: params[:renthouse][:rent],
     address: params[:renthouse][:address], age: params[:renthouse][:age], 
     remarks: params[:renthouse][:remarks])

     redirect_to renthouses_path, notice: "登録しました"
  end

  def show
  end

  def edit
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
    params.require(:renthouse).permit(:name, :rent, :address, :age, :remarks)
  end

end
