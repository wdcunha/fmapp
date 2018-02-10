class TransactionTypeController < ApplicationController
  before_action :find_transacType

  def index
    @transacTypes = TransactionType.all.order(created_at: :desc)
  end

  def new
    @transacType = TransactionType.new
  end

  def create
    @transacType = TransactionType.new transacType_params

    if @transacType.save
      redirect_to transaction_type_index_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @transacType.update(transacType_params)
      redirect_to transaction_type_index_path, success: 'Item updated!'
    else
      render :edit
    end
  end

  def destroy
    @transacType.destroy
    redirect_to transaction_type_index_path, success: 'Item deleted!'
  end

  private

  def transacType_params
    params.require(:transaction_type).permit(
      :description
    )
  end

  def find_transacType
    if params[:id]
      @transacType = TransactionType.find params[:id]
    end
  end
end
