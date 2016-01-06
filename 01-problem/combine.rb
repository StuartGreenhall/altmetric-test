require './lib/article'

counter = 0
articles = Array.new()
File.foreach(".\\resources\\articles.csv") do | line |
  articles << Article.new(line)
  counter = counter + 1
end

articles.each do | article |
  puts article
end

puts "Process #{counter} authors"
