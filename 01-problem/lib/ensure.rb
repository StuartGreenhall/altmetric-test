class Ensure
  def self.seperator(rawIssn)
     if rawIssn.include?("-")
       return rawIssn
     else
       return rawIssn.insert(4, "-")
     end
  end
end
