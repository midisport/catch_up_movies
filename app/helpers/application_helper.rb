module ApplicationHelper
  EMPTY_STAR_ICON = "star.svg"
  FULL_STAR_ICON = "star_fill.svg"
  HALF_STAR_ICON = "star_half.svg"

  def full_and_half_star_count(rating)
    (rating * 2).round.divmod(2)
  end

  def stars(rating, max_stars: 5)
    full_stars, half_stars = full_and_half_star_count(rating)

    Array.new(max_stars, EMPTY_STAR_ICON).
      fill(FULL_STAR_ICON, 0, full_stars).
      fill(HALF_STAR_ICON, full_stars, half_stars)
  end
end
