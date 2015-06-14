class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		
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
	end

	def destroy
	end

	private

	def user_params
		params.require(:user).permit( :avatar, :first_name, :last_name, :country_code, :phone_number,:home_adress,:work_address, :email, :password, :current_password)
	end


end
