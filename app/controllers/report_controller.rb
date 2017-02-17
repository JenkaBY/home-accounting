require_relative '../../lib/core_ext/date.rb'
class ReportController < ApplicationController
  include ReportHelper

  def new
  end

  def generate

    @start_date   = date_from_hash params[:start_date]
    @end_date     = date_from_hash params[:end_date]
    @type_id      = processing_array params[:type_id]
    @category_id  = params[:category_id].to_i

    finances = current_user.finances.from_date(@start_date).to_date(@end_date)

    @finances_for_period  = finances.order(:action_date, :category_id)
    @total_income_period  = @finances_for_period.income.total
    @total_expense_period = @finances_for_period.expense.total

    @total = @total_income_period - @total_expense_period

    if @type_id.include?(Type::INCOME)
      @categories_income = finances.income.group(:category_id).select('finances.category_id, sum(finances.amount) as amount')
      @finances_current_period_income = @total_income_period
    end

    if @type_id.include?(Type::EXPENSE)
      @categories_expense = finances.expense.group(:category_id).select('finances.category_id, sum(finances.amount) as amount')
      @finances_current_period_expense = @total_expense_period
    end


  end

  def report_get
    redirect_to new_report_path
  end

  private

  def report_params
    params.permit(:start_date, :end_date, :type_id, :category_id)
  end

end
