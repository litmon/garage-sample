class Users::SessionsController < Devise::SessionsController
  skip_before_action :doorkeeper_authorize!
  respond_to :html
end
