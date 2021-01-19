# SERVICE microservice

This is an implementation of a code challenge.

### Setup:

- Modify `service/config/database.yml` to connect it to your local postgresql instance if needed
- Bundle the dependencies by running `bundle install`
- Upload postgresql dump into your database `rails db < db/data/properties.sql`

### Usage

The Service has `api/properties` endpoint which is accepting 4 types of attributes such as: `lat`, `lng`, `property_type`, `offer_type`. The endpoint will return `properties` found in 5 km radius matching `property_type` and `offer_type` parameters if they are present.

- Run the server locally with `rails s` command
- You will use curl to work with the Service

Here are just some examples:

```
<!-- Will return 1013 found properties in this area -->
curl -XGET 'http://127.0.0.1:3000/api/properties?lat=52.5166023&lng=13.3041054'
```

```
<!-- Will return 18 found properties in this area -->
curl -XGET 'http://127.0.0.1:3000/api/properties?lat=52.5166023&lng=13.3041054&property_type=apartment_roof_storey'
```

```
<!-- Will return 13 found properties in this area -->
curl -XGET 'http://127.0.0.1:3000/api/properties?lat=52.40631820&lng=13.54563200&offer_type=rent'
```

```
<!-- Will return the error message that Lng is required -->
curl -XGET 'http://127.0.0.1:3000/api/properties?lat=52.40631820'
```

### Errors

System also includes such error messages, response will have 422 status:
- `XXX is required` - missing parameter XXX
- `XXX is invalid` - invalid XXX parameter
- `XXX is too big/small` - parameter XXX is outside of expected range
- `XXX isn't an option` - parameter XXX has unexpected value

### Testing

This project includes rspec. To run tests simply run `rspec` in your console
