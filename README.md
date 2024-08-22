# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


---

To run k8s locally follow this:

1. Install minikube, kubectl and docker
   1. [minikube](https://minikube.sigs.k8s.io/docs/start/?arch=%2Fmacos%2Farm64%2Fstable%2Fbinary+download)
   2. [kubectl](https://kubernetes.io/docs/tasks/tools/)
   3. [docker](https://docs.docker.com/engine/install/)
   
2. Once you've installed the tools, run minikube:
   1. Run `minikube start`
   2. Now you have 2 options:
      1. Use `$ kubectl command` directly
      2. Use `$ minikube kubectl -- command`, in case you want minikube to use the recommended version without affecting your kubectl current installation
   3. Once it's installed and running, run `minikube dashboard` to install and run the minikube browser dashboard for your new local cluster
      - It may ask you to run `minikube addons enable metrics-server` to enable a mandatory addon

---

To setup kong gateway solution + kubernetes follow this:

1. Run `kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.0.0/standard-install.yaml` to create the kong custom resources in your cluster
2. Run `kubectl create namespace kong` to create the Kong specific namespace
3. Install [Helm](https://helm.sh)
   1. Run `helm repo add kong https://charts.konghq.com`
   2. Run `helm repo update`
1. Install Kong's CRDs with `kubectl apply -k https://github.com/Kong/kubernetes-ingress-controller/config/crd`
2. Run `helm install kong kong/ingress -f kong-values.yml -n kong`
3. To check if everything is working correctly Run `kubectl get all -n kong`
4. Run `minikube tunnel` in order to have a tunnel between kong and your machine [see this](https://minikube.sigs.k8s.io/docs/handbook/addons/kong-ingress/)
5. Then apply all of the files inside `/kube` folder using `kubectl apply -f filepath`