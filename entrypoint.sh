#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /rails/tmp/pids/server.pid

# setting up database
bin/rails db:migrate
bin/rails db:seed

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"