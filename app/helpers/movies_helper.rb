module MoviesHelper

  def format_total_gross(movie)
    if movie.flop?
      content_tag(:strong, "Flop!")
    else
      number_to_currency(movie.total_gross)
    end
  end

  def image_for(movie)
  	if movie.image_file_name.blank?
  		image_tag("blank.png")
  	else
  		image_tag(movie.image_file_name)
  	end
  end

  def format_average_stars(movie)
    if movie.average_stars.nil?
      link_to "No Reviews!", new_movie_review_path(movie)
    else
      content_tag(:h1, "#{number_with_precision(movie.average_stars, precision: 1)} / 5 #{'*'*movie.average_stars}")
    end
  end
end
