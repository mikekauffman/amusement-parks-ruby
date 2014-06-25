require 'rspec'
require_relative '../lib/indexer'

describe Indexer do
  it 'Indexes amusement park data by their id' do
    input = [
      {
        :id=>546,
        :name=>"Kalahari Resorts",
        :city=>"Wisconsin Dells",
        :state=>"Wisconsin",
        :country=>"United States"
      },
      {
        :id=>547,
        :name=>"Little Amerricka",
        :city=>"Marshall",
        :state=>"Wisconsin",
        :country=>"United States"
      }
    ]
    expected = {
      546 => {
        :id=>546,
        :name=>"Kalahari Resorts",
        :city=>"Wisconsin Dells",
        :state=>"Wisconsin",
        :country=>"United States"
      },
      547 => {
        :id=>547,
        :name=>"Little Amerricka",
        :city=>"Marshall",
        :state=>"Wisconsin",
        :country=>"United States"
      }
    }
    indexer = Indexer.new(input)
    expect(indexer.index_by_id).to eq(expected)
  end
  it 'indexes amusement park data by country' do
    input = [
      {
        :id=>546,
        :name=>"Kalahari Resorts",
        :city=>"Wisconsin Dells",
        :state=>"Wisconsin",
        :country=>"United States"
      },
      {
        :id=>547,
        :name=>"Little Amerricka",
        :city=>"Marshall",
        :state=>"Wisconsin",
        :country=>"United States"
      },
      {
        :id=>2,
        :name=>"Calaway Park",
        :city=>"Calgary",
        :state=>"Alberta",
        :country=>"Canada"
      }
    ]
    expected = {
      "Canada" => [
        {
          :id=>2,
          :name=>"Calaway Park",
          :city=>"Calgary",
          :state=>"Alberta",
          :country=>"Canada"
        }
      ],
      "United States" => [
        {
          :id=>546,
          :name=>"Kalahari Resorts",
          :city=>"Wisconsin Dells",
          :state=>"Wisconsin",
          :country=>"United States"
        },
        {
          :id=>547,
          :name=>"Little Amerricka",
          :city=>"Marshall",
          :state=>"Wisconsin",
          :country=>"United States"
        }
      ]
    }
    indexer = Indexer.new(input)
    expect(indexer.index_by_country).to eq(expected)
  end
  it 'indexes by country and state' do
    input = [
      {
        :id=>3,
        :name=>"Galaxyland",
        :city=>"Edmonton",
        :state=>"Alberta",
        :country=>"Canada"
      },
      {
        :id=>4,
        :name=>"Heratage Park",
        :city=>"Calgary",
        :state=>"Alberta",
        :country=>"Canada"
      },
      {
        :id=>6,
        :name=>"Playland (Vancouver)",
        :city=>"Vancouver",
        :state=>"British Columbia",
        :country=>"Canada"
      },
      {
        :id=>8,
        :name=>"Crystal Palace Amusement Park",
        :city=>"Dieppe",
        :state=>"New Brunswick",
        :country=>"Canada"
      }
    ]
    expected = {
      "Alberta, Canada" => [
        {
          :id => 3,
          :name => "Galaxyland",
          :city => "Edmonton",
          :state => "Alberta",
          :country => "Canada"
        },
        {
          :id => 4,
          :name => "Heratage Park",
          :city => "Calgary",
          :state => "Alberta",
          :country => "Canada"
        },
      ],
      "British Columbia, Canada" => [
        {
          :id => 6,
          :name => "Playland (Vancouver)",
          :city => "Vancouver",
          :state => "British Columbia",
          :country => "Canada"
        },
      ],
      "New Brunswick, Canada" => [
        {
          :id => 8,
          :name => "Crystal Palace Amusement Park",
          :city => "Dieppe",
          :state => "New Brunswick",
          :country => "Canada"
        }
      ]
    }
    indexer = Indexer.new(input)
    expect(indexer.index_by_country_and_state).to eq(expected)
  end
end