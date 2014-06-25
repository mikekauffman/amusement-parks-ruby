class Indexer

  def initialize(input)
    @input = input
  end

  def index_by_id
    result = {}
    @input.each do |park_data|
      result[park_data[:id]] = {
        id: park_data[:id],
        name: park_data[:name],
        city: park_data[:city],
        state: park_data[:state],
        country: park_data[:country],
      }
    end
    result
  end

  def index_by_country
    result = {}
    @input.each do |park_data|
      country = park_data[:country]
      parks_info_array = result.fetch(country) { [] }
      parks_info_array = [] if parks_info_array.nil?
      park_info_hash = {
        id: park_data[:id],
        name: park_data[:name],
        city: park_data[:city],
        state: park_data[:state],
        country: park_data[:country],
      }
      result[country] = parks_info_array << park_info_hash
    end
    result
  end
end