def movie_attributes(overrides = {})
  {
    title: "Iron Man",
    rating: "PG-13",
    total_gross: 318412101.00,
    description: "Tony Stark builds an armored suit to fight the throes of evil",
    released_on: "2008-05-02",
    duration: "123 min",
    cast: "Robert Downey Jr., Gwyneth Paltrow and Terrence Howard",
    director: "John Favreau",
    image_file_name: "ironman.jpg"
  }.merge(overrides)
end