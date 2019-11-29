module Plutus
  class ApplicationController < ActionController::Base
    before_action :authenticate_admin_user!
    before_action :authorize_resources
    
    protected

    def authorize_resources
      if !params[:controller].include?('devise') && !current_admin_user.admin?
        raise CanCan::AccessDenied
      end
    end  
  end
end
