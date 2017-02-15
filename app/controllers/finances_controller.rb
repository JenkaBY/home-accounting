class FinancesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_finance

  # TO DO заменить текстовые поля на I18n

  def new
    @finance = current_user.finances.new
    redirect_to finances_path
  end

  def index
    @finances = current_user.finances.all.order(action_date: :desc)
    @finance = current_user.finances.new
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
        format.html { redirect_to finances_path, notice: output_text('updated') }
        # format.json { head :no_content }
      else
        format.html { redirect_to finances_path, alert: 'Errors!!!' }
        # format.json { render json: @finance.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @finance = current_user.finances.build(finance_params)
    respond_to do |format|
      if @finance.save
        format.html { redirect_to finances_path, notice: output_text('created') }
        # format.json { render action: 'show', status: :created, location: @finance }
      else
        format.html { redirect_to finances_path, alert: 'Errors!!!' }
        # flash.now[:alert] = "Your book was not found"
        # render "index"
        # format.json { render json: @finance.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    get_finance.destroy
    respond_to do |format|
      format.html { redirect_to finances_path, notice: output_text('deleted') }
      # format.json { head :no_content }
    end
  end



  private

  def get_finance
    @finance = current_user.finances.find(params[:id])
  end

  def finance_params
    params.require(:finance).permit(:action_date, :amount, :category_id, :description, :user_id)
  end

  def output_text(action)
    'Finance was successfully ' + action + '.'
  end

  def invalid_finance
    logger.error "Attempt to access invalid finance #{params[:id]} by user #{current_user.id}"
    redirect_to finances_path, notice: 'Invalid finance action'
  end

end
