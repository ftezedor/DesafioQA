def handler_1(obj)
  ks = obj['main'].select { |k| k.start_with?("temp") }
  dt = ks.map {|k, v| "#{k} = #{(v - 273.15).round(2)} °C"}.join("\n")
  return "Wheather info for '#{obj['name']}'\n\n#{dt}"
end

def handler_2(obj)
  ks = obj['main'].map {|k, v| handle(k, v)}.to_h
  ks['visibility'] = obj["visibility"]
  dt = ks.map {|k, v| "#{k} = #{v}"}.join("\n")
  return "Wheather info for #{obj['name']} (#{obj['coord']['lat']}°N #{obj['coord']['lon']}°E)'\n\n#{dt}"
end


Given('the user goes to the wheather webpage') do
  @page = Wheather.new($config["wheather_appid"])
end

Given('the user goes to the wheather webpage with the wrong key') do
  @page = Wheather.new("huuu74uys8yedh32iyuioh703g")
end

When('it pulls off wheather data by city name') do
  begin
    @data = @page.search_by_city("Sao Paulo", method(:handler_1))
  rescue Exception => e
    puts "Error: #{e}"
  end
end

Then('display results') do
  puts @data
end



When('it pulls off wheather data by city coords') do
  @data = @page.search_by_coords("48.8566419", "2.3518481", method(:handler_2))
end


