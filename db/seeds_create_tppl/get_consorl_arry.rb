text = []
File.open("bb.text","r") do |file|
  file.each_line do |line|
     text << line.chomp
  end
end
print text
