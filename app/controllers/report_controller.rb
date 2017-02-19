require_relative '../../lib/core_ext/date.rb'
class ReportController < ApplicationController
  include ReportHelper

  def new
  end

  def generate

    @start_date  = params[:report][:start_date]
    @end_date     = params[:report][:end_date]
    @type_id      = processing_array params[:report][:type_id]

    finances = current_user.finances.from_date(@start_date).to_date(@end_date)

    @finances_for_period  = finances.order(:action_date, :category_id)
    @total_income_period  = @finances_for_period.income.total
    @total_expense_period = @finances_for_period.expense.total


    if @type_id.include?(Type::INCOME)
      @categories_income = finances.income.group(:category_id)
                               .select('finances.category_id, sum(finances.amount) as amount')
    end

    if @type_id.include?(Type::EXPENSE)
      @categories_expense = finances.expense.group(:category_id)
                                .select('finances.category_id, sum(finances.amount) as amount')
    end

  end

  def report_get
    redirect_to new_report_path
  end

  private

  def processing_array array
    array.delete ''
    array.map! { |el| el.to_i }
  end

  def report_params
    params.require(:report).permit(:start_date, :end_date, :type_id, :category_id)
  end

end