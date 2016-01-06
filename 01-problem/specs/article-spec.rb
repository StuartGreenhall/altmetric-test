require 'article'

RSpec.describe Article do
  it "can be built from a string" do
    article = Article.new('author,title,1234-5678')

    expect(article.author).to eq('author')
    expect(article.title).to eq('title')
    expect(article.issn).to eq('1234-5678')
  end

  it "issn should always have a - after the first four numbers" do
    article = Article.new('author,title,13378688')
    expect(article.issn).to eq('1337-8688')
  end
end
