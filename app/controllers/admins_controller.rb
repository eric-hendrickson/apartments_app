class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize

  def index
    @users = User.all
  end

  def update
    user = User.find(params[:id])
    user.remove_role user.roles.first.name
    new_role = Role.find_by_name(params[:role])
    user.add_role(new_role.name)
    redirect_to '/admins'
  end

  private
    def authorize
      if !current_user.has_role? :admin
        render text:"No access for you!"
      end
    end
end
