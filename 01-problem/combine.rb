require 'json'
require 'csv'
require './lib/article'
require './lib/journal'
require './lib/combine'
require './lib/output'

def parse_article(articles)
  return Proc.new do |line|
    aArticle = Article.new(line)
    articles << aArticle
  end
end

def parse_journal(journals)
  return Proc.new do |line|
    aJournal = Journal.new(line)
    journals[aJournal.issn] = aJournal
  end
end

def parse_file(pathToFile, store)
  #really want this to return a immutable collection
  CSV.foreach(pathToFile) do | line |
    store.call(line)
  end
end

articles = Array.new()
journals = Hash.new()

parse_file(".\\resources\\articles.csv", parse_article(articles))
parse_file(".\\resources\\journals.csv", parse_journal(journals))
authors = JSON.parse(File.read(".\\resources\\authors.json"))

combined = Combine.data(authors, articles, journals)

puts Output.data(combined, "csv");
