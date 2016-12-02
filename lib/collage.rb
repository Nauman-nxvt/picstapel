module Picstapel
  require 'rmagick'

  class Collage
    include Magick

    def create_collage(url_list, keywords)
      collage = Image.new(1500, 500)
      x = y =  0;
      # Crop images and add to collage
      url_list.each_with_index do |val, index|
        open(val) do|f|
          File.open("./lib/img/#{keywords[index]}.jpg","wb") do |file|
            file.puts f.read
            crop_img = Magick::Image.read(file.path).first.crop_resized(300, 250, gravity=Magick::CenterGravity)
            collage.composite!(crop_img,   x,   y, OverCompositeOp)

            x >= 1200 ? (x=0;y=250) : x+=300   # Increment x by 300 in first 4 iterations, then move to second row by incrementing y by the value of height
          end
        end
      end
      p 'Enter file name for collage'
      img_name = gets.tr("\n",'')
      img_name = 'Collage' if img_name.empty?

      collage.write(ENV['HOME'] + "/Desktop/#{img_name}.png")
      p "#{img_name}.png created on Desktop"
    end

    def delete_images
      FileUtils.rm_f Dir.glob("./lib/img/*")
    end

  end
end