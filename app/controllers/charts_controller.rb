class ChartsController < ApplicationController
  def index
    @transacTypes = TransactionType.all
  end
end
