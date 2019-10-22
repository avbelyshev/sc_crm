class Staffs::OrganizationsController < ApplicationController
  before_action :authenticate_staff!
  before_action :set_organization, only: %i[update destroy]

  def index
    @organizations = Organization.all
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      render json: @organization, status: :created
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  def update
    if @organization.update(organization_params)
      render json: @organization, status: :ok
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @organization.destroy
      render json: "successfully deleted", status: :accepted
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  def legal_forms
    render json: Organization::LEGAL_FORMS
  end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.permit(:name, :legal_form, :inn, :ogrn)
  end
end
