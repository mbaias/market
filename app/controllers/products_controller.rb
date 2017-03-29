class ProductsController < ApplicationController
	before_action :set_product, only:[:edit, :update, :show, :destroy]
	
	def new
		@product = Product.new
	end

	def destroy
		@product.destroy
		flash[:notice] = "Product deleted"
		redirect_to products_path
	end

	def update
		if @product.update(products_params)
			flash[:notice] = "Product edited"
			redirect_to product_path(@product)
		else
			render 'edit'
		end
	end
	def create
		@product = Product.new product_params
		if @product.save
			flash[:notice] = "Product was created"
			redirect_to products_path
		else
			render 'new'
		end
	end
	def show
		
	end
	def edit
		
	end
	def index
		@products = Product.paginate(page:params[:page], per_page: 5)
	end
	private
		def set_product
			@product = Product.find(params[:id ])
		end
		def product_params
			params.require(:product).permit(:title, :description, :price, :image, :seller_id)
		end

end