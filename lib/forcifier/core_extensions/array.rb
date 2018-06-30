class Array

  STANDARD_FIELDS = %w(id isdeleted name createddate createdbyid lastmodifieddate lastmodifiedbyid systemmodstamp lastactivitydate currencyisocode)

  def enforce(prefix)
    self.collect { |x| STANDARD_FIELDS.include?(x.downcase) ? x : "#{prefix}#{x}__c" }
  end

  def deforce
    self.each { |x| x.gsub!(/__c$/, '') }
  end
end
