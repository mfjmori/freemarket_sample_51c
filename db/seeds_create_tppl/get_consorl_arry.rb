text = []
File.open('konoko','r') do |file|
  file.each_line do |line|
     text << line.chomp
  end
end
print text
