require_relative 'ensure'

class Journal
  attr_reader :name, :issn

  def initialize(string)
    parts = string.split(",")
    @name = parts[0]
    @issn = Ensure.seperator(parts[1])
  end


  def to_s
    "#{@name}, #{@issn}"
  end
end
