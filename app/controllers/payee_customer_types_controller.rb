class PayeeCustomerTypesController < ApplicationController
  before_action :find_payee_customer_type, only: [:show, :edit, :update, :destroy]

  def index
    @payeeCustomerTypes = PayeeCustomerType.all.order(created_at: :desc)
  end

  def new
    @payeeCustomerType = PayeeCustomerType.new
  end

  def create
    @payeeCustomerType = PayeeCustomerType.new payee_customer_type_params

    if @payeeCustomerType.save

      redirect_to payee_customer_types_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @payeeCustomerType.update(payee_customer_type_params)
      redirect_to payee_customer_types_path, success: 'Item updated!'
    else
      render :edit
    end
  end

  def destroy
    @payeeCustomerType.destroy
    redirect_to payee_customer_types_path, success: 'Item deleted!'
  end

  private

  def payee_customer_type_params
    params.require(:payee_customer_type).permit(:title, :description)
  end

  def find_payee_customer_type
    if params[:id]
      @payeeCustomerType = PayeeCustomerType.find params[:id]
    end
  end
end
