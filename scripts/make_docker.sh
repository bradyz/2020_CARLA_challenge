#!/bin/bash

CARLA_ROOT=/home/bradyzhou/software/CARLA_0.9.9
SCENARIO_RUNNER_ROOT=/home/bradyzhou/code/2020_CARLA_challenge/scenario_runner
LEADERBOARD_ROOT=/home/bradyzhou/code/2020_CARLA_challenge/leaderboard
TEAM_CODE_ROOT=/home/bradyzhou/code/2020_CARLA_challenge/leaderboard/team_code

mkdir .tmp

cp -fr ${CARLA_ROOT}/PythonAPI  .tmp
cp -fr ${SCENARIO_RUNNER_ROOT}/ .tmp
cp -fr ${LEADERBOARD_ROOT}/ .tmp
cp -fr ${TEAM_CODE_ROOT}/ .tmp/team_code
cp -fr /home/bradyzhou/code/2020_CARLA_challenge/carla_project .tmp

# build docker image
docker build --force-rm -t leaderboard-user -f scripts/Dockerfile.master .

rm -fr .tmp
