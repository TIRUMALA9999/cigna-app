#!/bin/bash

DEV_IMAGE=$(grep "image:" apps/dev/deployment.yaml | awk '{print $2}')

sed -i "s|image: .*|image: $DEV_IMAGE|g" apps/qa/deployment.yaml

git add apps/qa/deployment.yaml
git commit -m "promote dev image to qa"
git push origin main
