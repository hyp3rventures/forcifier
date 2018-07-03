class Hash
  STANDARD_OBJECTS = %w(contact organization opportunity case)
	STANDARD_FIELDS = %w(id isdeleted name createddate createdbyid lastmodifieddate lastmodifiedbyid systemmodstamp lastactivitydate contact)

  def deforce_keys!
    keys.each do |key|
      new_key = (key.downcase.gsub(/__c$/,'') rescue key) || key
      self[new_key] = delete(key)
      if self[new_key].is_a?(Hash) then self[new_key].deforce_keys! end
      if self[new_key].is_a?(Array)
        self[new_key].each { |record| record.deforce_keys! if record.is_a?(Hash) }
      end
    end
    self
  end

  def enforce_keys!(prefix)
    keys.each do |key|
      new_key = (if !(STANDARD_OBJECTS + STANDARD_FIELDS).include?key.downcase then prefix + key + '__c' end) || key
      self[new_key] = delete(key)
      if self[new_key].is_a?(Hash) then self[new_key].enforce_keys!(prefix) end
      if self[new_key].is_a?(Array)
        self[new_key].each { |record| record.enforce_keys!(prefix) if record.is_a?(Hash) }
      end
    end
    self
  end

end
