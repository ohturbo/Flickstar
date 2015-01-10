require 'spec_helper'

describe "visiting a Movie's show page" do
  
  it "Shows a movie and it's attributes" do
    
    movie = Movie.create(movie_attributes(total_gross: 300000000.00))
                          
                          
    visit movie_url(movie)
    
    expect(page).to have_text(movie.title)
    expect(page).to have_text(movie.rating)
    expect(page).to have_text("$300,000,000.00")
    expect(page).to have_text(movie.description)
    expect(page).to have_text(movie.released_on)
    expect(page).to have_text(movie.director)
    expect(page).to have_text(movie.cast)
    expect(page).to have_text(movie.duration)
    expect(page).to have_selector("img[src$='#{movie.image_file_name}']")
  end
  
  it "shows the total gross if the total gross exceeds $50m" do
    
    movie = Movie.create(movie_attributes(total_gross: 50000000.00))
    
    visit movie_url(movie)
    
    expect(page).to have_text("$50,000,000")
    
  end
  
  it "shows 'Flop!' if the total gross is less than $50m" do
    
    movie = Movie.create(movie_attributes(total_gross: 20000000.00))
    
    visit movie_url(movie)
    
    expect(page).to have_text("Flop!")
    
  end


end