require_relative '../spec_helper'

RSpec.describe 'use can view an individual stations page' do
  it 'will display correct stations page' do
    City.create(name: "Perth")
    city = City.find(1)
    station = city.stations.create(name: "MLK", dock_count: 22, installation_date: "2011-11-12")


    visit("/stations")
    click_on "Additional Info"

    expect(current_path).to eq("/stations/#{station.id}")

    expect(page).to have_content("MLK")
    expect(page).to have_content("Edit")
    save_and_open_page
  end
end