
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

