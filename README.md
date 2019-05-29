# Clean Rails Example

A dockerized example of using clean architecture in rails. This is a simple Blog API for now, which supports a simple posts API.

# Quick Tour

* `/lib/blog_app` - application-level code
* `/lib/blog_app/use_cases` - application use cases, (aka interactors)
* `/lib/blog_app/entities` - domain entities
* `/lib/blog_app/repos` - abstract repository definitions (adapters for data access)
* `/app`, `/config`, `/db` - rails-specific code
* `/app/repos` - rails-specific implementations of the repo definitions
* `/app/serializers` - presentation-specific logic for converting domain entities to json

# Setup

run `docker-compose up app` to launch the app on localhost:3000

# Testing

run `docker-compose run --rm app rspec` to run the test suite

# Using the app

To create a new post, run e.g.

```bash
$ curl http://localhost:3000/posts -X POST -H 'Content-Type: application/json' \
  --data '{"author":"Connie Contentwriter","title":"Creating Posts","body":"Post posts by POSTing to /posts"}'
```
