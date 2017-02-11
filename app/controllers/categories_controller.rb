class CategoriesController < ApplicationController


  def new
    @category = current_user.categories.new
  end

  def index
    @categories = current_user.categories.all.order(:type_id)
    @category = current_user.categories.new
  end

  def show
  end

  def update
  end

  def create
    @category = current_user.categories.build(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @category }
      else
        format.html { render action: 'new' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    set_category.destroy
    respond_to do |format|
      format.html { redirect_to categories_path, notice: 'Category was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:title, :type_id)
  end
end
