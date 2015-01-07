module ApplicationHelper
  def show_counters(counters)
    counters_text = counters.number.to_s.rjust(7, '0')
    counters_pics = ''
    counters_text.each_char do |number|
      counters_pics += image_tag("counters/#{counters.category}/#{number}.gif")
    end
    raw counters_pics
  end
end
