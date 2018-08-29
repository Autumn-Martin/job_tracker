require 'rails_helper'

describe 'User sees all comments for a job' do
  describe 'when user visits job/show page' do
    it 'shows all comments for a job' do
      company = Company.create(name: 'NLC')

      visit company_path(company)

      fill_in "company_contact[full_name]", with: "Nick Lindy"
      fill_in "company_contact[position]", with: "Hiring Manager"
      fill_in "company_contact[full_name]", with: "nick@nicklindycodes.com"
      click_button "Create"

      expect(page).to have_content(company_contact.full_name)
      expect(page).to have_content(company_contact.full_name)
      expect(page).to have_content(company_contact.full_name)
    end
  end
end
