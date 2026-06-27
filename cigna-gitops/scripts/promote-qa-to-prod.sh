#!/bin/bash

QA_IMAGE=$(grep "image:" apps/qa/deployment.yaml | awk '{print $2}')

sed -i "s|image: .*|image: $QA_IMAGE|g" apps/prod/deployment.yaml

git add apps/prod/deployment.yaml
git commit -m "promote qa image to prod"
git push origin main
