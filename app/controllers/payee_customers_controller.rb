class PayeeCustomersController < ApplicationController
  before_action :find_payeeCustomer, only: [:show, :edit, :update, :destroy]

  def index
    @payeeCustomers = PayeeCustomer.all.order(created_at: :desc)
  end

  def new
    @payeeCustomer = PayeeCustomer.new
  end

  def create
    @payeeCustomer = PayeeCustomer.new payeeCustomer_params
    if @payeeCustomer.save
      redirect_to payee_customers_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @payeeCustomer.update(payeeCustomer_params)
      redirect_to payee_customer_path(@payeeCustomer), success: 'Item updated!'
    else
      render :edit
    end
  end

  def destroy
    @payeeCustomer.destroy
    redirect_to payee_customers_path, success: 'Item deleted!'
  end

  private

  def payeeCustomer_params
    params.require(:payee_customer).permit(
      :name,
      :address,
      :postaCode,
      :phone,
      :email,
      :payee_customer_type_id
    )
  end

  def find_payeeCustomer
    if params[:id]
      @payeeCustomer = PayeeCustomer.find params[:id]
    end
  end
end
