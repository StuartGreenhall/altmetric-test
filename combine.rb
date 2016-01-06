class Article
  attr_reader :author, :title, :issn

  def initialize(string)
    parts = string.split(",")
    @author = parts[0]
    @title = parts[1]
    @issn = ensureSeperator(parts[2])
  end

  def ensureSeperator(rawIssn)
     if rawIssn.include?("-")
       return rawIssn
     else
       return rawIssn.insert(4, "-")
     end
  end

  def to_s
    "#{@author}, #{@title}, #{@issn}"
  end
end

counter = 0
articles = Array.new()
File.foreach("01-problem\\resources\\articles.csv") do | line |
  articles << Article.new(line)
  counter = counter + 1
end

articles.each do | article |
  puts article
end

puts "Process #{counter} authors"
