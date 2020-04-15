#!/bin/bash
PYTHONPATH=$PYTHONPATH:$CARLA_ROOT/PythonAPI/carla
PYTHONPATH=$PYTHONPATH:$CARLA_ROOT/PythonAPI/carla/dist/carla-0.9.8-py3.5-linux-x86_64.egg
PYTHONPATH=$PYTHONPATH:leaderboard
PYTHONPATH=$PYTHONPATH:scenario_runner

CHECKPOINT_ENDPOINT="$TEAM_CONFIG/$(basename $ROUTES .xml).txt"

python leaderboard/leaderboard/leaderboard_evaluator.py \
--challenge-mode \
--track=dev_track_3 \
--scenarios=leaderboard/data/all_towns_traffic_scenarios_public.json  \
--agent=${TEAM_AGENT} \
--agent-config=${TEAM_CONFIG} \
--routes=${ROUTES} \
--checkpoint=${CHECKPOINT_ENDPOINT} \
--port=${PORT}

echo "Done. See $CHECKPOINT_ENDPOINT for detailed results."
