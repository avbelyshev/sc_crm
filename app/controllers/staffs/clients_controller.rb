class Staffs::ClientsController < ApplicationController
  before_action :authenticate_staff!
  before_action :set_client, only: %i[edit update destroy]

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

  def edit; end

  def update
    if @client.update(client_params)
      render json: @client, status: :ok
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @client.destroy
      render json: "successfully deleted", status: :accepted
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.permit(:fullname, :email, :phone, :password, organization_ids: [])
  end
end
