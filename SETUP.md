# Setup and Requirements

## Setup required for the host project in GCP

```shell
gcloud services enable --project cellular-datum-334404 cloudresourcemanager.googleapis.com
gcloud services enable --project cellular-datum-334404 cloudbilling.googleapis.com
gcloud resource-manager folders create \
   --display-name=cloud-eng-labs \
   --organization=1056619985873

Created [<Folder
 createTime: '2021-12-07T15:19:44.174Z'
 displayName: 'cloud-eng-labs'
 lifecycleState: LifecycleStateValueValuesEnum(ACTIVE, 1)
 name: 'folders/359903151024'
 parent: 'organizations/1056619985873'>].

```

Permissions required for the Terraform Service Account for GCP

```shell
organization level
- billing account admin
- folder viewer
- organisation viewer

folder level
- folder admin

gcloud organizations add-iam-policy-binding 1056619985873 \
    --member=serviceAccount:terraform@cellular-datum-334404.iam.gserviceaccount.com --role=roles/billing.admin
gcloud organizations add-iam-policy-binding 1056619985873 \
    --member=serviceAccount:terraform@cellular-datum-334404.iam.gserviceaccount.com --role=roles/resourcemanager.folderViewer
gcloud organizations add-iam-policy-binding 1056619985873 \
    --member=serviceAccount:terraform@cellular-datum-334404.iam.gserviceaccount.com --role=roles/resourcemanager.organizationViewer

gcloud resource-manager folders add-iam-policy-binding 359903151024 \
    --member=serviceAccount:terraform@cellular-datum-334404.iam.gserviceaccount.com --role=roles/resourcemanager.folderAdmin

```

## Setup required for Azure

```shell
az ad sp create-for-rbac --name terraform-lab-automation-poc

Grant admin consent for Directory 
Group.Read.All
Directory.Read.All
```