module Plutus
  # This controller provides restful route handling for Entries.
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
  class EntriesController < Plutus::ApplicationController
    unloadable
    # @example
    #   GET /entries
    #   GET /entries.xml
    #   GET /entries.json
    def index
      order = if params[:order] == 'ascending'
                'ASC'
              else
                'DESC'
              end
      if params[:household_id]
        @entries =
          Entry.reports(params[:household_id]).page(params[:page]).per(params[:limit]).order(
            "date #{order}"
          )
      else
        @entries = Entry.page(params[:page]).per(params[:limit]).order("date #{order}")
      end

      respond_to do |format|
        format.html
        format.xml { render xml: @entries }
        format.json { render json: @entries } # index.html.erb
      end
    end
  end
end
