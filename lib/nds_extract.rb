# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
newarray=[]
  element_index=0
   while element_index<movies_collection.length do 
   results={}
   results[:director_name]=name
   results[:movie]=movies_collection[element_index]
   newarray << results
   element_index+=1
  end
newarray
end

  

  def gross_per_studio(collection)
  studio={}
  counter=0 
  while counter<collection.length do
    movie_info= collection[counter]
    if 
      !studio[movie_info[counter]]
      then studio[movie_info[counter]]=movie_info[:worldwide_gross] 
    else
    studio[movie_info[:studio]]=movie_info[:worldwide_gross]+studio[movie_info[:studio]]
  end 
    counter+=1
  end
    studio
    binding.pry
  end
  
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash

def movies_with_directors_set(source)
  newarray2=[]
  element_index=0 
  while element_index<source.length do 
  newarray2 << movies_with_director_key(source[element_index][:name], source[element_index][:movies])
  element_index+=1 
end
  newarray2
end
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
