#!/bin/sh

token=$1

echo "Create dashboard data directory..."
mkdir dashboard/

echo "{ \"datetime\":\"`date --utc --iso-8601=seconds`\"}" > dashboard/datetime.json

echo "[" >> dashboard/repository_list.json
../.github/scripts/dashboard_update_repo.sh $token calypsonet keyple-demo-ticketing "demonstrator" "3-Clause BSD" "demo/ticketing/" true
echo "," >> dashboard/repository_list.json
../.github/scripts/dashboard_update_repo.sh $token calypsonet keyple-cna-java-example "demonstrator" "3-Clause BSD" "demo/example/" true
echo "," >> dashboard/repository_list.json
../.github/scripts/dashboard_update_repo.sh $token calypsonet keyple-plugin-cna-coppernic-cone2-java-lib "plugin" "EPL-2.0" "plugin-ext/coppernic/" true
echo "," >> dashboard/repository_list.json
../.github/scripts/dashboard_update_repo.sh $token calypsonet keyple-plugin-cna-famoco-se-communication-java-lib "plugin" "EPL-2.0" "plugin-ext/famoco/" true
echo "," >> dashboard/repository_list.json
../.github/scripts/dashboard_update_repo.sh $token calypsonet keyple-plugin-cna-flowbird-android-java-lib "plugin" "EPL-2.0" "plugin-ext/flowbird/" true
echo "," >> dashboard/repository_list.json
../.github/scripts/dashboard_update_repo.sh $token calypsonet keyple-plugin-cna-bluebird-specific-nfc-java-lib "plugin" "EPL-2.0" "plugin-ext/bluebird/" true
echo "," >> dashboard/repository_list.json
../.github/scripts/dashboard_update_repo.sh $token calypsonet keyple-plugin-cna-legacyhsm-java-lib "plugin" "EPL-2.0" "plugin-ext/hsm/" true
echo "," >> dashboard/repository_list.json
../.github/scripts/dashboard_update_repo.sh $token calypsonet-member keyple-plugin-cna-storagecard-java-lib "plugin" "CNA Lib" "card-ext/storage-card/" true
echo "," >> dashboard/repository_list.json
../.github/scripts/dashboard_update_repo.sh $token calypsonet-member keyple-card-cna-storagecard-java-lib "card" "CNA Lib" "card-ext/storage-card/" true
echo "," >> dashboard/repository_list.json
../.github/scripts/dashboard_update_repo.sh $token calypsonet cna-tool-card-analyzer-app "tool" "EPL-2.0" "tool/card-audit/" true
echo "," >> dashboard/repository_list.json
../.github/scripts/dashboard_update_repo.sh $token calypsonet cna-tool-basic-card-perso-app "tool" "CNA App" "tool/basic-card/" true
echo "," >> dashboard/repository_list.json
../.github/scripts/dashboard_update_repo.sh $token calypsonet cna-tool-basic-legacysam-perso-app "tool" "CNA App" "tool/basic-sam/" true
echo "" >> dashboard/repository_list.json
echo "]" >> dashboard/repository_list.json