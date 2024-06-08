#### Requirements:

1. Install [tilt](https://tilt.dev/)
    * [here](https://docs.tilt.dev/) is a quick introduction and tutorial about tilt
2. You need to have a local kubernetes engine. There are a number of options depending on your environment and operating system. More details [here](https://docs.tilt.dev/choosing_clusters)

#### To stand up a jaseci stack using tilt:

1. Modify `jaseci.Dockerfile` 
    * to add any additional dependencies needed for your project.
    * copy your jac project source code into the docker (via the `COPY` command)
    * modify last line `jac run` to use your main jac file.
2. Run `tlilt up`