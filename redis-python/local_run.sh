
# https://www.bogotobogo.com/python/Flask/Python_Flask_App_3_Redis_Task_Queue.php
# https://github.com/Einsteinish/akadrone-flask

k8project="redis-python"
cd ${k8project}

# Run locally: 
pip3 install virtualenv
/usr/local/bin/virtualenv py3env
source py3env/bin/activate
pip install -r app/requirements.txt
python app/main.py
# clearup
deactivate

# Create an image
docker build -f docker/Dockerfile -t ${k8project}:latest .

# Running in docker
docker run -d --name redis -p 6379:6379 ${k8project}

# redis-cli -h 192.168.0.1 -p 6379

# cleanup
docker rm $(docker ps -aq --filter ancestor=${k8project} )

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

