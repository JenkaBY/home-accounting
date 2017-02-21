class CategoriesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_category

  def new
    @category = current_user.categories.new
    redirect_to categories_path
  end

  def index
    @categories = current_user.categories.all.order(:type_id)
    @category = current_user.categories.new
  end

  def edit
    redirect_to category_path
  end

  def show
    get_category
  end


  def update
    begin
      get_category
    rescue ActiveRecord::RecordNotFound
    end
    respond_to do |format|
      if get_category.update(category_params)
        format.html { redirect_to categories_path, notice: t('category_updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'show' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @category = current_user.categories.build(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: t('category_created') }
        # format.json { render action: 'show', status: :created, location: @category }
      else
        format.html { render action: 'show', alert: t('alert_category') }
        # format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    get_category.destroy
    respond_to do |format|
      unless Category.exists?(id: params[:id])
        format.html { redirect_to categories_path, notice: t('category_removed') }
        format.json { head :no_content }
      else
        format.html { redirect_to categories_path, alert: t('cant_be_destroy') }
      end
    end
  end

  private

  def get_category
    @category = current_user.categories.find_by(id: params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :type_id)
  end

  def invalid_category
    logger.error "Attempt to access invalid category #{params[:id]} by user #{current_user.id}"
    redirect_to categories_path, notice: t('category_invalid')
  end

end
