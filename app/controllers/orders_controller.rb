class OrdersController < ApplicationController
	before_action :set_order, only:[:edit, :update, :show, :destroy]
	
	def new
		@order = Order.new
	end

	def destroy
		@order.destroy
		flash[:notice] = "Order deleted"
		redirect_to orders_path
	end

	def update
		if @order.update(products_params)
			flash[:notice] = "Order edited"
			redirect_to order_path(@order)
		else
			render 'edit'
		end
	end
	def create
		@order = Order.new order_params
		if @order.save
			flash[:notice] = "Order was created"
			redirect_to orders_path
		else
			render 'new'
		end
	end
	def show
		
	end
	def edit
		
	end
	def index
		@orders = Order.paginate(page:params[:page], per_page: 5)
	end
	private
		def set_order
			@order = Order.find(params[:id ])
		end
		def order_params
			params.require(:order).permit(:cart_id, :product_id, :quantity, :sum)
		end
	
end