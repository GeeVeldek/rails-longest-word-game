require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters =[]
    10.times{ @letters << ("a".."z").to_a.sample.capitalize }
  end

  def score
    letters = params[:letters]
    letters_a = letters.split(' ')
    word = params[:word].upcase
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    user_serialized = open(url).read
    user = JSON.parse(user_serialized)
      if user["found"]
        if (word.chars.all? { |letter| word.count(letter) <= letters_a.count(letter) })
          @results = "good job"
        else
          @results = "nice try bro, those letters are not in the picks"
        end
      else
        @results = "nope doesnt exist"
      end
      # if

      # else

      # end



  end
end

    # word.each_char do |w|
    #   if letters_a.include? w
    #     if user["found"]
    #       @score = "Good Word"
    #     else
    #       @score = "Wrong english word"
    #     end
    #   else
    #     @score = "You picked letters that aren't in the grid!"
    # raise
