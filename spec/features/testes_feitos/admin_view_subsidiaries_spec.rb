require 'rails_helper'

feature 'Admin view Subsidiaries' do
  scenario 'successfully' do
    Subsidiary.create(name: 'Japauto', cnpj: '123' , adress: 'Rua dos Lixos, 17')

    visit root_path
    click_on 'Filiais'

    expect(page).to have_content('Japauto')
    expect(page).to have_link('Voltar')
    click_on('Voltar')

    expect(current_path).to eq root_path


  end
end
