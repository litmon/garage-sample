module Api
  class ApiController < ActionController::Base
    protect_from_forgery with: :null_session

    include Garage::ControllerHelper
    include ModuleSample

    def current_resource_owner
      @current_resource_owner ||= User.find(resource_owner_id) if user_signed_in?
    end

    def resource_owner_exist?(resource_owner_id)
      User.exist?(resource_owner_id)
    end
  end
end
