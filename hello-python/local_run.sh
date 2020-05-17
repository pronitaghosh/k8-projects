

# https://kubernetes.io/blog/2019/07/23/get-started-with-kubernetes-using-python/

git clone https://github.com/JasonHaley/hello-python.git
cd hello-python/

# Run locally: 
pip3 install virtualenv
/usr/local/bin/virtualenv py3env
source py3env/bin/activate
pip install -r app/requirements.txt
python app/main.py
# clearup
deactivate

# Create an image
docker build -f docker/Dockerfile -t hello-python:latest .

# Running in docker
docker run -p 5000:5000 hello-python
# cleanup
docker rm $(docker ps -aq --filter ancestor=hello-python )

# Running in Kubernetes
kubectl version
kubectl config use-context docker-for-desktop
kubectl get nodes
kubectl apply -f kubernetes/deployment.yaml
kubectl get pods
kubectl get deployment
kubectl get service
# Cleanup
kubectl delete -f kubernetes/deployment.yaml


