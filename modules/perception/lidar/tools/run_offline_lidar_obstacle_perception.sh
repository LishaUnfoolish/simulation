#!/usr/bin/env bash

##############################################################################
# Copyright 2018 The Apollo Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
###############################################################################

pcd_path="./data/lidar_pose/"
pose_path="./data/lidar_pose/"
output_path="./data/result_output/"

mkdir -p $output_path && rm -rf $output_path/*

/apollo/bazel-bin/modules/perception/lidar/tools/offline_lidar_obstacle_perception \
        --work_root=/apollo/modules/perception/production/ \
	--config_manager_path=./conf/perception/lidar\
        --pcd_path=$pcd_path \
        --pose_path=$pose_path \
        --output_path=$output_path \
        --use_hdmap=false \
        --enable_tracking=true \
        --use_tracking_info=false \
        --min_life_time=-0.1 \
        --log_dir=/apollo/data/logs \
	--v=4\
        2>&1 | tee segment.log
