# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

# Prints a header for the movies output
#puts "Movies"
#puts "======"
#puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
#puts ""
#puts "Top Cast"
#puts "========"
#puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

#Studio Data Dump

Studio.destroy_all

#puts "studios : #{Studio.all.count}"

new_studio1 = Studio.new
new_studio1["name"] = "Warner Bros."
new_studio1.save

#puts "studios : #{Studio.all.count}"

#Movie Data Dump

Movie.destroy_all

#puts "movies : #{Movie.all.count}"

studio1 = Studio.find_by({ "name" => "Warner Bros." })

new_movie1 = Movie.new
new_movie1["title"] = "Batman Begins"
new_movie1["year_released"] = "2005"
new_movie1["rated"] = "PG-13"
new_movie1["studio_id"] = studio1["id"]
new_movie1.save

studio2 = Studio.find_by({ "name" => "Warner Bros." })

new_movie2 = Movie.new
new_movie2["title"] = "The Dark Knight"
new_movie2["year_released"] = "2008"
new_movie2["rated"] = "PG-13"
new_movie2["studio_id"] = studio2["id"]
new_movie2.save

studio3 = Studio.find_by({ "name" => "Warner Bros." })

new_movie3 = Movie.new
new_movie3["title"] = "The Dark Knight Rises"
new_movie3["year_released"] = "2012"
new_movie3["rated"] = "PG-13"
new_movie3["studio_id"] = studio3["id"]
new_movie3.save

#puts "movies : #{Movie.all.count}"


#Actors Data Dump

Actor.destroy_all

#puts "actors : #{Actor.all.count}"

new_actor = Actor.new
new_actor["name"] = "Christian Bale"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Michael Caine"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Liam Neeson"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Katie Holmes"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Gary Oldman"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Heath Ledger"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Aaron Eckhart"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Maggie Gyllenhaal"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Tom Hardy"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Joseph Gordon-Levitt"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Anne Hathaway"
new_actor.save

#puts "actors : #{Actor.all.count}"

#Roles Data Dump

Role.destroy_all

#puts "roles : #{Role.all.count}"

movie = Movie.find_by({ "title" => "Batman Begins" })
actor = Actor.find_by({ "name" => "Christian Bale" })
new_role = Role.new
new_role["movie_id"] = movie["id"]
new_role["actor_id"] = actor["id"]
new_role["character_name"] = "Bruce Wayne"
new_role.save

movie = Movie.find_by({ "title" => "Batman Begins" })
actor = Actor.find_by({ "name" => "Michael Caine" })
new_role = Role.new
new_role["movie_id"] = movie["id"]
new_role["actor_id"] = actor["id"]
new_role["character_name"] = "Alfred"
new_role.save

movie = Movie.find_by({ "title" => "Batman Begins" })
actor = Actor.find_by({ "name" => "Liam Neeson" })
new_role = Role.new
new_role["movie_id"] = movie["id"]
new_role["actor_id"] = actor["id"]
new_role["character_name"] = "Ra's Al Ghul"
new_role.save

movie = Movie.find_by({ "title" => "Batman Begins" })
actor = Actor.find_by({ "name" => "Katie Holmes" })
new_role = Role.new
new_role["movie_id"] = movie["id"]
new_role["actor_id"] = actor["id"]
new_role["character_name"] = "Rachel Dawes"
new_role.save

movie = Movie.find_by({ "title" => "Batman Begins" })
actor = Actor.find_by({ "name" => "Gary Oldman" })
new_role = Role.new
new_role["movie_id"] = movie["id"]
new_role["actor_id"] = actor["id"]
new_role["character_name"] = "Commissioner Gordon"
new_role.save

movie = Movie.find_by({ "title" => "The Dark Knight" })
actor = Actor.find_by({ "name" => "Christian Bale" })
new_role = Role.new
new_role["movie_id"] = movie["id"]
new_role["actor_id"] = actor["id"]
new_role["character_name"] = "Bruce Wayne"
new_role.save

