# Add main domain to cookies

This apache2 module adds the main domain to each cookie set by the webserver or
proxied HTTP response. Without the module, it is not possible to set the domain
name for a cookie from a virtual host. You can set the domain name of a cookie
to a single domain, but when there are multiple domains behind a single apache
server, apache cannot set the domain name of the cookie to the hostname of the
request.

## Usage

For compilation and installation of the apache2 modules, use:

~~~
make install
~~~

The compiled module will be copied to `/usr/lib64/apache2/modules` (Gentoo), or
`/usr/share/apache2/modules` (Ubuntu).

You'll probable need root access to install the module there. Therefore,
performing `make` followed by `sudo make install` is advised. The apache2
server has to be restarted in order to use the module.

## Testing

For compilation, installation and testing the module, use:

~~~
TEST_URL="http://es.test.mimessenger.com/app/web/sb" make test
~~~

Make sure to that `mod_cookie_domain` is loaded, and set as an output filter in
one or more apache2 sites. The module can be loaded using:

~~~
LoadModule cookie_domain_module /usr/lib/apache2/modules/mod_cookie_domain.so
~~~

and, inside a `<VirtualHost>` section, set as output filter using:

~~~
SetOutputFilter cookie_domain
~~~

Note: This requires that the apache2 module directory is writable for the user
performing `make test`. This will also restart apache2 to reload the installed
module.
