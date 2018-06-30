# Services
AIDR requires following services for proper deployment:
1. MySQL Server (v5.5)
  * Hostname for the server is mysql
  * Server port is 3306
  * Data is persisted by docker volume
  * Default root password is set to mysql
  * Default schema aidr\_predict is created with full access to username aidr\_admin is created with password aidr\_admin
  * Recommended configurations are applied
  * Tables are created
  * Seed data is inserted into schema
2. Postgres Server (v9.4)
  * Hostname for the server is postgres
  * Server port is 5432
  * Data is persisted by docker volume
  * Recommended configurations are applied
  * Default schema aidr is created with full access to username aidr\_admin is created with password aidr\_admin
3. Redis Server
  * Hostname for the server is redis
  * Server port is 6379
  * Recommended configurations are applied
4. Glassfish Server (v4.1.2)
  * Hostname for the server is glassfish
  * Data is persisted by docker volume
  * Server ports are 4848 (admin console), 8080 (http), 8181 (https)
  * Default admin password is set to adminadmin
  * Recommended configurations are applied

