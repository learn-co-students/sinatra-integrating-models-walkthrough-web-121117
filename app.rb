require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    @word_count = @analyzed_text.count_of_words #=> 9
    @vowels = @analyzed_text.count_of_vowels #=> 13
    @const = @analyzed_text.count_of_consonants #=> 22
    @most_used_letter_hash = @analyzed_text.most_used_letter #=> ["n", 6]
    @most_used_letter = @most_used_letter_hash.keys.first
    @times = @most_used_letter_hash[@most_used_letter]

    erb :results
  end
end
