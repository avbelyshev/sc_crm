class Staffs::EquipmentsController < ApplicationController
  before_action :authenticate_staff!
  before_action :set_equipment, only: %i[edit update destroy]

  def index
    @equipments = Equipment.all
  end

  def create
    @equipment = Equipment.new(equipment_params)

    if @equipment.save
      render json: @equipment, status: :created
    else
      render json: @equipment.errors, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @equipment.update(equipment_params)
      render json: @equipment, status: :ok
    else
      render json: @equipment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @equipment.destroy
      render json: "successfully deleted", status: :accepted
    else
      render json: @equipment.errors, status: :unprocessable_entity
    end
  end

  def kinds
    render json: Equipment::KINDS
  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  def equipment_params
    params.permit(:name, :kind, :serial_number, :organization_id)
  end
end
