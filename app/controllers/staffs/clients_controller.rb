class Staffs::ClientsController < ApplicationController
  before_action :authenticate_staff!
  def index
    @clients = Client.all
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      render json: @client, status: :created
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  private

  def client_params
    params.permit(:fullname, :email, :phone, :password)
  end
end
