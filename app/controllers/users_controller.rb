class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		  customer = Stripe::Customer.create(
    :email => 'example@stripe.com',
    :card  => params[:stripeToken]
  )

		  rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
		

	end

	def show
		
	end

	def edit
	end

	def update
		if params[:user][:password].blank?
	  params[:user].delete(:password)
	  params[:user].delete(:password_confirmation)
		end

		token = params[:stripeToken]
		customer = Stripe::Customer.create(
			card: token,
			email: current_user.email
			 )

		current_user.stripeid = customer.id
		current_user.save
		redirect_to dashboard_path
	end

	def payment
	end

	def destroy
	end

	private

	def user_params
		params.require(:user).permit( :stripe_card_token, :avatar, :first_name, :last_name, :country_code, :phone_number,:home_adress,:work_address, :email, :password, :current_password)
	end


end
