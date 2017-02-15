class ReportController < ApplicationController
  def new
  end

  def generate
    puts params[:start_date]
    puts params[:end_date]
    render html: 'params[:start_date].to_s'
  end

  private

  def report_params
    params.permit(:start_date, :end_date, :type_id, :category_id, :by_date, :by_type, :by_category)
  end

end
