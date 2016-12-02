module Picstapel
  class Keyword
     dictionary_path = File.expand_path('../dictionary/words.txt', __FILE__)
     @@words = File.readlines(dictionary_path)

    def self.random_word
      @@words[rand(@@words.size)].chomp
    end

    #generate keywords array
    def generate_keywords
      p 'Enter up to 10 keywords separated by space'
      keywords = gets.tr('^A-Za-z0-9\s', ' ').split(' ')
      p 'Fetching images...'
      if keywords.length < 10
        (10 - keywords.length).times { keywords <<  Keyword.random_word }
      end
      keywords[0..9]
    end

  end
end