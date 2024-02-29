require "rails_helper"

RSpec.describe "destinations show page", vcr: true, type: :feature do
  before :each do
    @dest = Destination.create!(
        name: "New Orleans",
        zip: 70115,
        description: Faker::Lorem.sentence,
        image_url: Faker::Placeholdit.image
      )
  end

  it "shows the destination's name, zipcode, description and current weather" do
    visit root_path

    expect(page).to have_content(@dest.name)
    expect(page).to have_link("Show")

    click_link "Show"

    expect(current_path).to eq(destination_path(@dest))
    expect(page).to have_content(@dest.name)
    expect(page).to have_content(@dest.zip)
    expect(page).to have_content(@dest.description)
    expect(page).to have_content("Forecast for #{@dest.name}:")
  end

  it "shows weather info, like date, current, high and low temps, a summary and an image of the weather" do
    visit destination_path(@dest)

    expect(current_path).to eq(destination_path(@dest))
    expect(page).to have_content(@dest.name)
    expect(page).to have_content("Forecast for #{@dest.name}:")
    expect(page).to have_content("Date:")
    expect(page).to have_content("Current Temp:")
    expect(page).to have_content("High Temp:")
    expect(page).to have_content("Low Temp:")
    expect(page).to have_content("Weather Summary:")
  end
end
