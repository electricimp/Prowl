#Prowl
The Prowl library wraps [Prowl's API](http://www.prowlapp.com/) for sending push notifications for any other device running Prowl.

**To add this library to your project, add `#require "Prowl.class.nut:1.0.0"` to the top of your device code.**

You can view the library’s source code on [GitHub](https://github.com/electricimp/prowl/tree/v1.0.0).

##Class Usage

| Parameter     | Type         | Default | Description |
| ------------- | ------------ | ------- | ----------- |
| apiKey        | string       | N/A     | A Prowl API Key |
| appName       | string       | N/A     | The name of your Prowl Application |

The class’ constructor takes two required parameters (your Prowl API Key and the name of your Prowl application):

```squirrel
#require "Prowl.class.nut:1.0.0"

prowl <- Prowl("<-- API_KEY -->", "<-- APPLICATION_NAME -->");
```

## Class Methods

### push(*event, description, [cb]*)

| Parameter   | Type      | Default | Description  |
| ----------- | --------- | ------- | ----------- |
| event       | string    | N/A     | Subject for push message |
| description | string    | N/A     | The push message |
| cb          | function  | N/A     | An optional callback function |

The *push* method sends a push notification to any other device running Prowl.

An optinoal callback can be included that will be invoked upon completion of the request. The callback requires three parameters: *error*, *response*, *data*:

- *error* is a string describing the error (or null if no error occured).
- *response* is the [HTTP response table] from the request.
- *data* is the body of the response.

```squirrel
prowl.push("Alert!", "Temperature out of range (" + temp + "C), function(error, resp, data) {
    // If an error occured, handle it
    if(error) {
        server.error(error);
        return;
    }
    // Otherwise, log success
    server.log("Sent Prowl push notification!");
});
```


## License

The Prowl library is licensed under the [MIT License](https://github.com/electricimp/Prowl/blob/master/LICENSE).
