# Frozen_string_literal: true

def rec_del(dir)
  jsons = dir.select { |x| x.end_with?("json") }
  jsons.each do |json|
    File.delete(json)
  end
  dir.reject { |x| x.include?('.') }
  dir.each do |d|
    rec_del(Dir.glob(d + "/*"))
  end
end



ARGV.each do |arg|
  puts "Removing #{arg}s"
  rec_del(Dir.glob("*"), arg)
end

puts "Done. Hope this makes your life easier"
