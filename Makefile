.PHONY: minikube knative deploy tunnel clean

minikube:
	minikube start

knative:
	kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.15.2/serving-crds.yaml
	kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.15.2/serving-core.yaml
	kubectl apply -f https://github.com/knative/net-kourier/releases/download/knative-v1.15.1/kourier.yaml
	kubectl patch configmap/config-network \
		--namespace knative-serving \
		--type merge \
		--patch '{"data":{"ingress-class":"kourier.ingress.networking.knative.dev"}}'
	kubectl --namespace kourier-system get service kourier
	kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.15.2/serving-default-domain.yaml

deploy:
	kubectl apply -f function.yaml

tunnel:
	minikube tunnel

clean:
	minikube delete