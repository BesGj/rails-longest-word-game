require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = Array('A'..'Z').sample(10)
  end

  def score
  @letters = params[:letters].split(" ")
  @user_input = params[:user_input].upcase
  @results = ''
  url = "https://wagon-dictionary.herokuapp.com/#{@user_input}"
  abc = open(url).read
  @check = JSON.parse(abc)

    if @check['found']
      if @user_input.chars.all? { |letter| @letters.include? letter }
        @results = "Yes this is word exist and is contained in the letters"
      else
        @results = "Letters are not included"
      end
    else
      @results = "It is not an English word"
    end


  end
end
