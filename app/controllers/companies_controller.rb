class CompaniesController < ApplicationController
    def index
    	@companies = Company.all
    end

    def new
		@company = Company.new
    end

	def edit
		@company = Company.find(params[:id])
	end

	def destroy
		@company = Company.find(params[:id])
		@company.destroy

		redirect_to companies_path
	end    

    def create
    	@company = Company.new(company_params)
  		
  		if @company.save
  			redirect_to @company
 		else
    		render 'new'
    	end
    end

	def company_params
		params.require(:post).permit(:name, :legal_name, :zip_code, :address, :phone, :company_type)
	end

	def show
		@company = Company.find(params[:id])
	end

	private :company_params
end