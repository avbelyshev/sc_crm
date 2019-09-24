class Clients::ApplicationController < ApplicationController
  before_action :authenticate_client!

  layout 'client'

  def index; end
end
