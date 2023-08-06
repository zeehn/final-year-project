module MaidsHelper
  def main_image(movie)
    if movie.main_image.attached?
      image_tag(movie.main_image, class: "w-[208px] h-auto aspect-[4/5] object-top object-cover rounded-lg border-1 shadow-box-shadow")
    else
      image_tag("maid_ph.jpg", class: "w-[208px] h-auto aspect-[4/5] object-top object-cover rounded-lg border-1 shadow-box-shadow")
    end
  end
end
