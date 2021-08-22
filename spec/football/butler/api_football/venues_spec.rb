# frozen_string_literal: true

RSpec.describe Football::Butler::Venues do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
      api_name: :api_football_com
    )

    stubs_venues
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_city' do
    context 'success' do
      it 'returns venues' do
        response = described_class.by_city(city: 'Hamburg')

        expect(response).to be_a(Array)
        expect(response).to match_array(response_venues)
      end
    end
  end

  describe 'when by_country' do
    context 'success' do
      it 'returns venues' do
        response = described_class.by_country(country: 'Germany')

        expect(response).to be_a(Array)
        expect(response).to match_array(response_venues)
      end
    end
  end

  describe 'when by_name' do
    context 'success' do
      it 'returns venues' do
        response = described_class.by_name(name: 'Millerntor-Stadion')

        expect(response).to be_a(Array)
        expect(response).to match_array(response_venue)
      end
    end
  end

  describe 'when by_id' do
    context 'success' do
      it 'returns venues' do
        response = described_class.by_id(id: 720)

        expect(response).to be_a(Array)
        expect(response).to match_array(response_venue)
      end
    end
  end

  describe 'when search' do
    context 'success' do
      it 'returns venues' do
        response = described_class.search(search: 'Millern')

        expect(response).to be_a(Array)
        expect(response).to match_array(response_venue)
      end
    end
  end
end

def stubs_venues
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/venues?city=Hamburg")
    .to_return(status: 200, body: get_mocked_response('venues.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/venues?country=Germany")
    .to_return(status: 200, body: get_mocked_response('venues.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/venues?name=Millerntor-Stadion")
    .to_return(status: 200, body: get_mocked_response('venue.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/venues?id=720")
    .to_return(status: 200, body: get_mocked_response('venue.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/venues?search=Millern")
    .to_return(status: 200, body: get_mocked_response('venue.json', :api_football))
end

def response_venues
  [
    {
      "id": 720,
      "name": "Volksparkstadion",
      "address": "Sylvester Allee 7",
      "city": "Hamburg",
      "country": "Germany",
      "capacity": 57030,
      "surface": "grass",
      "image": "https://media.api-sports.io/football/venues/720.png"
    }.with_indifferent_access,
    {
      "id": 745,
      "name": "Millerntor-Stadion",
      "address": "Auf dem Heiligengeistfeld",
      "city": "Hamburg",
      "country": "Germany",
      "capacity": 29546,
      "surface": "grass",
      "image": "https://media.api-sports.io/football/venues/745.png"
    }.with_indifferent_access,
    {
      "id": 6445,
      "name": "Adolf-Jäger-Kampfbahn",
      "address": "Griegstraße 62",
      "city": "Hamburg",
      "country": "Germany",
      "capacity": 8000,
      "surface": "grass",
      "image": "https://media.api-sports.io/football/venues/6445.png"
    }.with_indifferent_access
  ]
end

def response_venue
  [
    {
      "id": 745,
      "name": "Millerntor-Stadion",
      "address": "Auf dem Heiligengeistfeld",
      "city": "Hamburg",
      "country": "Germany",
      "capacity": 29546,
      "surface": "grass",
      "image": "https://media.api-sports.io/football/venues/745.png"
    }.with_indifferent_access
  ]
end
