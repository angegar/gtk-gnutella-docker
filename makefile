build:
	docker build -t gtk-gnutella --rm .

run:
	docker run -ti --rm --name gtk-gnutella \
		-e  DISPLAY=192.168.1.6:0.0 \
		--cpus=0.3 \
		--memory=1000M \
		--entrypoint "/bin/sh" \
		gtk-gnutella