movie = Movie.find_by({ "title" => "The Dark Knight" })
actor = Actor.find_by({ "name" => "Heath Ledger" })
new_role = Role.new
new_role["movie_id"] = movie["id"]
new_role["actor_id"] = actor["id"]
new_role["character_name"] = "Joker"
new_role.save

movie = Movie.find_by({ "title" => "The Dark Knight" })
actor = Actor.find_by({ "name" => "Aaron Eckhart" })
new_role = Role.new
new_role["movie_id"] = movie["id"]
new_role["actor_id"] = actor["id"]
new_role["character_name"] = "Harvey Dent"
new_role.save

movie = Movie.find_by({ "title" => "The Dark Knight" })
actor = Actor.find_by({ "name" => "Michael Caine" })
new_role = Role.new
new_role["movie_id"] = movie["id"]
new_role["actor_id"] = actor["id"]
new_role["character_name"] = "Alfred"
new_role.save

movie = Movie.find_by({ "title" => "The Dark Knight" })
actor = Actor.find_by({ "name" => "Maggie Gyllenhaal" })
new_role = Role.new
new_role["movie_id"] = movie["id"]
new_role["actor_id"] = actor["id"]
new_role["character_name"] = "Rachel Dawes"
new_role.save

movie = Movie.find_by({ "title" => "The Dark Knight Rises" })
actor = Actor.find_by({ "name" => "Christian Bale" })
new_role = Role.new
new_role["movie_id"] = movie["id"]
new_role["actor_id"] = actor["id"]
new_role["character_name"] = "Bruce Wayne"
new_role.save

movie = Movie.find_by({ "title" => "The Dark Knight Rises" })
actor = Actor.find_by({ "name" => "Gary Oldman" })
new_role = Role.new
new_role["movie_id"] = movie["id"]
new_role["actor_id"] = actor["id"]
new_role["character_name"] = "Commissioner Gordon"
new_role.save

movie = Movie.find_by({ "title" => "The Dark Knight Rises" })
actor = Actor.find_by({ "name" => "Tom Hardy" })
new_role = Role.new
new_role["movie_id"] = movie["id"]
new_role["actor_id"] = actor["id"]
new_role["character_name"] = "Bane"
new_role.save

movie = Movie.find_by({ "title" => "The Dark Knight Rises" })
actor = Actor.find_by({ "name" => "Joseph Gordon-Levitt" })
new_role = Role.new
new_role["movie_id"] = movie["id"]
new_role["actor_id"] = actor["id"]
new_role["character_name"] = "John Blake"
new_role.save

movie = Movie.find_by({ "title" => "The Dark Knight Rises" })
actor = Actor.find_by({ "name" => "Anne Hathaway" })
new_role = Role.new
new_role["movie_id"] = movie["id"]
new_role["actor_id"] = actor["id"]
new_role["character_name"] = "Selina Kyle"
new_role.save

#puts "roles : #{Role.all.count}"

#Now the printouts

puts "Movies"
puts "======"
puts ""

movies_lits = Movie.all

for movie in movies_lits

    the_title = movie["title"]
    the_year = movie["year_released"]
    the_rating = movie["rated"]
    the_studio_id = movie["studio_id"]
    the_studio = Studio.find_by({ "id" => the_studio_id})
    the_studio_name = the_studio["name"]
    
    puts "#{the_title} | #{the_year} | #{the_rating} | #{the_studio_name}"

end

puts ""
puts "Top Cast"
puts "========"
puts ""

cast_list = Role.all

for actor in cast_list

    the_movie_id = actor["movie_id"]
    the_movie = Movie.find_by({ "id" => the_movie_id})
    the_movie_name = the_movie["title"]

    the_actor_id = actor["actor_id"]
    the_actor = Actor.find_by({ "id" => the_actor_id})
    the_actor_name = the_actor["name"]

    the_character = actor["character_name"]
    
    puts "#{the_movie_name} | #{the_actor_name} | #{the_character}"

end