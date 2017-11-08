HAPROXY_CONF  = node[:haproxy][:haproxy_conf]
TCP_FRONTEND  = HAPROXY_CONF[:tcp][:frontend]
TCP_BACKEND   = HAPROXY_CONF[:tcp][:backend]
HTTP_FRONTEND = HAPROXY_CONF[:http][:frontend]
HTTP_BACKEND  = HAPROXY_CONF[:http][:backend]
STATS         = HAPROXY_CONF[:stats]

template "/etc/haproxy/haproxy.cfg" do
  variables tcp_frontend:  TCP_FRONTEND,
            tcp_backend:   TCP_BACKEND,
            http_frontend: HTTP_FRONTEND,
            http_backend:  HTTP_BACKEND,
            stats:         STATS
  only_if "test -d /etc/haproxy"
end
