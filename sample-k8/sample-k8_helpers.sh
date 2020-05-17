

function kubectl_create()
{
    docker_compose_file="sample-k8-docker-compose.yml"
    docker_stack="sample-k8"
    docker swarm init
    DOCKER_STACK_ORCHESTRATOR=swarm
    docker stack deploy --orchestrator swarm --namespace ${docker_stack} --compose-file ${docker_compose_file} ${docker_stack}
    docker stack services ${docker_stack}

    kubectl get nodes

    docker stack ps
    docker stack rm

    ln -sf ${docker_compose_file} docker-compose.yml
    # docker-compose rm  
    docker-compose down -v --rmi all --remove-orphans

    docker rm -v $(docker ps -aq -f 'status=exited')
    docker rmi $(docker images -aq -f 'dangling=true')

    docker volume rm $(docker volume ls -q -f 'dangling=true')

    docker system prune
    docker image prune

}

function kubectl_setup()
{
    kubectl config get-contexts
    kubectl config use-context docker-desktop

    kubectl config view
    # kubectl config delete-context docker-desktop
    # kubectl config delete-context docker-for-desktop

}
