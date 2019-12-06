require 'rails_helper'

feature 'user sign in' do
  scenario 'succesfully' do
    user = User.create!(email: 'test@test.com', password: '123456')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha' , with: user.password
    click_on 'Login'
    click_on 'Sair'


    expect(current_path).to eq(root_path)
    expect(page).to have_content('Signed out successfully.') 
    expect(page).to have_link('Entrar')
    expect(page).not_to have_link('Sair')
  end
end