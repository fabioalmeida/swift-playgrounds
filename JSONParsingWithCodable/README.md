# JSONParsingWithCodable

## What

This playground shows some examples of parsing JSON files to your own models.

Here you can find some of the most common cases when dealing with JSON responses from services.


## Why

With Swift 4 release the iOS developers life improved when it comes to parsing JSON files thanks to the `Codable` protocol.

On the other hand, when you first get your hands on it, you can see that if you don't have a model that corresponds exactly to your service response, things can become difficult quite fast.

With this playground I try to cover some of the most common cases like:
* Simple JSON that corresponds exactly to the model;
* Models with properties with different names from what comes from the service;
* Model with other nested models;
* JSON Arrays;
* Models that come inside more complex JSON objects, not directly in the root.


## Misc

For reference, this playground was created using `Xcode 9.0.1`.
