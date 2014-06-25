class Indexer
  def initialize(input)
    @input = input
  end
  def sort_by_id
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
end
#
# input = [
#   {
#     :id=>546,
#     :name=>"Kalahari Resorts",
#     :city=>"Wisconsin Dells",
#     :state=>"Wisconsin",
#     :country=>"United States"
#   },
#   {
#     :id=>547,
#     :name=>"Little Amerricka",
#     :city=>"Marshall",
#     :state=>"Wisconsin",
#     :country=>"United States"
#   }
# ]
# expected = {
#   546 => {
#     :id=>546,
#     :name=>"Kalahari Resorts",
#     :city=>"Wisconsin Dells",
#     :state=>"Wisconsin",
#     :country=>"United States"
#   },
#   547 => {
#     :id=>547,
#     :name=>"Little Amerricka",
#     :city=>"Marshall",
#     :state=>"Wisconsin",
#     :country=>"United States"
#   }
# }