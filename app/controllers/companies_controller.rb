class CompaniesController < ApplicationController
    def index
        @search = Company.search(params[:q])
        @companies = @search.result(distinct: false)
        @companies = @companies.paginate(:page => params[:page], :per_page => 5).order('id DESC')
    end

    def new
		@company = Company.new
    end

	def update
		@company = Company.find(params[:id])

		if @company.update(params[:company].permit(
			:name, 
			:legal_name, 
			:zip_code, 
			:address, 
			:phone, 
			:company_type
			))
			redirect_to companies_path
		else
			render 'edit'
		end
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
    	@company = Company.new(create_company_params)
  		
  		if @company.save
			redirect_to companies_path
 		else
    		render 'new'
    	end
    end

	def create_company_params
		params.require(:company).permit(
			:name, 
			:legal_name, 
			:zip_code, 
			:address, 
			:phone, 
			:company_type
			)
	end

	def show
		@company = Company.find(params[:id])
		render 'edit'
	end

	private :create_company_params
end