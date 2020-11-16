#!/bin/bash

PARENT_DIR=$(dirname $(pwd))

grep -IRl "/home/zichao" install/ | xargs sed -i "s:/home/zichao:${PARENT_DIR}:g"
grep -IRl "devel/lib" install/ | xargs sed -i "s:devel/lib:install/lib:g"
grep -IRl "devel/include" install/ | xargs sed -i "s:devel/include:install/include:g"
