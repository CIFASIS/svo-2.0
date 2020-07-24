help:
	@echo "help   -- print this help"
	@echo "shell  -- open shell in container"
	@echo "image  -- build Docker image"


image:
	docker build --tag svo_ros:ros-kinetic .
shell:
	XAUTH=/tmp/.docker.xauth; \
	xauth nlist $$DISPLAY | sed -e 's/^..../ffff/' | xauth -f $$XAUTH nmerge - ; \
	docker run -it --rm --net=host --device /dev/dri/ -v /tmp/.X11-unix:/tmp/.X11-unix:ro -v $$XAUTH:$$XAUTH  -e XAUTHORITY=$$XAUTH -e DISPLAY=$$DISPLAY svo_ros:ros-kinetic

.PHONY: help shell image

