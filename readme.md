## Ruby Gem AWS Layer Creator

### Usage
* Add Gems you need in Gemfile like this

```
echo "mail" >> Gemfile
```

* Run `make build`.
* Test it

```
docker run --env GEM_PATH=/opt/ruby/2.5.0/ --env GEM_HOME=/opt/ruby/2.5.0/ -e DOCKER_LAMBDA_STAY_OPEN=1 -p 9001:9001 -v ruby:/opt/ruby/:ro,delegated lambci/lambda:ruby2.5
```

* Use newly created zip `gem_layer.zip` to create AWS Layer.


### Dependencies
* Docker
* Docker Image: lambci/lambda:build-ruby2.5
