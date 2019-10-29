class Staffs::StaffsController < ApplicationController
  before_action :authenticate_staff!
  before_action :set_staff, only: %i[edit update destroy]

  def index
    @staffs = Staff.all
  end

  def create
    @staff = Staff.new(staff_params)

    if @staff.save
      render json: @staff, status: :created
    else
      render json: @staff.errors, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @staff.update(staff_params)
      render json: @staff, status: :ok
    else
      render json: @staff.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @staff.destroy
      render json: "successfully deleted", status: :accepted
    else
      render json: @staff.errors, status: :unprocessable_entity
    end
  end

  private

  def set_staff
    @staff = Staff.find(params[:id])
  end

  def staff_params
    params.permit(:fullname, :email, :phone, :password)
  end
end
