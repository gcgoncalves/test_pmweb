class Company < ActiveRecord::Base
  
    validates :name, :presence => {:message => "Campo obrigatorio"}
	validates :legal_name, :presence => {:message => "Campo obrigatorio"}
	validates :zip_code, :presence => {:message => "Campo obrigatorio"}
	validates :address, :presence => {:message => "Campo obrigatorio"}
	validates :phone, :presence => {:message => "Campo obrigatorio"}
	validates :company_type, :presence => {:message => "Campo obrigatorio"}
    
    validates_format_of :zip_code,
                    :with => %r{\d{2}\.\d{3}-\d{3}},
                    :message => "CEP deve estar no formato 99.999-999"
    validates_format_of :phone,
                    :with => %r{(\(\d{2}\))?\d{4}-\d{4}},
                    :message => "Telefone deve estar no formato (99)9999-9999 ou 9999-9999"

end
