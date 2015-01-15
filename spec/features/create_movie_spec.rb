require 'spec_helper'

describe "creating a new movie" do
  
  it "Saves the movie and shows movie details" do
    
    visit movies_url
    
    click_link "New Movie"
    
    expect(current_path).to eq(new_movie_path)
    
    expect(page).to have_text("New Movie")
    
    fill_in "Title", with: "New Movie Title"
    fill_in "Description", with: "Superheroes saving the world from villains"
    select "PG-13", from: "Rating"
    fill_in "Released on", with: "12/12/2012"
    fill_in "Total gross", with: "75000000"
    fill_in "Cast", with: "The award winning cast"
    fill_in "Director", with:"The ever creative director"
    fill_in "Duration", with: "123 min"
    fill_in "Image file name", with: "movie.png"
    
    click_button "Create Movie"
    
    expect(current_path).to eq(movie_path(Movie.last))
    
    expect(page).to have_text("New Movie Title")
    expect(page).to have_text("Movie successfully created!")
    
  end

  it "does not save the movie if it's invalid" do
    visit new_movie_url
    
    expect { 
      click_button 'Create Movie' 
    }.not_to change(Movie, :count)
    
    expect(current_path).to eq(movies_path)   
    expect(page).to have_text('error')
  end
  
  
end