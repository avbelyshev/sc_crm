class Staffs::ClientsOrganizationsController < ApplicationController
  before_action :authenticate_staff!

  def create
    @client_organization = ClientsOrganization.new(clients_organization_params)

    if @client_organization.save
      render json: @client_organization, status: :created
    else
      render json: @client_organization.errors, status: :unprocessable_entity
    end
  end

  private

  def clients_organization_params
    params.require(:clients_organization).permit(:client_id, :organization_id)
  end
end
