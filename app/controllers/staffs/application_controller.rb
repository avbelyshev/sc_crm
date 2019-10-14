class Staffs::ApplicationController < ApplicationController
  before_action :authenticate_staff!

  layout 'staff'

  def index; end

  def user
    @user = current_staff
  end
end
