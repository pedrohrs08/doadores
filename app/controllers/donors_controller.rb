class DonorsController < ApplicationController

	def create
		p donor_params
		donor = Donor.create!(donor_params)
		respond_to do |format|
		  format.json { render :json => donor }
	    end
	end

	def names
		donors = Donor.all 
		donors_name = { names: [] }
		donors_name[:names] = donors.map {|donor| { id: donor.id, name: donor.name } }
		respond_to do |format|
			format.json { render :json => donors_name }
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
