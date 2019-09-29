class Staffs::ApplicationController < ApplicationController
  before_action :authenticate_staff!

  layout 'staff'

  def index; end
end
