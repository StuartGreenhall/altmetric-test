class Article
  attr_reader :doi, :title, :issn

  def initialize(string)
    parts = string.split(",")
    @doi = parts[0]
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
    "#{@doi}, #{@title}, #{@issn}"
  end
end
