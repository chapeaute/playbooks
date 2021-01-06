Security Apache
=========

This role secure an Apache server

Requirements
------------

You must have a Apache server already installed

Role Variables
--------------

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `security_apache_module` | true | Disable some modules for security |
| `security_apache_ssl` | true |  Secure ssl configs |
| `security_apache_ssl_protocol` | TLSV1.2 | Use this protocol as default |
| security_apache_cookie_http_only | true | Add flag HttpOnly to cookie |
| `security_apache_cookie_secure` | false | Add flag secure for HTTPS to cookie |
| `security_apache_disable_options_method` | true | Disable options method |
| `security_apache_disable_trace_method` | true | Disable trace method |
| `security_apache_disable_x_powered_by` | true | Disable xpowered by header |
| `security_apache_xss_protection` | true | Add header for xss protection |
| `security_apache_strict_transport_security` | false | Add HSTS strict transport for security, enable if you want your web app to be accessible only in HTTPS  |
| `security_apache_content_security_policy` | true | Add Content Security policy (csp) Header |
| `security_apache_x_frame_same_origin` | true | Allow Iframe only from same origin |
| `security_apache_allow_methods` | "GET, POST, DELETE, PUT" | Add Header "Access-Control-Allow-Methods"
| `security_apache_strict_disable_headers` | ['X-Powered-By', 'X-Generator'] | Disable server side headers
| `security_apache_custom_enforcement` | [] | Custom security rules |

Dependencies
------------

* **None**

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yml
    - hosts: apache
      roles:
         - role: apache
         - role: security-apache
```

License
-------

BSD

Author Information
------------------

* Sebastien GIRAUD <sebastien.giraud@smile.ci>
* Jean-Vincent KASSI <jekas@smile.ci>
