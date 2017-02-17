require_relative '../../lib/core_ext/date.rb'
class ReportController < ApplicationController
  include ReportHelper

  def new
  end

  def generate

    @start_date   = date_from_hash params[:start_date]
    @end_date     = date_from_hash params[:end_date]
    @type_id      = params[:type_id].to_i
    @category_id  = params[:category_id].to_i

    finances = current_user.finances.from_date(@start_date).to_date(@end_date)

    @finances = finances.order(:action_date, :category_id)
    @income_current_period = @finances.income.total
    @expense_current_period = @finances.expense.total

    @total = @income_current_period - @expense_current_period

    if @type_id == Type::INCOME
      @categories = finances.income.group(:category_id).select('finances.category_id, sum(finances.amount) as amount')
      @finances_current = @income_current_period
    elsif @type_id == Type::EXPENSE
      @categories = finances.expense.group(:category_id).select('finances.category_id, sum(finances.amount) as amount')
      @finances_current = @expense_current_period
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
