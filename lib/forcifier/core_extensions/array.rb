class Array
  STANDARD_OBJECTS = %w(lead contact organization opportunity case account asset)
  STANDARD_FIELDS = %w(id isdeleted name createddate createdbyid lastmodifieddate lastmodifiedbyid systemmodstamp lastactivitydate currencyisocode)

  def enforce(prefix)
    self.collect { |x| (STANDARD_OBJECTS + STANDARD_FIELDS).include?(x.downcase) ? x : "#{prefix}#{x}__c" }
  end

  def deforce
    self.each { |x| x.gsub!(/__c$/, '') }
  end
end
