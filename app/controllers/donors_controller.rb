class DonorsController < ApplicationController

	def create
		p donor_params
		donor = Donor.create!(donor_params)
		respond_to do |format|
		  format.json { render :json => donor }
	    end
	end

	def show
		@donor = Donor.find(params[:id])
		respond_to do |format|
		  format.json { render :json => @donor }
	    end
	end

	private 
	def donor_params
		params.require(:donor).permit(:name, :cpf, :email, :birth_date, :blood_type, :sex, :contact, :health_info, {:address => [:city, :street, :number, :state, :country]})
	end
end
