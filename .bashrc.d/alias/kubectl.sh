if [ ! -z $(which kubectl) ];
	source <(kubectl completion bash)
fi