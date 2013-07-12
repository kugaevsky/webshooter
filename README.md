# WebShooter

Simple HTTP API to capture webshots.

**Proof of concept only! Not for production usage.**

## Usage

1. Just start puma server (or any other rack based server)
2. Send API request

    GET /webshot/google.com.png/800/600

Response will contain image of `http://google.com` rendered by `webkit` with `800x600` viewport size and saved in `png` format.

### Options

* **format** – [png|jpg|json]
    * **png**   – for good quality
    * **jpg**   – for slow bandwith
    * **json**  – response contains base64 encoded image `{"image":"/9j/4AAQSkZJRgABAQEASABIAAD/..."`


## Demo

[Take a look](http://webshooter.kugaevsky.ru)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
