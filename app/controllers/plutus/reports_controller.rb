module Plutus
  # == Security:
  # Only GET requests are supported. You should ensure that your application
  # controller enforces its own authentication and authorization, which this
  # controller will inherit.
  #
  # @author Michael Bulat
  class ReportsController < Plutus::ApplicationController
    unloadable

    # @example
    #   GET /reports/balance_sheet
    def balance_sheet
      first_entry = Plutus::Entry.order('date ASC').first
      @from_date = first_entry ? first_entry.date : Date.today
      @to_date = params[:date] ? Date.parse(params[:date]) : Date.today

      if params[:household_id]
        @assets = Plutus::Asset.reports(params[:household_id]).all
        @liabilities = Plutus::Liability.reports(params[:household_id]).all
        @equity = Plutus::Equity.reports(params[:household_id]).all
      else
        @assets = Plutus::Asset.all
        @liabilities = Plutus::Liability.all
        @equity = Plutus::Equity.all
      end

      respond_to(&:html)
    end

    # @example
    #   GET /reports/income_statement
    def income_statement
      @from_date =
        params[:from_date] ? Date.parse(params[:from_date]) : Date.today.at_beginning_of_month
      @to_date = params[:to_date] ? Date.parse(params[:to_date]) : Date.today
      if params[:household_id]
        @revenues = Plutus::Revenue.reports(params[:household_id]).all
        @expenses = Plutus::Expense.reports(params[:household_id]).all
      else
        @revenues = Plutus::Revenue.reports.all
        @expenses = Plutus::Expense.reports.all
      end

      respond_to(&:html)
    end
  end
end
