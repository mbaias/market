class SellersController < ApplicationController
	before_action :set_seller, only:[:edit, :update, :show, :destroy]
	def new
		@seller = Seller.new
	end
	def create
		@m = User.new(email:params[:seller][:email], password:params[:seller][:password], password_confirmation:params[:seller][:password_confirmation])
		if @m.save	
			@seller = Seller.new seller_params
			@seller.user_id = @m.id
			if @seller.save
				flash[:notice] = "Seller was created"
				redirect_to sellers_path(@seller)
			else
				render 'new'
			end
		else
			render 'new'
		end

	end
	def update
		if @seller.update(seller_params)
			flash[:notice] = "Seller updated successfully"
			redirect_to sellers_path(@seller)
		else
			render 'edit'
		end
	end
	def destroy
		@seller.destroy
		flash[:notice] = "Seller deleted"
		redirect_to seller_path
	end
	def edit
		
	end
	def show
		@sellersproducts = @seller.products
	end
	def index
		@sellers = Seller.paginate(page:params[:page], per_page: 5)
	end

	private
		def set_seller
			@seller = Seller.find(params[:id])
		end
		def seller_params
			params.require(:seller).permit(:name, :surname, :date_of_birth, :address,:phone, :email)
		end
end