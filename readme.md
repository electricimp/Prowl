#Prowl
The Prowl library wraps [Prowl's API](http://www.prowlapp.com/) for sending push notifications for any other device running Prowl.

**To add this library to your project, add `#require "Prowl.class.nut:1.0.0"` to the top of your device code.**

You can view the library’s source code on [GitHub](https://github.com/electricimp/prowl/tree/v1.0.0).

##Class Usage

The class’ constructor takes two required parameters (your Prowl API Key and the name of your Prowl application):


| Parameter     | Type         | Default | Description |
| ------------- | ------------ | ------- | ----------- |
| apiKey        | string       | N/A     | A Prowl API Key |
| appName       | string       | N/A     | The name of your Prowl Application |


```squirrel
#require "Prowl.class.nut:1.0.0"

// Prowl Constants
const API_KEY = "YOUR-API-KEY";
const PROWL_APP = "Application title";

prowl <- Prowl(API_KEY, PROWL_APP);
```

## Class Methods

### push(*event, description, cb*)

The *push* method sends a push notification to any other device running Prowl. It takes three required parameters( an event, a description, and a callback).  The callback has three parameters (error, response, and data).


| Parameter   | Type      | Default | Description  |
| ----------- | --------- | ------- | ----------- |
| event       | string    | N/A     | Subject for push message |
| description | string    | N/A     | The push message |
| cb          | function  | N/A     | A callback function |


```squirrel
prowl.push("Oh Snaps!", "This is a message from your Electric Imp", function(err, resp, data) {
    if(err) {
        server.log(err);
    } else {
        server.log(format("%i - %s", resp.statuscode, data));
    }
});
```


## License

Rocky is licensed under [MIT License](./LICENSE).