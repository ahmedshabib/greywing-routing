# Digital Ocean Cluster

You need `doctl` set up and linked to both `docker` and `kubectl`

### Doctl

This needs to be set up for both `sudo` (for docker) and normal user (for `kubectl`).

**Check if installed:**  `doctl version` and `sudo doctl version`

**If not installed:**

1. Get yourself a new token: https://cloud.digitalocean.com/account/api/tokens?i=c74b49
2. Copy token
3. Run `doctl auth init`  (or with `sudo`)
4. Fill in your token



### Docker

*Any images you want to use with k8s must be pushed to DO docker repo.*

**Pushing images to DO repo:**

1. Make sure you have `sudo doctl` working
2. `sudo doctl registry login`
3. `sudo docker tag LOCALIMAGE registry.digitalocean.com/greywing-cr/REMOTEIMAGE:TAG`
4. `sudo docker push registry.digitalocean.com/greywing-cr/REMOTEIMAGE:TAG`

Then in your k8s yaml file, set image to `registry.digitalocean.com/greywing-cr/REMOTEIMAGE:TAG`



**Making DO Docker repository accessible to DO Kubernetes:**

1. Go to: https://cloud.digitalocean.com/registry/settings?i=c74b49
2. See *Digital Ocean Kubernetes Integration*
3. Click *Edit*
4. Check that your cluster is associated



### Kubectl

**Connect to cluster:**

Follow instructions at: https://hebehh.github.io/assets/darkpages/AccessingKubernetesCluster/Contexts.html#switching-contexts

**Add new context/new computer:**

1. Get the name of your cluster
2. `doctl kubernetes cluster kubeconfig save CLUSTERNAME`
3. Connect to cluster with previous instructions

**I was randomly signed out?**

It seems like there may be a 7-day validity period for cluster access depending on how you grant access. See: https://docs.digitalocean.com/products/kubernetes/how-to/connect-to-cluster/



### Cluster node size and scaling

https://docs.digitalocean.com/products/kubernetes/how-to/autoscale/

Above link has instructions for setting up autoscaling, changing parameters (num nodes, max, min) and removing.



### Load-Balanced Services in DO

In DO you need some specific annotations to get Load Balancers to work.

1. https://docs.digitalocean.com/products/kubernetes/how-to/add-load-balancers/
2. Basically you have to add in `metadata -> annotations -> service.beta.kubernetes.io/do-loadbalancer-size-slug: "lb-small"`
3. But see the link in (1) for more details