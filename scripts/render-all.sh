#!/usr/bin/env bash
set -euo pipefail

echo "$(pwd)"

repo_count=$(yq -r '.repos | length' manifest.yaml)

for ((i=0; i<repo_count; i++)); do
  repo=$(yq -r ".repos[$i].name" manifest.yaml)
  team=$(yq -r ".repos[$i].team" manifest.yaml)
  service=$(yq -r ".repos[$i].service" manifest.yaml)

  echo "🚀 Rendering $repo (team=$team, service=$service)"

  ./agentops render ./chart \
    -f values/org.yaml \
    -f values/teams/$team.yaml \
    -f values/services/$service.yaml \
    --out-dir ./generated/$repo
done
