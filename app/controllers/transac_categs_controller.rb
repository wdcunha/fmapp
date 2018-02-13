class TransacCategsController < ApplicationController
  before_action :find_transacCateg, only: [:show, :edit, :update, :destroy]

  def index
    @transacCategs = TransacCateg.all.order(created_at: :desc)
  end

  def new
    @transacCateg = TransacCateg.new
  end

  def create
    @transacCateg = TransacCateg.new transacCateg_params

    if @transacCateg.save
      redirect_to transac_categs_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @transacCateg.update(transacCateg_params)
      redirect_to transac_categs_path, success: 'Item updated!'
    else
      render :edit
    end
  end

  def destroy
    @transacCateg.destroy
    redirect_to transac_categs_path, success: 'Item deleted!'
  end

  private

  def transacCateg_params
    params.require(:transaction_type).permit(
      :description
    )
  end

  def find_transacCateg
    if params[:id]
      @transacCateg = TransacCateg.find params[:id]
    end
  end
end
