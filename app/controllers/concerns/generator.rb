module Generator
  extend ActiveSupport::Concern

  def set_field_params(width = 600)
    @width = width
    @center_x = @width / 2 + 25
    @center_y = @width / 2 + 25
    @r_min = @width * 0.35 / 2
    @r_max = @width * 0.95 / 2    
  end
  
  def generates(hscale = 1.0, points = 2000, seed = 1234567890)
    ary = []
    phi = 2 * Math::PI / points
    gaps = [rand(Math::PI), rand(Math::PI/2), rand(Math::PI/3), 
      rand(Math::PI/4)]
    for i in 0...points
      cur_phi = phi * i
      ary << [cur_phi, fun(cur_phi, gaps)]
    end
    ary
  end
  
  def main_f(angle, gap)
    3.0 * Math.sin(2.0 * angle + gap)
  end
  
  def secondary_f(angle, gap, sc = :sin, vscale = 0.5, hscale = 40.0)
    vscale * Math.try(sc, hscale * angle + gap)
  end
  
  def fun(angle, gaps)
    main_f(angle, gaps[0]) + secondary_f(angle, gaps[1], :sin, 0.5, 20 + rand(20)) + 
      secondary_f(angle, gaps[2], :cos, 0.2, 100.0 + rand(100)) + 
      secondary_f(angle, gaps[3], :sin, 0.3, 200.0 + rand(200))
  end
end