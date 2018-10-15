# this script is used for publish react-native-android package to private maven repository

# react native config, you may change this most frequently
react_native_path="./node_modules/react-native"

# repository config
url="https://your-private-repository"
repository_id="your-private-repository-id"

react_native_target_path="${react_native_path}/android/com/facebook/react/react-native"
# retrieve version
version=$(ls ${react_native_target_path} | head -n 1)

artifact_dir="${react_native_path}/android/com/facebook/react/react-native/${version}"
file_prefix="${artifact_dir}/react-native-${version}"
file="${file_prefix}.aar"
pom_file="${file_prefix}.pom"

read -p "The current react native version is ${version}. Continue to publish? [y/n] " yn
case $yn in
    [Yy]* ) mvn deploy:deploy-file -Durl=${url}  -DrepositoryId=${repository_id} -Dfile=${file}  -DgeneratePom=false -DpomFile=${pom_file} -e; break;;
    [Nn]* ) exit;;
    * ) echo "Please intput y or n.";;
esac



