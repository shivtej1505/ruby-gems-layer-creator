mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))

build:
	make create
	make pack

# Open up docker & install Gems
create:
	docker run --rm -it -v $(mkfile_dir):/var/gem_build -w /var/gem_build lambci/lambda:build-ruby2.5 bundle install --path=.

# Create a zip out of it
pack:
	zip -r gem_layer.zip ./ruby/ -x ./ruby/2.5.0/cache/\*

clean:
	rm -r ./ruby/
