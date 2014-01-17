class Api::MicropostsController < ApplicationController
	http_basic_authenticate_with :name => "sampleApp", :password => "foobar"
	protect_from_forgery with: :null_session
	#before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

	def index
		@microposts = Micropost.all 
		respond_to do |format|
			format.js { render json: @microposts, content: params[:callback], status: :ok }
			format.json { render json: @microposts, status: :ok }
			format.xml { render xml: @microposts, status: :ok }
		end
	end


	def create
		@cur_user = User.find_by(remember_token: params[:token])

		@micropost = @cur_user.microposts.build(micropost_params)
		if @micropost.save
			respond_to do |format|
				format.js { render json: @micropost, content: params[:callback], status: :ok }
				format.json { render json: @micropost, status: :ok }
				format.xml { render xml: @micropost, status: :ok }
			end
		else
			respond_to do |format|
				format.js { render json: @micropost.errors, content: params[:callback], status: :unprocessable_entity }
				format.json { render json: @micropost.errors, status: :unprocessable_entity }
				format.xml { render xml: @micropost.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@micropost.destroy
		respond_to do |format|
			format.js { head :no_content, status: :ok }
			format.json { head :no_content, status: :ok }
			format.xml { head :no_content, status: :ok }
		end
	end

	private

		def micropost_params
			params.require(:micropost).permit(:content)
		end

		def correct_user
			@cur_user = User.find_by(remember_token: params[:token])
			@micropost = @cur_user.microposts.find_by(id: params[:id])
		end
end
