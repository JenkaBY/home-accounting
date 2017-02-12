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
    get_category
  end

  def show
    redirect_to edit_category_path
  end


  def update
    begin
      get_category
    rescue ActiveRecord::RecordNotFound
    end
    respond_to do |format|
      if get_category.update(category_params)
        format.html { redirect_to categories_path, notice: output_text('updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @category = current_user.categories.build(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: output_text('created') }
        format.json { render action: 'show', status: :created, location: @category }
      else
        format.html { render action: 'new' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    get_category.destroy
    respond_to do |format|
      format.html { redirect_to categories_path, notice: output_text('deleted') }
      format.json { head :no_content }
    end
  end

  private

  def get_category
    @category = current_user.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :type_id)
  end

  def output_text(action)
    'Category was successfully ' + action + '.'
  end

  def invalid_category
    logger.error "Attempt to access invalid category #{params[:id]} by user #{current_user.id}"
    redirect_to categories_path, notice: 'Invalid category'
  end

end
