docker build -t boonyaritth7/muti-client:latest -t boonyaritth7/muti-client:$SHA -f ./client/DOckerfile ./client
docker build -t boonyaritth7/muti-server:latest -t boonyaritth7/muti-server:$SHA -f ./server/DOckerfile ./server
docker build -t boonyaritth7/muti-worker:latest -t boonyaritth7/muti-worker:$SHA -f ./worker/DOckerfile ./worker

docker push boonyaritth7/muti-client:latest
docker push boonyaritth7/muti-server:latest
docker push boonyaritth7/muti-worker:latest

docker push boonyaritth7/muti-client:$SHA
docker push boonyaritth7/muti-server:$SHA
docker push boonyaritth7/muti-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=boonyaritth7/muti-server:$SHA
kubectl set image deployments/client-deployment client=boonyaritth7/muti-client:$SHA
kubectl set image deployments/worker-deployment worker=boonyaritth7/muti-worker:$SHA

