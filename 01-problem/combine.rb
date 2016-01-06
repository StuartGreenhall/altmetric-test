require './lib/article'

counter = 0
articles = Hash.new()
File.foreach(".\\resources\\articles.csv") do | line |
  aArticle = Article.new(line)
  articles[aArticle.issn] = aArticle 
  counter = counter + 1
end

articles.each do | article |
  puts article
end

puts "Process #{counter} authors"
