module Picstapel

  class Pic
    require 'flickraw'
    FlickRaw.api_key="413baed825d63f6607bc6c99e37c060e"
    FlickRaw.shared_secret="54c6b931993fcaf5"

    def get_image_urls_for_keywords(keywords)
      url_list= []
      keywords.each_with_index do |word, index|
        image = flickr.photos.search(tags: word, media: 'photos', per_page: 1, 'dimension_search_mode': 'min', 'height': 500, 'width': 500) #, extras: 'url_o'
        unless image.first.nil?
          url_list << "http://farm#{image.first.farm}.static.flickr.com/#{image.first.server}/#{image.first.id}_#{image.first.secret}.jpg"
        else
          keywords[index] = word = Keyword.random_word
          redo
        end
      end
      url_list
    end
  end
end

