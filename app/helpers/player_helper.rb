module PlayerHelper
  def star_class(stars)
    if stars == 7
      'class=ready'
    elsif stars == 6
      'class=almost'
    else
      'class=nope'
    end
  end

  def gear_class(gear)
    if %w(XI X).include?(gear)
      'class=ready'
    elsif gear == 'IX'
      'class=almost'
    else
      'class=nope'
    end
  end

  def level_class(level)
    if level.to_i == 85
      'class=ready'
    elsif level.to_i > 80
      'class=almost'
    else
      'class=nope'
    end
  end
end
