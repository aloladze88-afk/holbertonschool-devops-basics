# Load Balancing & Resilience Lab starter

This directory contains the local application used in the load-balancing lab.
The application is intentionally small so you can focus on traffic distribution,
failure detection, and recovery rather than application development.

## Included assets

- `src/`: Express application and unit/integration tests
- `db/`: PostgreSQL schema and deterministic seed scripts
- `docker-compose.yml`: working baseline with one API instance and PostgreSQL
- `nginx/nginx.conf`: Nginx skeleton to complete when you add the load balancer
- `Dockerfile`: tested application image build
- `package.json` and `package-lock.json`: locked Node.js dependencies

The baseline Compose file is ready to run. During the project, you will replace
the single `app` service with three named instances and add Nginx as the only
host-facing entry point.

## Working rules

- Perform every project task from this directory.
- Do not modify the supplied application, SQL scripts, or Dockerfile.
- Modify only `docker-compose.yml` and `nginx/nginx.conf` as instructed.
- Use only fictitious local-development credentials.
- Keep `.env` local. `.gitignore` already excludes it while allowing a safe
  `.env.example`.

The project statement provides the required behavior and the self-validation
sequence.

## Lab Conclusion

This lab demonstrated how load balancing improves the availability and resilience of an application.

Three identical application instances were placed behind an Nginx load balancer. Round-robin testing with 30 requests showed an even 10/10/10 distribution across the three instances.

Failover was then tested by stopping one application instance. Nginx detected the failed upstream through real traffic and continued serving requests using the two remaining healthy instances. A follow-up test showed a 10/10 distribution across those two instances.

After the stopped instance was restarted and became healthy, it automatically rejoined the load-balancing pool without restarting Nginx. A new 30-request test again produced a 10/10/10 distribution.

During the final availability test, all 50 requests returned HTTP 200. The HTTP error rate was 0.00%, and no requests exceeded the chosen 1-second availability threshold. The slowest observed response was approximately 6.96 ms.

The lab shows that multiple application instances can prevent a single application failure from making the service unavailable. However, the architecture still contains single points of failure, particularly the single Nginx load balancer and the single PostgreSQL database. A production system could improve resilience further by adding redundant load balancers, database replication/failover, suitable capacity headroom, and stronger health and readiness monitoring.

The short local test demonstrates successful load balancing, failover and recovery, but it is not sufficient evidence to claim a long-term availability target such as 99.9%.
