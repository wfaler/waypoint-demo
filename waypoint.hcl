# The name of your project. A project typically maps 1:1 to a VCS repository.
# This name must be unique for your Waypoint server. If you're running in
# local mode, this must be unique to your machine.
project = "hello-project"

# Labels can be specified for organizational purposes.
# labels = { "foo" = "bar" }

# An application to deploy.
app "web" {
  # Build specifies how an application should be deployed. In this case,
  # we'll build using a Dockerfile and keeping it in a local registry.
  build {
    use "docker" {

    }

	registry {
      use "docker" {
        image = "gcr.io/chaordic/hello-example"
        tag   = "latest"
      }
    }

  }

  # Deploy to Docker
  #deploy {
  #  use "docker" {
  #    service_port = 8080
  #  }
  #}
  deploy {
    use "kubernetes" {
      probe_path = "/"
      service_port = 8080
    }
  }

  release {
    use "kubernetes" {
    }
  }
}
