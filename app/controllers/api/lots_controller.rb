class Api::LotsController < ApplicationController
	http_basic_authenticate_with :name => "sampleApp", :password => "foobar"
	protect_from_forgery with: :null_session
	def show
		@permit = current_user.permit
		@lots = Lot.where("permit = ?", @permit)
		respond_to do |format|
			format.json { render json: @lots, status: :ok }
		end
	end
end

