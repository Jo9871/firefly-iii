version: "3.3"

#
# The Firefly III Data Importer will ask you for the Firefly III URL and a "Client ID".
# You can generate the Client ID at http://localhost/profile (after registering)
# The Firefly III URL is: http://app:8080
#
# Other URL's will give 500 | Server Error
#

services:
  app:
    image: fireflyiii/core:latest
    hostname: app
    container_name: firefly_iii_core
    networks:
      - firefly_iii
    restart: always
    env_file: .env
    ports:
      - "80:8080"

  # db:
  #   image: mariadb
  #   hostname: db
  #   container_name: firefly_iii_db
  #   networks:
  #     - firefly_iii
  #   restart: always
  #   env_file: .db.env
  #   volumes:
  #     - firefly_iii_db:/var/lib/mysql

  # importer:
  #   image: fireflyiii/data-importer:latest
  #   hostname: importer
  #   restart: always
  #   container_name: firefly_iii_importer
  #   networks:
  #     - firefly_iii
  #   ports:
  #     - "81:8080"
  #   depends_on:
  #     - app
  #   env_file: .importer.env

#   cron:
#     #
#     # To make this work, set STATIC_CRON_TOKEN in your .env file or as an environment variable and replace REPLACEME below
#     # The STATIC_CRON_TOKEN must be *exactly* 32 characters long
#     #
#     image: alpine
#     container_name: firefly_iii_cron
#     restart: always
#     command: sh -c "echo \"0 3 * * * wget -qO- http://app:8080/api/v1/cron/REPLACEME\" | crontab - && crond -f -L /dev/stdout"
#     networks:
#       - firefly_iii
# volumes:
#   firefly_iii_upload:
#   firefly_iii_db:

networks:
  firefly_iii:
    driver: bridge
