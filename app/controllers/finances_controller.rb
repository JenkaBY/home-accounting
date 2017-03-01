class FinancesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_finance

  def new
    redirect_to finances_path
  end

  def index
    search_params = params[:search]
    @finance = current_user.finances.new
    if search_params
      @finances = filtered_finances.order(action_date: :desc)
    else

      month_ago = Time.now - 1.month
      @finances = current_user.finances.from_date(month_ago).order(action_date: :desc)
    end
  end

  def edit
    redirect_to finance_path
  end

  def show
    get_finance
  end

  def update
    begin
      get_finance
    rescue ActiveRecord::RecordNotFound
    end
    respond_to do |format|
      if get_finance.update(finance_params)
        format.html { redirect_to finances_path, notice: t('finance_updated') }
      else
        format.html { render action: 'show' }
      end
    end
  end

  def create
    @finance = current_user.finances.build(finance_params)
    respond_to do |format|
      if @finance.save
        format.html { redirect_to finances_path, notice: t('finance_created') }
      else
        format.html { render action: 'show' }
      end
    end
  end

  def destroy
    get_finance.destroy
    respond_to do |format|
      format.html { redirect_to finances_path, notice: t('finance_removed') }
    end
  end

  def get_finance
    @finance = current_user.finances.find(params[:id])
  end

  private

  def finance_params
    params.require(:finance).permit(:action_date, :amount, :category_id, :description, :user_id, :search)
  end

  def invalid_finance
    logger.error "Attempt to access invalid finance #{params[:id]} by user #{current_user.id}"
    redirect_to finances_path, alert: t('invalid_action')
  end

#   filtering

  def filtered_finances

    from_date = params[:search][:from_date]
    to_date = params[:search][:to_date]
    amount = params[:search][:amount]
    keywords = params[:search][:keywords]
    finances = current_user.finances

    finances = finances.from_date(from_date) unless from_date.blank?

    finances = finances.to_date(to_date) unless to_date.blank?

    finances = finances.amount(amount.to_f) unless amount.blank?

    finances = finances.description_or_category_title_like(keywords.mb_chars.downcase.to_s) unless keywords.blank?

    finances
  end


end