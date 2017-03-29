class CategoryProductsController < ApplicationController
	before_action :set_category_product, only:[:edit, :update, :show, :destroy]
	def new
		@category_product = CategoryProduct.new
	end
	def create
		@category_product = CategoryProduct.new category_product_params
		if @category_product.save
			flash[:notice] = "category_products was created"
			redirect_to category_product_path(@category_product)
		else
			render 'new'
		end

	end
	def destroy
		@category_product.destroy
		flash[:notice] = "category_product deleted"
		redirect_to category_product_path
	end
	def update
		if @category_product.update(category_product_params)
			flash[:notice] = "category_product updated successfully"
			redirect_to category_product_path
		else
			render 'edit'
		end
	end
	def show
		
	end
	def edit
		
	end
	def index
		@category_product = CategoryProduct.paginate(page:params[:page], per_page: 5)
	end
	private
		def set_category_product
			@category_product = CategoryProduct.find(params[:id])
		end
		def category_products_params
			params.private(:category_product).permit(:category_id, :product_id)
		end
	
end