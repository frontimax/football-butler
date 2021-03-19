# Football Butler

![Image of Yaktocat](https://www.football-butler.de/wp-content/uploads/2021/03/cropped-cropped-cropped-logo_football_butler_128px_geen02-1.png)

[![Build Status](https://travis-ci.com/frontimax/football-butler.svg?token=kdzGtbwhXCggiYUeL5pd&branch=main)](https://travis-ci.org/frontimax/football-butler)
[![codecov](https://codecov.io/gh/frontimax/football-butler/branch/main/graph/badge.svg?token=GBV4PK62WC)](https://codecov.io/gh/frontimax/football-butler)  *

This gem enables API requests against the dev-friendly football API: football-data.org.
To use the API you need an API token, get it for free @ http://api.football-data.org/register

Depending on you Payment Plan you can access international Competitions, Teams, Matches, Scores, Players, Odds, and Standings.

See a list of available competitons [here](https://www.football-data.org/coverage).

Also see the following Links:

[www.football-butler.de (Offical Gem Homepage)](https://www.football-butler.de)  
[www.code-butler.de (More Projects & Solutions with Rails & Flutter)](https://www.code-butler.de)  
[Twitter/code_butler](https://twitter.com/code_butler)

## Tiers

This Gem supports direct calls to the API with path & filters so you can use all Tiers (Payment Plans) with the direct API calls.

The "comfort" functions (one class for each endpoint with semantic methods) of this Gem only covers API calls for the Free Tier (TIER_ONE) yet, the next version will add 
also the features included in TIER_TWO and up (Standings, Players, and Odds).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'football-butler'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install football-butler

## Configuration

### The quickest way to start

To use the API you need to configure the API token.  
You can do this "on the fly" or in your application configuration:

#### Initializer

Create your own initializer file config\initializers\football_butler.rb and add:

    Football::Butler::Configuration.configure do |config|
      config.api_token  = "<YOUR_API_TOKEN_HERE>"
    end

#### On the Fly

As a function (use this line first in the rails console if you dont use the above initilaizer!)

    Football::Butler.Configure.reconfigure(
      api_token: "<YOUR_API_TOKEN_HERE>"
    )

#### Get you first data from the rails console
Get all matches of current Bundesliga season:

    rails c
    Football::Butler::Matches.by_competition(id: 2002)


### The advanced way to go (more options)

#### Available Configuration Values

| Name | Default Value | Data Type | Explanation |
| ---------------|----------------|----------------|----------------|
| api_token|nil|String|Your API Token (required to set by you)|
| api_version|2|Integer|API Version|
| api_endpoint|"https://api.football-data.org/v#{api_version}"|String|API Endpoint|
| tier_plan|nil|String|TIER_ONE<br>TIER_TWO<br>TIER_THREE<br>TIER_FOUR|
| wait_on_limit|false|Boolean|Uses 'sleep' to wait if request is limited

The tier_plan is only used in Football::Butler::Competitions.all as a default filter.
You can use "plan" filter manually on Competition calls.

### Example

    Football::Butler::Configuration.configure do |config|
      config.api_token  = "<YOUR_API_TOKEN_HERE>"
      config.api_version = 2
      config.api_endpoint = "https://api.football-data.org/v2"
      config.tier_plan = 'TIER_TWO'
      config.wait_on_limit = true
    end

or

    Football::Butler.Configure.reconfigure(
      api_token: "<YOUR_API_TOKEN_HERE>",
      api_version = 2,
      api_endpoint = "https://api.football-data.org/v2",
      tier_plan = 'TIER_TWO',
      wait_on_limit = true
    )

## Usage

### Direct API Calls with path and filters

Example:

    # Resources
    # https://www.football-data.org/documentation/quickstart#available-resources
    path = 'competitions/BL1/matches' # (or path = 'competitions/2002/matches')

    # Filtering
    # https://www.football-data.org/documentation/quickstart#filtering
    filters = { matchday: 1 }

    response = Football::Butler.get(path: path, filters: filters)

Will call

    http://api.football-data.org/v2/competitions/BL1/matches?matchday=1

and return all matches of match day 1 of the german Bundesliga, current season:

    response['count'] 
    => 9

    response['filters']
    => {"matchday"=>"1"}

    response['competition']
    => {"id"=>2002, "area"=>{"id"=>2088, "name"=>"Germany"}, "name"=>"Bundesliga", ... }

    response['matches']
    => [{"id"=>303007, "season"=>{"id"=>599, "startDate"=>"2020-09-18", "endDate"=>"2021-05-15", "currentMatchday"=>27}, "utcDate"=>"2020-09-18T18:30:00Z", "status"=>"FINISHED", ...}]

If you performed a bad request, e.g. invalid api_token configured, you will get an error hash:

    response['message']
    => "Your API token is invalid."

    response['errorCode']
    => 400

### Comfort Functions (Endpoint Classes)

Instead of using the direct API calls you can use endpoint classes with semantic methods to get results. This list may be expanded in future versions.

The methods return the result directly, but you can also get the complete response (as shown above in the direct API call) by using the :result option:

Directly returns an Array with all areas:

    Football::Butler::Areas.all
    => [{"id"=>2000, "name"=>"Afghanistan", "countryCode"=>"AFG", "ensignUrl"=>nil, "parentAreaId"=>2014, "parentArea"=>"Asia"}, ... ]

Returns a Hash with full API response:

    response = Football::Butler::Areas.all(result: :default)
    => response.keys
    => ["count", "filters", "areas"]
    => response['areas']
    => [{"id"=>2000, "name"=>"Afghanistan", "countryCode"=>"AFG", "ensignUrl"=>nil, "parentAreaId"=>2014, "parentArea"=>"Asia"}, ... ]

*If you request a single Object (e.g. "by_id") the Object is returned by football-data.org directly as a Hash (not in an Array)!*

#### Areas

Football::Butler::Areas


| Method | Params required | Params optional |
| ---------------|----------------|----------------|
| by_id | id: Integer | - |
| all | - | result (Symbol) |
| by_name | name: String | - |

Examples:

    Football::Butler::Areas.by_id(id: 2088)
    Football::Butler::Areas.all
    Football::Butler::Areas.by_name(name: 'Germany')

#### Competitions

Football::Butler::Competitions

| Method | Params required | Params optional |
| ---------------|----------------|----------------|
| by_id | id: Integer | - |
| all | - | result (Symbol)<br>filters (Hash) |
| by_plan | plan: String | result (Symbol)<br>filters (Hash) |
| by_areas | ids: Array | result (Symbol)<br>filters (Hash) |
| current_match_day | id: Integer | - |
| seasons | id: Integer | - |

Examples:

    Football::Butler::Competitions.by_id(id: 2002)
    Football::Butler::Competitions.all(filters: { plan: 'TIER_ONE' })
    Football::Butler::Competitions.by_plan(plan: 'TIER_ONE')
    Football::Butler::Competitions.by_areas(ids: [2088, 2081])
    Football::Butler::Competitions.current_match_day(id: 2002)
    Football::Butler::Competitions.seasons(id: 2002)

#### Teams

Football::Butler::Teams

| Method | Params required | Params optional |
| ---------------|----------------|----------------|
| by_id | id: Integer | - | 
| by_competition | id: Integer | result (Symbol)<br>filters (Hash) | 
| by_competition_and_year | id: Integer<br>year: String | result (Symbol)<br>filters (Hash) | 

Examples:

    Football::Butler::Teams.by_id(id: 2002)
    Football::Butler::Teams.by_competition(id: 2002)
    Football::Butler::Teams.by_competition_and_year(id: 2002, year: '2019')

#### Matches

Football::Butler::Matches

| Method | Params required | Params optional |
| ---------------|----------------|----------------|
| by_id | id: Integer | - |
| all | - | result (Symbol)<br>filters (Hash) |
| by_competition_and_year | id: Integer<br>year: String | result (Symbol)<br>filters (Hash) |
| by_competition_and_match_day | id: Integer<br>match_day: Integer | result (Symbol)<br>filters (Hash) |
| by_team | id: Integer | result (Symbol)<br>filters (Hash) |
| by_team_and_status | id: Integer<br>status: String | result (Symbol)<br>filters (Hash) |
| by_team_finished | id: Integer | result (Symbol)<br>filters (Hash) |
| by_team_scheduled | id: Integer | result (Symbol)<br>filters (Hash) |

Examples:
    
    Football::Butler::Matches.by_id(id: 297886)
    Football::Butler::Matches.all
    Football::Butler::Matches.by_competition_and_year(id: 2002, year: '2019')
    Football::Butler::Matches.by_competition_and_match_day(id: 297886, match_day: 1)
    Football::Butler::Matches.by_team(id: 18)
    Football::Butler::Matches.by_team_and_status(id: 18, status: 'FINISHED')
    Football::Butler::Matches.by_team_finished(id: 18)
    Football::Butler::Matches.by_team_scheduled(id: 18)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/frontimax/football-butler. 
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere 
to the [code of conduct](https://github.com/frontimax/football-butler/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Football Butler project's codebases, issue trackers, 
chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/football-butler/blob/master/CODE_OF_CONDUCT.md).

<br/><br/>

**Code Coverage is 100% actually :-) ... the codecov gem seems to be buggy :-(*