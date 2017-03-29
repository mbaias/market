class CategoriesController < ApplicationController
	before_action :set_category, only:[:edit, :update, :destroy]
	def new 
		@category = Category.new
	end
	def create
		@category = Category.new category_params
		if @category.save
			flash[:notice] = "Category was created successfully"
			redirect_to categories_path
		else
			render 'new'
		end
	end
	def update
		if @category.update(category_params)
			flash[:notice] = "category updated successfully"
			redirect_to categories_path(@category)
		else
			render 'edit'
		end
	end
	def destroy
		@category.destroy
		flash[:notice] = "Category deleted"
		redirect_to categories_path
	end
	def edit
		
	end
	def index
		@categories = Category.paginate(page:params[:page], per_page: 5)
	end
	
	private
		def set_category
			@category = Category.find(params[:id])
		end
		def category_params
			params.require(:category).permit(:title)
		end
	
end