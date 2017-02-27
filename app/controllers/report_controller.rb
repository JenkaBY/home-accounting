class ReportController < ApplicationController

  def new
  end

  def generate

    @start_date = params[:report][:start_date]
    @end_date = params[:report][:end_date]

    finances = current_user.finances

    unless @start_date.blank?
      finances = finances.from_date(@start_date)
    end

    unless @end_date.blank?
      finances = finances.to_date(@end_date)
    end

    # finances = current_user.finances.from_date(@start_date).to_date(@end_date)
    @types = finances.joins(:category).select('DISTINCT categories.type_id').collect { |cat| cat.type_id }
    puts @types
    @finances_for_period = finances.order(:action_date, :category_id)
    @total_income_period = @finances_for_period.income.total
    @total_expense_period = @finances_for_period.expense.total


    if @types.include?(Type::INCOME)
      @categories_income = finances.income.group_by_category_sum_amount
    end

    if @types.include?(Type::EXPENSE)
      @categories_expense = finances.expense.group_by_category_sum_amount
    end

  end

  def report_get
    redirect_to new_report_path
  end

  private

  def report_params
    params.require(:report).permit(:start_date, :end_date)
  end

end