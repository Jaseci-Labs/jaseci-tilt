# Load Kubernetes manifests
k8s_yaml("mongodb-statefulset.yaml")
k8s_yaml("mongodb-init-job.yaml")
k8s_yaml("redis-deployment.yaml")

# Define how to build the Docker image for the FastAPI application
docker_build("jaseci", context=".", dockerfile="jaseci.Dockerfile", live_update=[
    sync(".", "/app/"),
])

k8s_yaml("jaseci-deployment.yaml")

# Attach the FastAPI service to Tilt
k8s_resource("jaseci", port_forwards="8000:8000")

# Wait for MongoDB ReplicaSet initialization
k8s_resource("mongo-init", resource_deps=["mongodb"])

# Live update for FastAPI development
# live_update(
#     "your-docker-repo/fastapi",
#     [
#         sync("./backend", "/app"),
#         run("pip install -r requirements.txt", trigger=["requirements.txt"]),
#     ],
#     ignore=["*.pyc"],
# )
# 