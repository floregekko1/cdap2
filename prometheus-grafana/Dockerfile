FROM prom/prometheus
CMD docker run -d -p 9090:9090 --name prometheuscontainer prom/prometheus
CMD docker cp ./prometheus.yml prometheuscontainer:/etc/prometheus
CMD docker commit prometheuscontainer cust3/prometheus

FROM prom/node-exporter
CMD docker -d -p 9100:9100 prom/node-exporter

FROM grafana/grafana
CMD docker run -d -p 3000:3000 grafana/grafana