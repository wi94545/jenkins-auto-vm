# Jenkins Auto VM
---
## 專案說明

使用 Jenkins Pipeline 搭配 Terraform 自動在 GCP 建立一台 VM，並且安裝 nginx。

---
## 專案結構

``` 
jenkins-auto-vm/
├── terraform/
│ └── main.tf
├── Jenkinsfile
└── README.md
``` 

---
## 前置準備

1. 在 GCP 建立 Service Account，並下載 JSON Key。  
2. 在 Jenkins 裡新增 Credentials，類型為 "Secret file" 或 "Secret text"，放入 Service Account JSON，ID 請設為 `gcp-service-account-json`。  
3. 確保 Jenkins 主機安裝了 Terraform CLI。  
4. GitHub Repo 用SSH_URL，且 Jenkins 主機有設定好對應 SSH Key。 
