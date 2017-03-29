class BuyersController < ApplicationController
before_action :set_buyer, only:[:edit, :update, :show, :destroy]
	def new
		@buyer = Buyer.new
	end
	def create
		u = User.new(email:params[:buyer][:email], password:params[:buyer][:password], password_confirmation:params[:buyer][:password_confirmation])
		if u.save
			@buyer = Buyer.new buyer_params
			@buyer.user_id = u.id
			if @buyer.save
				flash[:notice] = "Buyer was created"
				redirect_to buyers_path(@buyer)
			else
				render 'new'
			end
		else
			render 'new'
		end

	end
	def update
		if @buyer.update(buyer_params)
			flash[:notice] = "Buyer updated successfully"
			redirect_to buyers_path(@buyer)
		else
			render 'edit'
		end
	end
	def destroy
		@buyer.destroy
		flash[:notice] = "Buyer deleted"
		redirect_to buyer_path
	end
	def edit
		
	end
	def show
		
	end
	def index
		@buyers = Buyer.paginate(page:params[:page], per_page: 5)
	end

	private
		def set_seller
			@buyer = Buyer.find(params[:id])
		end
		def buyer_params
			params.require(:buyer).permit(:name, :surname, :date_of_birth, :address,:phone, :email)
		end
	
	
end