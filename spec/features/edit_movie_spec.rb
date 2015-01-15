require 'spec_helper'

describe "Editing a movie" do
  
  it "can visit the edit page and edit a movie's attributes" do
    
    movie = Movie.create(movie_attributes)
    
    visit movie_url(movie)
    
    click_link 'Edit'
    
    expect(current_path).to eq(edit_movie_path(movie))
    
    expect(page).to have_text("Edit Movie")
    
    expect(find_field('Title').value).to eq(movie.title)
    
    fill_in 'Title', with: "Updated Movie Title"
    
    click_button 'Update Movie'
    
    expect(current_path).to eq(movie_path(movie))
    
    expect(page).to have_text('Updated Movie Title')
    
  end
  
  it "does not update the movie if it's invalid" do
    movie = Movie.create(movie_attributes)
    
    visit edit_movie_url(movie)
    
    fill_in 'Title', with: " "
    
    click_button 'Update Movie' 
        
    expect(page).to have_text('error')
  end

  it "has a flash message for updating a movie" do
    movie = Movie.create(movie_attributes)

    visit movie_url(movie)

    click_link "Edit"

    fill_in "Title", with: "Updated Movie Title"

    click_button 'Update Movie'

    expect(page).to have_text("Movie successfully updated!")

    visit movie_url(movie)

    expect(page).to_not have_text("Movie successfully updated!")
  end
end