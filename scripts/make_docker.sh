#!/bin/bash

CARLA_ROOT=/home/bradyzhou/software/CARLA_0.9.8
SCENARIO_RUNNER_ROOT=/home/bradyzhou/code/2020_CARLA_challenge/scenario_runner
LEADERBOARD_ROOT=/home/bradyzhou/code/2020_CARLA_challenge/leaderboard

if [ -z "$CARLA_ROOT" ]
then
    echo "Error $CARLA_ROOT is empty. Set \$CARLA_ROOT as an environment variable first."
    exit 1
fi

if [ -z "$SCENARIO_RUNNER_ROOT" ]
then echo "Error $SCENARIO_RUNNER_ROOT is empty. Set \$SCENARIO_RUNNER_ROOT as an environment variable first."
    exit 1
fi

if [ -z "$LEADERBOARD_ROOT" ]
then echo "Error $LEADERBOARD_ROOT is empty. Set \$LEADERBOARD_ROOT as an environment variable first."
    exit 1
fi

mkdir .tmp

cp -fr ${CARLA_ROOT}/PythonAPI  .tmp
cp -fr ${SCENARIO_RUNNER_ROOT}/ .tmp
cp -fr ${LEADERBOARD_ROOT}/ .tmp
cp -fr /home/bradyzhou/code/2020_CARLA_challenge/carla_project .tmp

# build docker image
docker build --force-rm -t leaderboard-user -f scripts/Dockerfile.master .

rm -fr .tmp
