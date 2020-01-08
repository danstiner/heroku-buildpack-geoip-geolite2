# Heroku Buildpack: GeoLite2 GeoIP data

[![Build Status](https://travis-ci.org/danstiner/heroku-buildpack-geoip-geolite2.svg?branch=master)](https://travis-ci.org/danstiner/heroku-buildpack-geoip-geolite2)

This is an unofficial [Heroku buildpack](https://devcenter.heroku.com/articles/buildpacks)
that installs the latest GeoLite2 City and Country free IP geolocation databases from
<a href="http://www.maxmind.com">MaxMind</a> along with the [libmaxminddb](https://github.com/maxmind/libmaxminddb)
C library for fast lookups in the databases.

Note an older version of the Country database is available in any Heroku deploy via the packages `geoip-bin`, `geoip-database`, and `libgeoip1` listed on https://devcenter.heroku.com/articles/stack-packages

## Usage

The GeoLite2 databases are distributed under the Creative Commons Attribution-ShareAlike 4.0 International License. The [official download page](https://dev.maxmind.com/geoip/geoip2/geolite2/) suggests the attribution requirement may be met by including the following in all advertising and documentation mentioning features of or use of the databases:

    This product includes GeoLite2 data created by MaxMind, available from
    <a href="http://www.maxmind.com">http://www.maxmind.com</a>.

As of 30-Dev-2019, Maxmind has withdrawn unauthenticated downloads of their free GeoLite2 databases. Read more [here](https://blog.maxmind.com/2019/12/18/significant-changes-to-accessing-and-using-geolite2-databases/).

From Jan-2020 users need a Maxmind account, and a valid license key. This buildpack uses the "direct download" method described in the Maxmind developer documentation (https://dev.maxmind.com/geoip/geoipupdate/#Direct_Downloads).

### Heroku

```sh
$ heroku buildpacks:add https://github.com/danstiner/heroku-buildpack-geoip-geolite2.git
```

In order to download the Maxmind databases, you will need a valid Maxmind license (register with Maxmind and click on "My License Key" in the left-hand menu). You must add this key as an environment variable (setting) called `MAXMIND_LICENSE_KEY`.

### Django GeoIP2

Add to your `settings.py` file:

```python
GEOIP_PATH=os.environ['GEOIP_GEOLITE2_PATH']
GEOIP_CITY=os.environ['GEOIP_GEOLITE2_CITY_FILENAME']
GEOIP_COUNTRY=os.environ['GEOIP_GEOLITE2_COUNTRY_FILENAME']
```

See https://docs.djangoproject.com/en/1.11/ref/contrib/gis/geoip2/ for installing the `geoip2` Python library and usage examples.
