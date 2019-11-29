module Plutus
  class ApplicationController < ActionController::Base
    before_action :authenticate_admin_user!
    before_action :authorize_resources  
  end
end
