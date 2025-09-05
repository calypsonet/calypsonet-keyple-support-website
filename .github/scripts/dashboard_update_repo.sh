#!/bin/sh

token=$1
repository_name=$2
type=$3
license=$4
doc_relative_url=$5
ci_status_flag=$6

echo "Update the dashboard data of repository $repository_name..."

echo -n "[\"$repository_name\",\"$type\",\"$license\",\"$doc_relative_url\","$ci_status_flag"]" >> dashboard/repository_list.json

../.github/scripts/dashboard_update_repo_curl.sh $token $repository_name "" ""
../.github/scripts/dashboard_update_repo_curl.sh $token $repository_name "/branches" "branches"
../.github/scripts/dashboard_update_repo_curl.sh $token $repository_name "/issues" "issues"
../.github/scripts/dashboard_update_repo_curl.sh $token $repository_name "/pulls" "pulls"
../.github/scripts/dashboard_update_repo_curl.sh $token $repository_name "/releases/latest" "releases_latest"
../.github/scripts/dashboard_update_repo_curl.sh $token $repository_name "/commits/main/check-runs" "check_runs"
