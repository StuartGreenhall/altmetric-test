require './lib/article'
require './lib/journal'
require './lib/combine'
require './lib/output'
require './lib/parser'

if ARGV.empty? || ARGV.length < 5
   puts "\n\nError - No arguments supplied"
   puts "Usage:"
   puts "   ruby combine.rb --format json journals.csv articles.csv authors.json > full_articles.json"
   puts " \n"
   exit(-1)
else
  parse = Parser.new()
  articles = parse.articles(ARGV[3])
  journals = parse.journals(ARGV[2])
  authors = parse.authors(ARGV[4])

  combined = Combine.data(authors, articles, journals)

  puts Output.data(combined, ARGV[1]);
end
