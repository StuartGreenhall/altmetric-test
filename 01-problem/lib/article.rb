require_relative 'ensure'

class Article
  attr_reader :doi, :title, :issn

  def initialize(parts)
    @doi = parts[0]
    @title = parts[1]
    @issn = Ensure.seperator(parts[2])
  end

  def to_s
    "#{@doi}, #{@title}, #{@issn}"
  end
end
