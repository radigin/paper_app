module Generator
  extend ActiveSupport::Concern

  def generates(hscale = 1.0, points = 2000, seed = 1234567890)
    
  end
  
  def main_f(angle, gap)
    10.0 * Math.sin((5.0 + rand(0.5)) * angle)
  end
  
  def secondary_f(angle, gap, sc = :sin, vscale = 0.5, hscale = 25.0)
    scale * Math.try(sc, hscale * angle)
  end
  
  def fun(angle, gap)
    gaps = [rand(Math::PI), rand(Math::PI/2), rand(Math::PI/3), 
      rand(Math::PI/4)]
    main_f(angle, gaps[0]) + secondary_f(angle, gaps[1]) + secondary_f(angle, 
      gaps[2], :cos, 0.2, 50.0) + secondary_f(angle, gaps[3], 
        :sin, 0.3, 35.0) + r()
  end
  
  def r()
    50
  end
end