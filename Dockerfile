FROM microsoft/dotnet:2.2-sdk
RUN apt-get update -y && apt-get install -y lsb-release && export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" \
&& echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
&& curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
&& apt-get update -y && apt-get install -y google-cloud-sdk \
&& apt-get install -y curl gnupg apt-transport-https \
&& curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
&& sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/microsoft.list' \
&& apt-get update -y \
&& apt-get install -y powershell