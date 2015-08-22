puts "Welcome to GEM File Generator"

file = ARGV[0]

n = 0
gems = []
File.open(file, 'r') do |ln|
while line = ln.gets
 line["\n"] = ""
if line[0] != "#"
 if /[require\s\'a-zA-Z0-9\']/ === line
  line = line.split('require')
  gems[n] = line
  n += 1
 end
end
end
end

m = 0

gemfile = File.new('Gemfile', 'w+')

gemfile.write("source 'https://rubygems.org'\n")

while m < File.open('Gemfile', 'w+') {|n| n.count}
 File.write('Gemfile', "#{gems[m]}\n")
 puts "Line number #{m} has been written"
 m += 1
end
  
 


