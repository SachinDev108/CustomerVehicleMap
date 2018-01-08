# README

CustomerVehicleMap is developed to simply create a Google Map. 


## Development

### Setup

```
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```


### Javascript Dependencies:

<script src="http://maps.googleapis.com/maps/api/js?key=[your API key]libraries=places"></script>