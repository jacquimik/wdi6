class OceansController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def index
		@oceans = Ocean.all
	end

	def new 
	end

	def create
		Ocean.create ocean_params
		redirect_to(oceans_path)
	end

	def show
		@ocean = Ocean.find params[:id]
	end

	def destroy
		ocean = Ocean.find params[:id]
		ocean.destroy
		redirect_to(oceans_path)
	end

	def edit
		@ocean = Ocean.find params[:id]
	end

	def update
		ocean = Ocean.find params[:id]
		ocean.update ocean_params
		redirect_to (ocean_path(ocean.id))
	end

	private
	def ocean_params
		#params whitelisting
		params.require(:ocean).permit(:name, :image, :continent, :size, :volume)
	end
end