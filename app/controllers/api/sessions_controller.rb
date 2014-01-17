class Api::SessionsController < ApplicationController
	http_basic_authenticate_with :name => "sampleApp", :password => "foobar"
	protect_from_forgery with: :null_session

	def new
	end

	def create
		user = User.find_by(email: params[:email].downcase)
		if user && user.authenticate(params[:password])
			sign_in user
			respond_to do |format|
				format.js { render json: user.to_json(:only => [:id, :remember_token]), content: params[:callback], status: :ok }
				format.json { render json: user.to_json(:only => [:id, :remember_token]), status: :ok }
				format.xml { render xml: user.to_xml(:only => [:id, :remember_token]), status: :ok }
			end
		else
			respond_to do |format|
				format.js { render json: user.errors, content: params[:callback], status: :unprocessable_entity }
				format.json { render json: user.errors, status: :unprocessable_entity }
				format.xml { render xml: user.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		sign_out
		respond_to do |format|
				format.js { head :no_content, status: :ok }
				format.json { head :no_content, status: :ok }
				format.xml { head :no_content, status: :ok }
		end
	end
end