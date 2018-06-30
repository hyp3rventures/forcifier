module Forcifier

	class FieldMassager

		#
		# Adds "__c" to all non-standard salesforce.com fields
		# * *Args*    :
		#   - fields -> comma separated list of fields "id,name,wins"
		# * *Returns* :
		#   - comma separated list of fields "id,name,wins__c"
		# * *Raises* :
		#   - ++ ->
		#
		def self.enforce_fields(fields, prefix='')
			fields.split(',').enforce(prefix).join(',')
		end

		#
		# Removes "__c" from all fields fields
		# * *Args*    :
		#   - fields -> comma separated list of fields "id,name,wins__c"
		# * *Returns* :
		#   - comma separated list of fields "id,name,wins"
		# * *Raises* :
		#   - ++ ->
		#
		def self.deforce_fields(fields)
			fields.split(',').deforce.join(',')
		end

	end
end
