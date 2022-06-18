module JsonApiParamsAdapter
	# Adpta o body de request do formato json:api(https://jsonapi.org/format/#fetching-sorting)
	# para o padrão compatível com ActiveRecords Strong Parameters
	def params
		params_body = super
		params_body[:data] = parse_data(params_body[:data]) if params_body[:data]
		
		params_body
	end

	def parse_data(data)
		data.permit!
		data.merge!(data[:attributes])
		data.merge!(parse_relationships(data))
	end

	def parse_relationships(data)
		return {} unless data.key?(:relationships)

		data_parsed = data[:relationships].keys.reduce({}) do |obj, attr|
			if data[:relationships][attr].key?(:data)
				datas = data[:relationships][attr][:data]
				datas = datas.is_a?(Array) ? datas.map{|data| parse_data(data) } : parse_data(datas)
				obj[attr.to_s + "_attributes"] = datas
			else
				obj[attr.to_s + "_attributes"] = data[:relationships][attr]
			end

			obj
		end

		data_parsed
	end
end