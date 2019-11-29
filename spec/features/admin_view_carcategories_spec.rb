require 'rails_helper'

feature 'Admin view Car Categories' do
  scenario 'successfully' do
    CarCategory.create(name: 'SUV', daily_rate: 1.3 , car_insurance: 2.90 , third_party_insurance: 4.300)

    visit root_path
    click_on 'Categorias de carros'

    expect(page).to have_content('SUV')
    expect(page).to have_link('Voltar')
    click_on('Voltar')

    expect(current_path).to eq root_path


  end
end
