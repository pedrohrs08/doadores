class DonorsController < ApplicationController

	def create
		p donor_params
		donor = Donor.new(donor_params)
		respond_to do |format|
		  format.json { render :json => donor }
	    end
	end

	private 
	def donor_params
		params.require(:donor).permit(:name, :cpf, :email, :birth_date, :blood_type, {:address => [:city]})
	end
end
