module Api
  class UsersController < ApiController
    include Garage::RestfulActions

    # index
    def require_resources
      @resources = User.all
    end

    # show
    def require_resource
      @resources = User.find(params[:id])
    end
  end
end
