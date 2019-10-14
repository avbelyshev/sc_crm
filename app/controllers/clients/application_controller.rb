class Clients::ApplicationController < ApplicationController
  before_action :authenticate_client!

  layout 'client'

  def index; end

  def user
    @user = current_client
  end
end
