class Parser

  def articles(pathToArticles)
    articles = Array.new
    parse_file(pathToArticles, parse_article(articles))
    articles
  end

  def journals(pathToJournals)
    journals = Hash.new
    parse_file(pathToJournals, parse_journal(journals))
    journals
  end

  def authors(pathToAuthors)
    begin
      return JSON.parse(File.read(pathToAuthors))
    rescue
      abort("file does not exist: #{pathToAuthors}")
    end
  end

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
    begin
      CSV.foreach(pathToFile) do | line |
        store.call(line)
      end
    rescue
      abort("file does not exist: #{pathToFile}")
    end
  end

  private :parse_file, :parse_journal, :parse_article
end
