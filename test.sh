#!/bin/bash

echo 'Clear gradle build cache from $HOME/.gradle/'

rm -rf $HOME/.gradle/caches/build-cache-1/

ls $HOME/.gradle/caches

echo 'Compare two project dirs. They should be the same'

diff hello-world-1 hello-world-2

echo 'Seeding the cache entry from first folder'

(cd hello-world-1 ; ./gradlew clean detekt)

echo 'If there are no absolute PATH reference cache for second folder should be reused'

(cd hello-world-2 ; ./gradlew clean detekt)
