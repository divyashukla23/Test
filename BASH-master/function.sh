# function_name {
#    // codebase
# }

# greet() {
# echo "Hello good morning"
# }

# result=$(greet)
# echo $result

#/bin/bash

add(){
    sum=$(($1 + $2))
    echo "$sum"
}
result=$(add a b)
echo $result