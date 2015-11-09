# Build Image

	docker build -t gitssh .
	
# Run the Image (without pre-determined RSA keys)

	docker run -d -it -v /path/to/bare/gitrepos:/var/lib/git -p 10222:22 --name gitssh gitssh
	
# Run the Image (with pre-determined RSA keys)

	docker run --rm -it -v /path/to/bare/gitrepos:/var/lib/git -v /path/to/some/id_rsa:/home/git/.ssh/id_rsa -v /path/to/some/git-id_rsa.pub:/home/git/.ssh/id_rsa.pub -p 10222:22 --name gitssh gitssh