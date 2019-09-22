# Supported tags and respective `Dockerfile` links

* [`6.3.0`, `6.3`, `6`, `latest`](https://github.com/ernestojpg/varnish-docker/blob/master/varnish62-63/Dockerfile)
* [`6.2.1`, `6.2`](https://github.com/ernestojpg/varnish-docker/blob/master/varnish62-63/Dockerfile)
* [`6.1.1`, `6.1`](https://github.com/ernestojpg/varnish-docker/blob/master/varnish50-61/Dockerfile)
* [`6.0.4`, `6.0`](https://github.com/ernestojpg/varnish-docker/blob/master/varnish50-61/Dockerfile)
* [`5.2.1`, `5.2`, `5`](https://github.com/ernestojpg/varnish-docker/blob/master/varnish50-61/Dockerfile)
* [`5.1.3`, `5.1`](https://github.com/ernestojpg/varnish-docker/blob/master/varnish50-61/Dockerfile)
* [`5.0.0`, `5.0`](https://github.com/ernestojpg/varnish-docker/blob/master/varnish50-61/Dockerfile)

# What is Varnish?

<table>
    <tr>
    <td width="130">
        <a href="#"><img src="https://raw.githubusercontent.com/ernestojpg/varnish-docker/master/logo.png" width="100%"></a>
    </td>
    <td valign="top">
        <p><a href="https://varnish-cache.org/">Varnish Cache</a> is a web application accelerator also known as a caching HTTP reverse proxy.
        You install it in front of any HTTP server and configure it to cache the contents.
        Varnish Cache is really, really fast. It typically speeds up delivery with a factor of 300 - 1000x,
        depending on your architecture.</p>
        <p>You can read a general overview of <a href="https://varnish-cache.org/docs/trunk/users-guide/intro.html">The Big Varnish Picture</a>
        in the official Varnish documentation.</p>
    </td> 
    </tr>
</table>

# About this image

This is just a lightweight and easy to use Varnish image for Docker. It is based on Debian Stretch Slim and its size on disk is around 162MB.

# How to use this image

## Quick start

To test our image quickly we could just run a simple container like this:
```
$ docker run -p 8080:8080 ernestojpg/varnish
```
This will start a very simple Varnish container listening on port `8080` and returning a static message. So now, if we open the
URL `http://localhost:8080` in our browser we should see something like this:
```
Hello from Varnish!
```

## Custom configuration

For real-life applications we will need to use our own [VCL file](https://varnish-cache.org/docs/trunk/users-guide/vcl.html).
The simplest way of doing that is to mount our VCL file in the default path `/etc/varnish/default.vcl` inside the container
when we run it. For example:
```
$ docker run -v my_custom_config.vcl:/etc/varnish/default.vcl -p 8080:8080 ernestojpg/varnish
```

Note that we can mount multiple VCL files or even a complete folder if needed.

## Environment variables

We can also pass some environment variables when running a new container for configuring some parameters:

* `VARNISH_LISTEN_ADDRESS`: The address where Varnish will listen to. The address can be a host name ("localhost"), an IPv4 dotted-quad
  ("127.0.0.1"), or an IPv6 address enclosed in square brackets ("[::1]").  
  **Default:** Empty. Varnish will listen on all available IPv4 and IPv6 interfaces. 
* `VARNISH_LISTEN_PORT`: The port where Varnish will listen to.  
  **Default:** `8080`
* `VARNISH_VCL_CONF`: Path to the default VCL file.  
  **Default:** `/etc/varnish/default.vcl`
* `VARNISH_PID_FILE`: Path to the varnishd process PID file.  
  **Default:** `/var/run/varnish.pid`
* `DAEMON_OPTS`: Any extra option we want to pass when starting the varnishd process. More information in the
  [varnishd official documentation](https://varnish-cache.org/docs/trunk/reference/varnishd.html).  
  **Default:** Empty. No extra parameters are passed.
