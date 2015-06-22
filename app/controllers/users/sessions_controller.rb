class Users::SessionsController < Devise::SessionsController
  skip_before_action :doorkeeper_authorize!

  def new
    super
  end

  def create
    super
  end
end
