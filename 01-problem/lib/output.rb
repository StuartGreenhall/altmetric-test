class Output
  def self.data(combinedData, format)
   if format == 'csv'
      self.to_csv(combinedData)
   else
     to_json(combinedData)
   end
  end

  def self.to_csv(data)
    outputString = ''
    data.each do | item |
      item.values.each do | value |
        outputString << ',' + value
      end
      outputString << "\n"
    end
    outputString
  end

  def self.to_json(data)

  end

end
