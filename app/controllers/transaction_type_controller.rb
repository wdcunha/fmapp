class TransactionTypeController < ApplicationController
  before_action :find_transacType

  def index
    @transacType = TransactionType.all.order(created_at: :desc)
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

  private

  def transacType_params
    params.require(:transaction_type).permit(
      :description
    )
  end

  def find_transacType
    @transacType = TransactionType.find params[:id]
  end
end
