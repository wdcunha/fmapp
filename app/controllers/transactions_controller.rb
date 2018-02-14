class TransactionsController < ApplicationController
  before_action :find_transac

  def index
    @transacs = Transaction.all.order(created_at: :desc)
  end

  def new
    @transac = Transaction.new
  end

  def create
    @transac = Transaction.new transac_params

    if @transac.save
      redirect_to transactions_path
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @transac.update(transac_params)
      redirect_to transactions_path, success: 'Transaction updated!'
    else
      render :edit
    end
  end

  def destroy
    @transac.destroy
    redirect_to transactions_path, success: 'Transaction deleted!'
  end

  private

  def transac_params
    params.require(:transaction).permit(
      :details,
      :date,
      :value
    )
  end

  def find_transac
    if params[:id]
      @transac = Transaction.find params[:id]
    end
  end
end
