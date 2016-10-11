echo "* web request scripts loading..."

# make a GET request
function get {
    curl -X GET $1
}

# make a POST request
function post {
    if [[ -n $8 ]]; then
        curl -X POST $1 --data $2 --data $3 --data $4 --data $5 --data $6 --data $7 --data $8
    elif [[ -n $7 ]]; then
        curl -X POST $1 --data $2 --data $3 --data $4 --data $5 --data $6 --data $7
    elif [[ -n $6 ]]; then
        curl -X POST $1 --data $2 --data $3 --data $4 --data $5 --data $6
    elif [[ -n $5 ]]; then
        curl -X POST $1 --data $2 --data $3 --data $4 --data $5
    elif [[ -n $4 ]]; then
        curl -X POST $1 --data $2 --data $3 --data $4
    elif [[ -n $3 ]]; then
        curl -X POST $1 --data $2 --data $3
    elif [[ -n $2 ]]; then
        curl -X POST $1 --data $2 
    else
        curl -X POST $1
    fi
    echo ""
}

# make a PUT request
function put {
    if [[ -n $2 ]]; then
        curl -X PUT $1 --data $2
    else
        curl -X PUT $1
    fi
}

alias ip="ifconfig | grep -i "inet.*broadcast" | awk '{print \$2}'"

### DOCKER ###
alias dock_i="docker images"
alias dock_pa="docker ps -a"
function dock_run_local_cam {
    docker build . -t cameronbell/$1:latest
    docker push cameronbell/$1
    docker ps -a
    docker ps | ack -v "CONTAINER ID" | awk '{print $1}' | xargs docker logs
}
alias dock_log_running_cont="docker ps -a | ack -v 'CONTAINER ID' | awk '{print \$1}' | head -1 | xargs docker logs"

alias dock_taillog='docker ps | grep -v "CONTAINER" | awk "{print \$1}" | xargs docker logs -f'

alias dock_wipecontainers="docker ps -a | awk '{print $1}' | xargs docker rm"

echo "* web request scripts loaded!"
