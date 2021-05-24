# Football Butler

![Image of Yaktocat](https://www.football-butler.de/wp-content/uploads/2021/03/cropped-cropped-cropped-logo_football_butler_128px_geen02-1.png)

[![Build Status](https://travis-ci.com/frontimax/football-butler.svg?token=kdzGtbwhXCggiYUeL5pd&branch=main)](https://travis-ci.org/frontimax/football-butler)
[![codecov](https://codecov.io/gh/frontimax/football-butler/branch/main/graph/badge.svg?token=GBV4PK62WC)](https://codecov.io/gh/frontimax/football-butler)  

This gem enables API requests against multiple different football APIs, with direct requests or using normalized endpoint Class methods. Currently supported APis: 

- football-data.org 
- apifootball.com

To use the API you need an API token, get it for free @ http://api.football-data.org/register or https://apifootball.com/register.

Depending on you Payment Plan you can access international Competitions, Teams, Matches, Scores, Players, Odds, and Standings.

Also see the following Links:

[www.football-butler.de (Offical Gem Homepage)](https://www.football-butler.de)  
[www.code-butler.de (More Projects & Solutions with Rails & Flutter)](https://www.code-butler.de)  
[Twitter/code_butler](https://twitter.com/code_butler)

## Tiers

This Gem supports two ways of using the APIs:

- direct calls to the API with path & filters 
- "comfort" functions (one class for each endpoint with semantic methods) 

**Update May 2021 (v2.0.0):** Multiple APIs are now supported and all endpoints for football-data.org are now implemented. See below for more info on usage.

**Update April 10th 2021:** The Tier packages have been adjusted - Standings are now part of TIER_ONE and also of the newest Gem Version 1.1.0


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

<span style="color: blue;">**Note: football-data.org (api_name: :football_data_org) ist set as the default API.**</span>

To use the API you need to configure the API token.  
You can do this "on the fly" or in your application configuration:

#### Initializer

Create your own initializer file config\initializers\football_butler.rb and add:

    Football::Butler::Configuration.configure do |config|
      config.api_token = "<YOUR_API_TOKEN_HERE>"
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

#### Change the target API

See the available api names:

    Football::Butler::Configuration::AVAILABLE_APIS
    [:football_data_org, :apifootball_com]

To set the target API:

    Football::Butler::Configuration.configure do |config|
      config.api_name  = :apifootball_com
      config.api_token = "<YOUR_API_TOKEN_HERE>"
    end

To change the target API:

    Football::Butler.Configure.reconfigure(
      api_name:  :apifootball_com
      api_token: "<YOUR_API_TOKEN_HERE>"
    )

### The advanced way to go (more options)

#### Available Configuration Values

| Name | Default Value | Data Type | Explanation |
| ---------------|----------------|----------------|----------------|
| api_token|nil|String|Your API Token (required to set by you)|
| api_name|:football_data_org|String| must be one of: [:football_data_org, :apifootball_com] |
| api_version|2|Integer|API Version|
| api_endpoint|"https://api.football-data.org/v#{api_version}"|String|API Endpoint|
| <span style="color: blue;">tier_plan</span><br>*ONLY: :football_data_org* |nil|String|TIER_ONE<br>TIER_TWO<br>TIER_THREE<br>TIER_FOUR|
| <span style="color: blue;">wait_on_limit</span><br>*ONLY: :football_data_org* |false|Boolean|Uses 'sleep' to wait if request is limited

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

#### football_data_org

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

#### apifootball_com

Example:

    # Resources
    # https://apifootball.com/documentation
    path = 'action=get_events'

    filters = { league_id: 149, from: '2021-05-16', to: '2021-05-16' }

    response = Football::Butler.get(path: path, filters: filters)

Will call

    https://apiv2.apifootball.com/?action=get_events&from=2021-05-16&to=2021-05-16&league_id=149&APIkey=<YOUR_API_TOKEN>

and return all matches of 2021-05-16 of the english Premiere League for the given time range:

    response.parsed_response
    => [{"match_id"=>"497362", "country_id"=>"41", "country_name"=>"England", "league_id"=>"149", "league_name"=>"Championship", ....]

If you performed a bad request, e.g. invalid api_token configured, you will get an error hash:

    response['message']
    => "No event found (please check your plan)!"

### Comfort Functions (Endpoint Classes)

Instead of using the direct API calls you can use endpoint classes with semantic methods to get results. This list may be expanded in future versions.

I tried to normalize endpoint classes (with aliases) and methods across different target APIs.
If an endpoint class is not available (such as Predictions and Statistics in API :football_data_org) you will get an error message:

    "The Endpoint 'Predictions' is not supported by this API: football_data_org"

If a method is not available for that target API, you will also get an error message:

    "Method 'by_name' is not supported for the endpoint 'Countries' by this API: apifootball_com"

<span style="color: blue;">**NOTE: I did not normalize the returned data-types yet as I wanted to keep straight with the target API. Let me know if you would
like to have a Configuration option to return same data types for all returns and target APIs. Until then: use "result: :default" where available and work with the normalized HTTParty Response Type.**</span>

#### football_data_org

Most methods return the result directly (e.g. :matches), but you can also get the complete HTTParty response (as shown above in the direct API call) by using the "result: :default" option:

Directly returns an Array with all areas:

    Football::Butler::Areas.all
    => [{"id"=>2000, "name"=>"Afghanistan", "countryCode"=>"AFG", "ensignUrl"=>nil, "parentAreaId"=>2014, "parentArea"=>"Asia"}, ... ]

Returns a Hash with full API response:

    response = Football::Butler::Areas.all(result: :default)
    => response.keys
    => ["count", "filters", "areas"]
    => response['areas']
    => [{"id"=>2000, "name"=>"Afghanistan", "countryCode"=>"AFG", "ensignUrl"=>nil, "parentAreaId"=>2014, "parentArea"=>"Asia"}, ... ]

*If you request a single Object (e.g. "by_id") the Object is returned by football-data.org directly as a Hash 
(not in an Array)! Exception: Match.by_id returns Hash with Keys ["head2head", "match"]*

**Note: You can also use "Countries", as this is an alias Class from :apifootball_com.**

#### apifootball_com

Most methods return the result directly (result: :parsed_response), but you can also get the complete HTTParty response (as shown above in the direct API call) by using the "result: :default" option:

Directly returns an Array with all areas:

    Football::Butler::Countries.all
    => [{"country_id"=>"41", "country_name"=>"England", "country_logo"=>"https://apiv2.apifootball.com/badges/logo_country/41_england.png"}, {"country_id"=>"46", "country_name"=>"France", "country_logo"=>"https://apiv2.apifootball.com/badges/logo_country/46_france.png"}]

Returns a full API response:

    response = Football::Butler::Countries.all(result: :default)
    => response.parsed_response
    => [{"country_id"=>"41", "country_name"=>"England", "country_logo"=>"https://apiv2.apifootball.com/badges/logo_country/41_england.png"}, {"country_id"=>"46", "country_name"=>"France", "country_logo"=>"https://apiv2.apifootball.com/badges/logo_country/46_france.png"}]
    => response.code
    => 200

**Note: You can also use "Areas", as this is an alias Class from :football_data_org.**

### Overview of all available Endpoint Classes

| Class | football-data.org | apifootball.com | 
| ---------------|----------------|----------------|
| Areas | <span style="color: green;">YES</span> | <span style="color: blue;">YES</span><br>*alias from Countries* |
| Competitions | <span style="color: green;">YES</span> | <span style="color: green;">YES</span> |
| Countries | <span style="color: blue;">YES</span><br>*alias from Areas* | <span style="color: green;">YES</span> |
| Events | <span style="color: blue;">YES</span><br>*alias from Matches* | <span style="color: green;">YES</span> |
| HeadToHead | <span style="color: green;">YES</span> | <span style="color: green;">YES</span> |
| Lineups | <span style="color: green;">YES</span> | <span style="color: green;">YES</span> |
| Matches | <span style="color: green;">YES</span> | <span style="color: blue;">YES</span><br>*alias from Events* |
| Odds | <span style="color: green;">YES</span> | <span style="color: green;">YES</span> |
| Players | <span style="color: green;">YES</span> | <span style="color: green;">YES</span> |
| Predictions | <span style="color: red;">NO</span> | <span style="color: green;">YES</span> |
| Scorers | <span style="color: green;">YES</span> | <span style="color: blue;">YES</span><br>*alias from TopScorers* |
| Standings | <span style="color: green;">YES</span> | <span style="color: green;">YES</span> |
| Statistics | <span style="color: red;">NO</span> | <span style="color: green;">YES</span> |
| Teams | <span style="color: green;">YES</span> | <span style="color: green;">YES</span> |
| TopScorers | <span style="color: blue;">YES</span><br>*alias from Scorers* | <span style="color: green;">YES</span> |

### Areas

Football::Butler::Areas

*alias (apifootball_com):* Football::Butler::Countries

*Return Values for football-data & apifootball if the result option is not set explicitly!*

| Method | Params required | Params optional | football-data | apifootball |
| ---------------|----------------|----------------|----------------|----------------|
| by_id | id: Integer | - | HTTParty::Response (Hash) | <span style="color: red;">N/A</span> | 
| all | - | result (Symbol) | Array | Array |
| by_name | name: String | - | HTTParty::Response (Hash) | <span style="color: red;">N/A</span> |

Examples:

    Football::Butler::Areas.by_id(id: 2088)
    Football::Butler::Areas.all
    Football::Butler::Areas.by_name(name: 'Germany')

    Football::Butler::Countries.all


### Competitions

Football::Butler::Competitions

*Return Values for football-data & apifootball if the result option is not set explicitly!*

| Method | Params required | Params optional | football-data | apifootball |
| ---------------|----------------|----------------|----------------|----------------|
| by_id | id: Integer | - | HTTParty::Response (Hash) | <span style="color: red;">N/A</span> | 
| by_country | id: Integer | - | <span style="color: red;">N/A</span> | Array | 
| all | - | result (Symbol)<br>filters (Hash) | Array | Array |
| by_plan | plan: String | result (Symbol)<br>filters (Hash) | Array | <span style="color: red;">N/A</span>|
| by_areas | ids: Array | result (Symbol)<br>filters (Hash) | Array | <span style="color: red;">N/A</span>|
| current_match_day | id: Integer | - | Integer | <span style="color: red;">N/A</span>|
| seasons | id: Integer | - | Array | <span style="color: red;">N/A</span>|

Examples:

    Football::Butler::Competitions.by_id(id: 2002)
    Football::Butler::Competitions.all(filters: { plan: 'TIER_ONE' })
    Football::Butler::Competitions.by_plan(plan: 'TIER_ONE')
    Football::Butler::Competitions.by_areas(ids: [2088, 2081])
    Football::Butler::Competitions.current_match_day(id: 2002)
    Football::Butler::Competitions.seasons(id: 2002)

    Football::Butler::Competitions.by_country(id: 44)

### Countries

Football::Butler::Countries

**NOTE: alias of/see Football::Butler::Areas**

### Events

Football::Butler::Events

**NOTE: alias of/see Football::Butler::Matches**

### HeadToHead (added in version 2.0.0)

Football::Butler::HeadToHead

*Return Values for football-data & apifootball if the result option is not set explicitly!*

| Method | Params required | Params optional | football-data | apifootball |
| ---------------|----------------|----------------|----------------|----------------|
| by_match | id: Integer | - | Hash | <span style="color: red;">N/A</span> | 
| by_teams | team_id: Integer<br>second_team_id| result (Symbol)<br>filters (Hash) | <span style="color: red;">N/A</span> | Hash |

Examples:

    Football::Butler::HeadToHead.by_match(id: 2002)

    Football::Butler::HeadToHead.by_teams(team_id: 7275, second_team_id: 151)

### Lineups (added in version 2.0.0)

Football::Butler::Lineups

*Return Values for football-data & apifootball if the result option is not set explicitly!*

| Method | Params required | Params optional | football-data | apifootball |
| ---------------|----------------|----------------|----------------|----------------|
| by_match | id: Integer | - | Hash | Hash |

Examples:

    Football::Butler::Lineups.by_match(id: 2002)

### Matches

Football::Butler::Matches

*alias (apifootball_com):* Football::Butler::Events

*Return Values for football-data & apifootball if the result option is not set explicitly!*

| Method | Params required | Params optional | football-data | apifootball |
| ---------------|----------------|----------------|----------------|----------------|
| by_id | id: Integer | - | HTTParty::Response (Hash) | Array | 
| all | - | result (Symbol)<br>filters (Hash) | Array | Array |
| by_competition_and_year | id: Integer<br>year: String | result (Symbol)<br>filters (Hash) | Array | Array |
| by_competition_and_match_day | id: Integer<br>match_day: Integer | result (Symbol)<br>filters (Hash) | Array | <span style="color: red;">N/A</span> |
| by_team | id: Integer | result (Symbol)<br>filters (Hash) | Array | Array |
| by_team_and_status | id: Integer<br>status: String | result (Symbol)<br>filters (Hash) | | <span style="color: red;">N/A</span> |
| by_team_finished | id: Integer | result (Symbol)<br>filters (Hash) | Array | <span style="color: red;">N/A</span> |
| by_team_scheduled | id: Integer | result (Symbol)<br>filters (Hash) | Array | <span style="color: red;">N/A</span>  |
| by_player | id: Integer | result (Symbol)<br>filters (Hash) | Array | <span style="color: red;">N/A</span> |

Examples:

    Football::Butler::Matches.by_id(id: 297886)
    Football::Butler::Matches.all
    Football::Butler::Matches.by_competition_and_year(id: 2002, year: '2019')
    Football::Butler::Matches.by_competition_and_match_day(id: 297886, match_day: 1)
    Football::Butler::Matches.by_team(id: 18)
    Football::Butler::Matches.by_team_and_status(id: 18, status: 'FINISHED')
    Football::Butler::Matches.by_team_finished(id: 18)
    Football::Butler::Matches.by_team_scheduled(id: 18)
    Football::Butler::Matches.by_player(id: 18)

### Odds (added in version 2.0.0)

Football::Butler::Odds

*Return Values for football-data & apifootball if the result option is not set explicitly!*

| Method | Params required | Params optional | football-data | apifootball |
| ---------------|----------------|----------------|----------------|----------------|
| by_match | id: Integer<br>from: Date as String ('2021-05-17')<br>to: Date as String ('2021-05-17')<br><span style="color: red;">(from and to only used (required) in apifootbal.com)</span> | - | Hash | Hash |

Examples:

    Football::Butler::Odds.by_match(id: 2002)

### Players (added in version 2.0.0)

Football::Butler::Players

*Return Values for football-data & apifootball if the result option is not set explicitly!*

| Method | Params required | Params optional | football-data | apifootball |
| ---------------|----------------|----------------|----------------|----------------|
| by_id | id: Integer | - | Hash | Hash |
| by_name | name: String | result (Symbol) | <span style="color: red;">N/A</span> | Hash |

Examples:

    Football::Butler::Players.by_id(id: 2002)

    Football::Butler::Players.by_name(name: 'Ronaldo')

### Predictions (added in version 2.0.0)

Football::Butler::Predictions

**Note: only apifootball_com**

*Return Values for football-data & apifootball if the result option is not set explicitly!*

| Method | Params required | Params optional | football-data | apifootball |
| ---------------|----------------|----------------|----------------|----------------|
| by_match | id: Integer | result (Symbol)<br>filters (Hash) | <span style="color: red;">N/A</span> | Hash |

Examples:

    Football::Butler::Predictions.by_match(id: 2002)


### Scorers (added in version 2.0.0)

Football::Butler::Scorers

*alias (apifootball_com):* Football::Butler::TopScorers

*Return Values for football-data & apifootball if the result option is not set explicitly!*

| Method | Params required | Params optional | football-data | apifootball |
| ---------------|----------------|----------------|----------------|----------------|
| by_competition | id: Integer | result (Symbol)<br>filters (Hash) | Array | Hash |

Examples:

    Football::Butler::Scorers.by_competition(id: 2002)

### Standings (added in version 1.1.0)

Football::Butler::Standings

*Return Values for football-data & apifootball if the result option is not set explicitly!*

| Method | Params required | Params optional | football-data | apifootball |
| ---------------|----------------|----------------|----------------|----------------|
| by_competition | id: Integer | result (Symbol)<br>filters (Hash) | Array | Array |
| home_by_competition | id: Integer | result (Symbol)<br>filters (Hash) | Array | <span style="color: red;">N/A</span> |
| away_by_competition | id: Integer | result (Symbol)<br>filters (Hash) | Array | <span style="color: red;">N/A</span> |
| by_competition_and_year | id: Integer<br>year: String | result (Symbol)<br>filters (Hash) | Array | <span style="color: red;">N/A</span> |

    Football::Butler::Standings.by_competition(id: 2002)
    Football::Butler::Standings.home_by_competition(id: 2002)
    Football::Butler::Standings.away_by_competition(id: 2002)
    Football::Butler::Standings.by_competition_and_year(id: 2002, year: '2020')

### Statistics (added in version 2.0.0)

Football::Butler::Statistics

**Note: only apifootball_com**

*Return Values for football-data & apifootball if the result option is not set explicitly!*

| Method | Params required | Params optional | football-data | apifootball |
| ---------------|----------------|----------------|----------------|----------------|
| by_match | id: Integer | result (Symbol) | <span style="color: red;">N/A</span> | Hash |

Examples:

    Football::Butler::Statistics.by_match(id: 2002)

### Teams

Football::Butler::Teams

*Return Values for football-data & apifootball if the result option is not set explicitly!*

| Method | Params required | Params optional | football-data | apifootball |
| ---------------|----------------|----------------|----------------|----------------|
| by_id | id: Integer | - | HTTParty::Response (Hash) | Array | 
| by_competition | id: Integer | result (Symbol)<br>filters (Hash) | Array | Array |
| by_competition_and_year | id: Integer<br>year: String | result (Symbol)<br>filters (Hash) | Array | <span style="color: red;">N/A</span> |

Examples:

    Football::Butler::Teams.by_id(id: 2002)
    Football::Butler::Teams.by_competition(id: 2002)
    Football::Butler::Teams.by_competition_and_year(id: 2002, year: '2019')

### TopScorers

Football::Butler::TopScorers

**NOTE: alias of/see Football::Butler::Scorers**


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/frontimax/football-butler. 
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere 
to the [code of conduct](https://github.com/frontimax/football-butler/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Football Butler project's codebases, issue trackers, 
chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/football-butler/blob/master/CODE_OF_CONDUCT.md).

