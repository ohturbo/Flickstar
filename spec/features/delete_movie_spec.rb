require 'spec_helper'

describe "Deleting a movie from the database" do
  
  it "deletes a movie and returns to the index page" do
    
    movie = Movie.create(movie_attributes(title: "Really Bad Movie"))
    
    visit movie_path(movie)
    
    click_link "Delete"
    
    expect(current_path).to eq(movies_path)
    
    expect(page).to_not have_text("Really Bad Movie")
     
    expect(page).to have_text("Movie successfully deleted!")
  end
  
end