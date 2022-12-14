require 'rails_helper'

feature "Creating Contact" do 

  scenario "allows acees to contacts page" do 
    visit new_contacts_path

    expect(page).to have_content 'Contact us'
  end
end