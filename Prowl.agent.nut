// Copyright (c) 2013 Electric Imp
// This file is licensed under the MIT License
// http://opensource.org/licenses/MIT

class Prowl {

    static version = [1,0,0];

    _apiKey = null;
    _appName = null;
    _baseUrl = "https://api.prowlapp.com/publicapi";

    constructor(apiKey, appName) {
        this._apiKey = apiKey;
        this._appName = appName;
    }

    function push(event, description, cb) {
        local data = {
            "apikey" : _apiKey,
            "url" : http.agenturl(),
            "application" : _appName,
            "event" : event,
            "description": description
        };

        local request = http.post(_baseUrl + "/add?" + http.urlencode(data), {}, "");
        local resp = request.sendsync();

        if (resp.statuscode != 200) {
            cb("Prowl failed: " + resp.statuscode, resp, resp.body);
        } else {
            cb(null, resp, resp.body);
        }
    }
}

// Prowl Constants
const API_KEY = "39cb270dc01bc0ad4f7f5a90e581c73faa991abe";
const PROWL_APP = "Prowl Library Test";

prowl <- Prowl(API_KEY, PROWL_APP)

// Example
prowl.push("Oh Snaps!", "This is a message from your Electric Imp", function(err, resp, data) {
    if(err) {
        server.log(err);
    } else {
        server.log(format("%i - %s", resp.statuscode, data));
    }
});