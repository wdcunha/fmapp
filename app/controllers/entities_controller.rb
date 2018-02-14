class EntitiesController < ApplicationController
  before_action :find_entity, only: [:show, :edit, :update, :destroy]

  def index
    @entities = Entity.all.order(created_at: :desc)
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new entity_params

    if @entity.save
      redirect_to entity_path(@entity)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @entity.update(entity_params)
      redirect_to entity_path(@entity), success: 'Item updated!'
    else
      render :edit
    end
  end

  def destroy
    @entity.destroy
    redirect_to entities_path, success: 'Item deleted!'
  end

  private

  def entity_params
    params.require(:entity).permit(
      :name,
      :docNumber,
      :address,
      :postaCode,
      :phone,
      :email
    )
  end

  def find_entity
    if params[:id]
      @entity = Entity.find params[:id]
    end
  end
end
