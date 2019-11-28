module Plutus
  # This controller provides restful route handling for Accounts.
  #
  # The controller supports ActiveResource, and provides for
  # HMTL, XML, and JSON presentation.
  #
  # == Security:
  # Only GET requests are supported. You should ensure that your application
  # controller enforces its own authentication and authorization, which this
  # controller will inherit.
  #
  # @author Michael Bulat
  class AccountsController < Plutus::ApplicationController
    unloadable

    # @example
    #   GET /accounts
    #   GET /accounts.xml
    #   GET /accounts.json
    def index
      @accounts = if params[:household_id]
                    Account.reports(params[:household_id]).all
                  else
                    Account.all
                  end

      respond_to do |format|
        format.html
        format.xml { render xml: @accounts }
        format.json { render json: @accounts } # index.html.erb
      end
    end
  end
end
