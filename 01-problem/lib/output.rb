class Output

    # was thinking about using a hash to have the formatters logic in.
    # @formatters = {
    #   'csv' => self.to_csv,
    #   'json' => self.to_json
    # }
    # @formatters.default = Output.to_csv

  def self.data(combinedData, format)
   if format == 'csv'
      self.to_csv(combinedData)
   else
      self.to_json(combinedData)
   end
  end

  def self.to_csv(data)
    outputString = ''
    data.each do | item |
      item.values.each_with_index do | value, index |
        if(index == 0)
          outputString << value
        else
          outputString << ',' + value
        end
      end
      outputString << "\n"
    end
    return outputString
  end

  def self.to_json(data)
    return JSON.pretty_generate(data)
  end
end
