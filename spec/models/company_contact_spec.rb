require 'rails_helper'

describe CompanyContact do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without content' do
        company_contact = CompanyContact.new()

        expect(company_contact).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with content' do
        company = Company.create(name: "Lindy Code Works")
        company_contact = CompanyContact.new(full_name: "NickLindy", position: "Dev", email: "nicklindycodes@nicklindy.com", company_id: company.id )

        expect(company_contact).to be_valid
      end
    end
  end

  describe 'relationships' do
    it 'belongs to company' do
      company = Company.create(name: "Lindy Code Works")
      company_contact = CompanyContact.new(full_name: "NickLindy", position: "Dev", email: "nicklindycodes@nicklindy.com", company_id: company.id )

      expect(company_contact).to respond_to(:company)
    end
  end
end
