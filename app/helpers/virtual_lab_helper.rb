module VirtualLabHelper
  def draw_field_for_round_diagram
    tag(:circle, cx: @center_x, cy: @center_y, r: @width * 0.95 / 2, 
      fill: 'rgb(255, 255, 170)') + 
    tag(:circle, cx: @center_x, cy: @center_y, r: @width * 0.5 / 2, 
      fill: 'none', 'stroke-width' => 1, stroke: 'rgb(133, 102, 81)') + 
    tag(:circle, cx: @center_x, cy: @center_y, r: @width * 0.80 / 2, 
      fill: 'none', 'stroke-width' => 1, stroke: 'rgb(133, 102, 81)') + 
    tag(:circle, cx: @center_x, cy: @center_y, r: @width * 0.95 / 2, 
      fill: 'none', 'stroke-width' => 1, stroke: 'rgb(133, 102, 81)') + 
    tag(:circle, cx: @center_x, cy: @center_y, 
      r: @width * 0.35 / 2, fill: 'rgb(255, 255, 255)', 
      'stroke-width' => 1, stroke: 'rgb(133, 102, 81)') + 
    raw((0..11).map do |i|
      phi = i * Math::PI / 6
      grad = (360 - i * 30) % 360
      r1 = @width * 0.35 / 2
      r2 = @width * 0.95 / 2
      r3 = @width / 2 + 10
      x1 = r1 * Math.cos(phi) + @center_x
      y1 = r1 * Math.sin(phi) + @center_y
      x2 = r2 * Math.cos(phi) + @center_x
      y2 = r2 * Math.sin(phi) + @center_y
      x3 = r3 * Math.cos(phi) + @center_x
      y3 = r3 * Math.sin(phi) + @center_y
      tx = x3 - 9 * grad.to_s.size / 2.0
      ty = y3 + 7
      tag.text(x: tx, y: ty, fill: 'black', style: 'font-size: 14px') do
        grad.to_s + '°'
      end + 
      tag(:line, x1: x1, y1: y1, x2: x2, y2: y2, 
        'stroke-width' => 1, stroke: 'rgb(133, 102, 81)')
    end.join()) +
    tag(:circle, id: :redline, cx: @center_x, cy: @center_y, r: @width * 0.65 / 2, 
      fill: 'none', 'stroke-width' => 2, stroke: 'rgb(255, 0, 0)') +
    raw((0..4).map do |i|
      m = -20 + i * 10
      r = @width * (0.35 + 0.15 * i) / 2
      phi = 3* Math::PI / 2
      x = r * Math.cos(phi) + @center_x + 2
      y = r * Math.sin(phi) + @center_y - 2 
      tag.text(x: x, y: y, fill: 'black', style: 'font-size: 10px') do
        (m < 0 ? '' : (m == 0 ? raw('&nbsp;&nbsp;') : raw('&nbsp;'))) + m.to_s + ' мкм'
      end
    end.join())
  end
  
  def draw_sector_of_round_diagram(ary, i, j)
    rd = @r_max - @r_min
    ravg = (@r_max + @r_min) / 2
    min, max = ary.minmax{ |a, b| a[1] <=> b[1] }
    dd = max[1] - min[1]
    scale = rd / dd / 2 
    davg = (min[1] + max[1]) / 2
    tmp = []
    raw((0...ary.size).map do |k|
      prev_phi = ary[k - 1][0]
      prev_r = ary[k - 1][1] * scale + ravg 
      prev_x = prev_r * Math.cos(prev_phi) + @center_x
      prev_y = prev_r * Math.sin(prev_phi) + @center_y 
      phi = ary[k][0]
      r = ary[k][1] * scale + ravg 
      x = r * Math.cos(phi) + @center_x
      y = r * Math.sin(phi) + @center_y 
      if k >= i and k <= j
        tag(:line, x1: prev_x, y1: prev_y, x2: x, y2: y, 
            'stroke-width' => 1, stroke: 'rgb(0, 0, 255)', fill: 'none')
      else
        ''
      end
    end.join(''))
  end
end
 