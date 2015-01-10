require 'spec_helper'

describe "Viewing the list of movies" do
  
  it "shows the movies" do
    
    movie1 = Movie.create(movie_attributes)

    movie2 = Movie.create(title: "Superman",
                          rating: "PG",
                          total_gross: 134218018.00,
                          description: "Clark Kent grows up to be the greatest super-hero",
                          released_on: "1978-12-15",
                          director: "Someguy",
                          cast: "Some people",
                          duration: "126 mins"
                          )

    movie3 = Movie.create(title: "Spider-Man",
                          rating: "PG-13",
                          total_gross: 403706375.00,
                          description: "Peter Parker gets bit by a genetically modified spider",
                          released_on: "2002-05-03",
                          director: "Someguy",
                          cast: "Some people",
                          duration: "126 mins"
                          )
    visit movies_url
    
    expect(page).to have_text("3 Movies")
    
    expect(page).to have_text(movie1.title)
    expect(page).to have_text(movie1.rating)
    expect(page).to have_text(movie1.description)
    expect(page).to have_text(movie1.released_on)
    expect(page).to have_text("$318,412,101.00")
    expect(page).to have_text(movie1.cast)
    expect(page).to have_text(movie1.duration)
    expect(page).to have_selector("img[src$='#{movie1.image_file_name}']")

    
    expect(page).to have_text(movie2.title)
    expect(page).to have_text(movie3.title)
  end

  it "does not show movies that haven't been released" do
    movie4 = Movie.create(title: "Future Movie",
                          rating: "R",
                          total_gross: 1000000000.00,
                          description: "Little monkeys crawl out of uranus and get lost in space!",
                          released_on: "2016-05-05")

    visit movies_url

    expect(page).not_to have_text(movie4.title)



  end
  
end