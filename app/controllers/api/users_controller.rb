class Api::UsersController < ApplicationController
	http_basic_authenticate_with :name => "sampleApp", :password => "foobar"
	protect_from_forgery except: :create
	skip_before_filter :authenticate_user!
	before_action :correct_user,   only: [:edit, :update]
	before_action :signed_in?, only: [:index, :edit, :update]
	before_filter :fetch_user, :except => [:index, :create]

	def fetch_user
		@user = User.find_by_id(params[:id])
	end

	def index
		@users = User.all
		respond_to do |format|
			format.js { render json: @users, content: params[:callback] }
			format.json { render json: @users }
			format.xml { render xml: @users }
		end
	end

	def show
		respond_to do |format|
			format.js { render json: @user, content: params[:callback] }
			format.json { render json: @user }
			format.xml { render xml: @user }
		end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		respond_to do |format|
			if @user.save
				sign_in @user
				format.js { render json: @user, content: params[:callback] }
				format.json { render json: @user, status: :created }
				format.xml { render xml: @user, status: :created }
			else
				format.js { render json: @user, content: params[:callback], status: :unprocessable_entity }
				format.json { render json: @user.errors, status: :unprocessable_entity }
				format.xml  { render xml: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @user.update_attributes(user_params)
				format.js { head :no_content, status: :ok }
				format.json { head :no_content, status: :ok }
				format.xml { head :no_content, status: :ok }
			else
				format.js { render json: @user.errors, content: params[:callback] }
				format.json { render json: @user.errors, status: :unprocessable_entity }
				format.xml { render xml: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	private

    	def user_params
      		params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :admin)
    	end

    	def correct_user
      		@user = User.find(params[:id])
    	end
end