class Combine
  def self.data(authors, articles, journals)
    combined = Array.new
    count = 0
    authors.each do | author |
      author['articles'].each do | doi |
        articles.any? do |article|
          if(doi == article.doi)
            combined << {
              :doi => article.doi,
              :title => article.title,
              :author => author['name'],
              :journal => journals[article.issn].name,
              :issn => article.issn
            }
          end
        end
      end
    end
    combined
  end
end
