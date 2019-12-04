require 'rails_helper'

feature 'Admin register a Subsidiary' do
  scenario 'successfully' do



    visit root_path
    click_on 'Filiais'
    click_on 'Cadastrar nova Filial'
    fill_in 'Nome' , with: 'Auto Shopping Global'
    fill_in 'CNPJ' , with: '343'
    fill_in 'Endereço' , with: 'Avenida dos Autonomistas, 666'
    click_on 'Enviar'


    expect(page).to have_content('Auto Shopping Global')


  end

  scenario 'and edit a Subsidiary' do

    Subsidiary.create(name: 'Auto Shopping Global', cnpj: '343', adress: 'Avenida dos Autonomistas, 666')
    visit root_path
    click_on 'Filiais'
    expect(page).to have_content('Auto Shopping Global')
    click_on 'Editar'

    fill_in 'Nome', with: 'Loja das lojas'
    click_on 'Enviar'

    expect(page).to have_content('Loja das lojas')
  end
end



















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
