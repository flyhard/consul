build: Dockerfile entrypoint.sh *.zip *.json
	docker build --rm -t flyhard/consul .

start: build
	docker run -d -it -p 8500:8500 --name consul flyhard/consul:latest -bootstrap -atlas flyhard/abich -atlas-token ${TOKEN} -atlas-join
logs:
	docker logs consul
stop: logs
	docker stop consul
	docker rm consul
