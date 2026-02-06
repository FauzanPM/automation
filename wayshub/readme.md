# wayshub
## 1. Provisioning
### create server aws with terraform

> <img width="1867" height="62" alt="image" src="https://github.com/user-attachments/assets/41dfeafc-eebc-4cf0-921c-2fb00262cab6" />
> Here, I am using a service provider from AWS and Terraform to create a server using IaC. Here, I am only creating main. tf file for the server creation center and security_group.tf to open ports.

> <img width="1881" height="785" alt="image" src="https://github.com/user-attachments/assets/9b965c90-cdbe-45ac-9176-69c1ee45caa0" />
> <img width="1897" height="240" alt="image" src="https://github.com/user-attachments/assets/152753a6-94b9-49be-8083-9c3e75e60d8c" />
> This Terraform file is used to create and manage EC2 instances on AWS in the ap-southeast-2 region. This configuration defines two instances with different specifications, sets a key pair for SSH access, associates the appropriate security group,
> <img width="1830" height="247" alt="image" src="https://github.com/user-attachments/assets/46bfa813-e801-43b1-a41f-68343acac187" />
> and displays the public IP of the main instance as output for access and further configuration purposes.

> <img width="1884" height="724" alt="image" src="https://github.com/user-attachments/assets/21efbcde-a6a0-4db9-9a88-a2a230c8fa87" />
> This Terraform file is used to configure network access rules to the server. This security group opens inbound access for SSH, HTTP/HTTPS, as well as several application and monitoring ports that can be added, such as Jenkins, SonarQube, Prometheus, Grafana, and Node Exporter, while outbound rules allow all outgoing traffic without restrictions.

> <img width="1883" height="300" alt="image" src="https://github.com/user-attachments/assets/26793eb6-aa97-4206-9b94-cf3454d8918a" />
> This file is used to define hosts and their grouping in Ansible, such as appserver, monitoring, and gateway. Each group contains the target server IP, as well as global variables to determine the SSH user and Python interpreter used during playbook execution.

> <img width="1883" height="190" alt="image" src="https://github.com/user-attachments/assets/6a0caeef-cd3d-433d-978e-b77e4575fa36" />
> This configuration file is used to set Ansible's default behavior, such as the inventory location, SSH key used, remote user, and disabling host key checking.

> <img width="1870" height="254" alt="image" src="https://github.com/user-attachments/assets/ebe0afd2-d31c-49a2-a4f9-618347cd2441" />
> When I check the server, the result is successful.


## 2. Repository

> <img width="1884" height="777" alt="image" src="https://github.com/user-attachments/assets/0b89fd10-39ca-4298-a27a-0b09fad99430" />
> <img width="1886" height="807" alt="image" src="https://github.com/user-attachments/assets/d5ae442b-2145-4e89-bbef-d3ae90b65d70" />
> This playbook is used to update application code by pulling the frontend and backend repositories from GitHub based on a specific branch (default: main). It is used on deployment servers to ensure that the running code always follows the latest version of the repository.


## 3. setup configuration

> <img width="1881" height="859" alt="image" src="https://github.com/user-attachments/assets/a228c90a-1315-457f-9e4a-209bfb1b09c5" />
> <img width="1887" height="811" alt="image" src="https://github.com/user-attachments/assets/b0a6d0b8-8079-4994-8146-2f6d508d173a" />
> <img width="1879" height="483" alt="image" src="https://github.com/user-attachments/assets/9738abb6-febf-4e65-8fc1-d099bb96379a" />
> Playbook ini digunakan untuk menyiapkan Docker Private Registry pada server monitoring dengan sistem autentikasi menggunakan htpasswd (bcrypt). Registry dijalankan sebagai container Docker dengan data dan konfigurasi autentikasi yang bersifat persisten. Setelah registry aktif, dilakukan pengecekan endpoint untuk memastikan layanan berjalan dan akses tanpa autentikasi ditolak. 

> <img width="1884" height="976" alt="image" src="https://github.com/user-attachments/assets/2db99869-9c3f-43fc-a7fd-800df3dc9525" />
> <img width="1889" height="891" alt="image" src="https://github.com/user-attachments/assets/0d7555e9-e2e9-4da3-8789-101af77ac49d" />
> This playbook is used to install and set up Docker Engine on all hosts. The process includes updating the system repository, installing supporting dependencies, adding the GPG key and official Docker repository, installing Docker Engine and its components, ensuring that the Docker service runs automatically, and adding users to the docker group so that they can run Docker without root access.

## 3. deploy

> <img width="1919" height="140" alt="image" src="https://github.com/user-attachments/assets/d4e65efe-86fc-4c87-bd21-4d47a75dbdab" />
> Displaying containers running on the server: frontend, backend, MySQL, and private Docker registry. All services are active and each has been exposed to the appropriate port for application, database, and registry access.

### FRONTEND

This frontend site is built using [GitHub Pages Frontend](https://github.com/FauzanPM/wayshub_fe.git).
> <img width="1455" height="667" alt="image" src="https://github.com/user-attachments/assets/e7eb59f5-10de-497c-ba5c-92903b52f59b" />
> This Dockerfile uses a multi-stage build for Node.js-based frontend applications. The first stage is used to install dependencies and build the application, while the second stage only runs the build results with PM2 to make it lighter and more stable. The application is exposed on port 3000 and runs using pm2-runtime for production needs.

> <img width="1449" height="820" alt="image" src="https://github.com/user-attachments/assets/37144ff0-8dc0-4285-a6f5-2ecbf3b926c7" />
> <img width="1429" height="702" alt="image" src="https://github.com/user-attachments/assets/4f246d11-6a1a-47d5-8d46-3875c2b94c93" />
> <img width="1431" height="286" alt="image" src="https://github.com/user-attachments/assets/e6e1f1f5-24d4-4d85-8488-77691b5dd980" />
> This workflow automates the process of building, pushing, and deploying frontend applications. The pipeline runs when there is a push to the main branch, builds a Docker image, sends it to a private registry, and then deploys it to the server via SSH by running the frontend container on port 3000.

> <img width="1441" height="723" alt="image" src="https://github.com/user-attachments/assets/cdbae117-820c-449e-a9bb-d6741c42f0e6" />
> This file configures the Axios client for the frontend, with a baseURL to the backend API. The setAuthToken function is available to add or remove the Authorization Bearer token in the header of each API request.

> <img width="1889" height="964" alt="image" src="https://github.com/user-attachments/assets/87eca021-6b6f-427a-bf77-8afccf720521" />
> The result of the process run by the GitHub Action workflow. 

> <img width="1919" height="1062" alt="image" src="https://github.com/user-attachments/assets/8de4d65a-2be9-4636-b3ff-63e48bcd2dbc" />
> If the frontend deployment is successful, it can be accessed via the URL https.


### 4. BACKEND

This backend site is built using [GitHub Pages Backend](https://github.com/FauzanPM/wayshub_be.git).
> <img width="1444" height="588" alt="image" src="https://github.com/user-attachments/assets/8a41564b-292c-4891-94a1-3d73eee2c189" />
> Used to build and run Node.js-based backend applications using a multi-stage method. The build stage installs dependencies, then the runtime stage runs the application using PM2 for greater stability in production.
>
> <img width="1446" height="860" alt="image" src="https://github.com/user-attachments/assets/f6000dd5-4656-4909-8156-2b40ae789b4e" />
> Sequelize configuration file that defines database connections for development, test, and production environments, including credentials, host, and MySQL dialect.
>
> <img width="1435" height="882" alt="image" src="https://github.com/user-attachments/assets/7b2a5022-504a-4406-b431-cc3d7b2ad42d" />
> Used to run MySQL 5.7 in a Docker container, complete with user, database, port, and volume configurations to keep database data persistent.
>
> <img width="1429" height="892" alt="image" src="https://github.com/user-attachments/assets/72a1a165-461c-409c-ba42-dc5cf2e70a16" />
> <img width="1435" height="772" alt="image" src="https://github.com/user-attachments/assets/08c8bc66-35cb-4bed-a3b6-d81c224bccbd" />
> <img width="1431" height="740" alt="image" src="https://github.com/user-attachments/assets/25802c62-1ed3-4e17-acb4-e96bf89396cf" />
> This workflow automates the build, push, and deploy processes for the backend. Every push to the main branch triggers the backend image to be built and pushed to the private registry. The server then pulls the latest image, ensures the MySQL container is running, starts the backend container, and executes database migrations (Sequelize) after the application is active.
>
> <img width="1897" height="972" alt="image" src="https://github.com/user-attachments/assets/44b052c5-68c2-4198-a8ef-beaa68b35441" />
> The result of the process run by the GitHub Action workflow.

> <img width="1919" height="1058" alt="image" src="https://github.com/user-attachments/assets/3ec8b36b-bc15-4eba-a1a4-922de6e354a8" />
> <img width="1919" height="973" alt="image" src="https://github.com/user-attachments/assets/3c027615-1111-40c9-90a1-79255f4c9d8d" />
> If the backend and database deployment is successful, the website will be able to register and log in.

> <img width="1894" height="927" alt="image" src="https://github.com/user-attachments/assets/0abe2513-69cd-40e5-8314-06fef91496a3" />
> This step ensures that the MySQL container is running correctly and that the Wayshub database has been successfully created and populated. The tables resulting from the Sequelize migration are visible, and the data in the Channels table has been successfully stored, indicating that the backend is connected to the database and that CRUD operations are running normally.


## 5. Monitoring

> <img width="1881" height="689" alt="image" src="https://github.com/user-attachments/assets/0112c200-de66-454c-a8cb-307b7d1e4651" />
> This playbook is used to deploy Node Exporter on all servers (appserver2, gateway, and monitoring). Its function is to create a monitoring directory on the server, send the Node Exporter Docker Compose file, and then run the Node Exporter container using Docker Compose so that server system metrics can be collected by Prometheus.

> <img width="1882" height="582" alt="image" src="https://github.com/user-attachments/assets/d35af648-310a-49b9-9730-3e078c07726e" />
> File Docker Compose ini digunakan untuk menjalankan Node Exporter sebagai container. Node Exporter berfungsi mengekspor metrik sistem (CPU, memory, disk, filesystem, dll) melalui port 9100 dengan mount direktori sistem host secara read-only.

> <img width="1877" height="670" alt="image" src="https://github.com/user-attachments/assets/8dbc6506-1018-4e37-900e-8e7323888748" />
> <img width="1883" height="427" alt="image" src="https://github.com/user-attachments/assets/f4af809a-808b-43c8-9974-fd2b8782795b" />
> This file is used to run stack monitoring consisting of Prometheus and Grafana using Docker Compose. Prometheus acts as a metric collector, while Grafana is used for visualization and alerting, complete with SMTP configuration for notifications.

> <img width="1880" height="494" alt="image" src="https://github.com/user-attachments/assets/41ff4dab-604c-4361-96b9-91e460471482" />
> This file is a Prometheus configuration that defines the target servers to be monitored. Each job_name represents a server (appserver, gateway, and monitoring) with a metric retrieval interval of every 5 seconds via Node Exporter on port 9100.

> <img width="1887" height="721" alt="image" src="https://github.com/user-attachments/assets/3530a0ed-2def-4583-a26b-8d67bcd582eb" />
> This playbook is used to set up and run a monitoring server. The process involves sending Prometheus configurations and Docker Compose files to the monitoring server, then running Prometheus and Grafana services using Docker Compose centrally.

> <img width="1919" height="755" alt="image" src="https://github.com/user-attachments/assets/36d6c054-25bc-4593-948c-42dff667fb72" />
> the results of running the node exporter

> <img width="1919" height="468" alt="image" src="https://github.com/user-attachments/assets/636f7a7b-cfe2-4cf7-9489-8c72d59a6a30" />
> Adding basic authentication to Prometheus by entering the username and password when first logging in with the Prometheus URL.
> <img width="939" height="529" alt="image" src="https://github.com/user-attachments/assets/02ed40a7-a780-4b73-9c84-7fc3683ac505" />
> after Prometheus connects to or obtains data from the node exporter server

> <img width="1445" height="702" alt="image" src="https://github.com/user-attachments/assets/bf022a28-6035-4333-8d6a-23b85ffa089d" />
> Adding a URL and basic authentication to Grafana to retrieve data collected by Prometheus
> <img width="939" height="557" alt="image" src="https://github.com/user-attachments/assets/cd63ea6e-5905-422d-abe0-afd07b572f0b" />
> displaying data from several servers used, data in the form of CPU usage, RAM, disk, and others

> <img width="1432" height="636" alt="image" src="https://github.com/user-attachments/assets/c3adb837-328a-4637-920a-f82462d6793b" />
> For contact points, use the Telegram bot by entering the BOT API Token and Chat ID.
> <img width="1380" height="828" alt="image" src="https://github.com/user-attachments/assets/2711ae07-1e25-4e1f-862c-3fa794ddef00" />
> create a warning for RAM usage, and warn users not to exceed 2GB on the monitoring server out of the current total RAM usage of 2.7GB
> <img width="1417" height="617" alt="image" src="https://github.com/user-attachments/assets/946affe0-e32d-446d-9c76-6a99a2d34ac3" />
> When usage exceeds the previously set warning, it will pause before firing for one minute from the previously set time.
> <img width="1435" height="990" alt="image" src="https://github.com/user-attachments/assets/603c3ffc-3f89-42bf-9d9d-707946ba59b8" />
> Display an alert message when rules exceed the pending time limit, showing the usage value, alert name, alert folder, and which server exceeded the rules. Send a resolved message when the rules have been addressed.

## 6. SSL
> <img width="1883" height="921" alt="image" src="https://github.com/user-attachments/assets/bdd52595-13e9-45da-b28b-ce9284883fae" />
> <img width="1884" height="903" alt="image" src="https://github.com/user-attachments/assets/fb2bc770-f4e4-47bd-b2d9-39e7282430f3" />
> <img width="1889" height="854" alt="image" src="https://github.com/user-attachments/assets/4e556c9a-da4f-4969-9f0d-069feac45686" />
> <img width="1887" height="887" alt="image" src="https://github.com/user-attachments/assets/919a2489-f807-493a-a40f-73cd8edf5075" />
> <img width="1892" height="903" alt="image" src="https://github.com/user-attachments/assets/69394c56-51de-46bd-85bb-ce83731e52cb" />
> <img width="1886" height="788" alt="image" src="https://github.com/user-attachments/assets/70ae60ce-a792-468c-81b9-ac528b84f5e3" />
> This playbook installs Nginx and configures a reverse proxy for various services (frontend, backend, staging, Jenkins, registry, monitoring). Each domain is directed to the IP and port of the related service, then Nginx is reloaded so that the configuration takes effect.

> <img width="1883" height="777" alt="image" src="https://github.com/user-attachments/assets/0d51e4b0-a6ee-40e8-a38e-55f6d5131df5" />
> <img width="1882" height="496" alt="image" src="https://github.com/user-attachments/assets/1c1cee83-ea58-405f-9b39-a54f96633eff" />
> This playbook installs Certbot and the Nginx plugin to enable SSL/TLS (HTTPS) on all domains in use. Let’s Encrypt certificates are automatically generated, and Nginx is reloaded to immediately apply secure connections.


# kubernetes frontend wayshub

## 1. Persiapan Cluster Kubernetes dengan k3s
Menunjukkan cluster Kubernetes sudah siap digunakan dengan 1 node master dan 2 node worker dalam kondisi Ready, serta namespace yang dibutuhkan sudah tersedia.
<img width="1858" height="121" alt="image" src="https://github.com/user-attachments/assets/252edace-f918-453c-92e4-be43c77ad6f3" />
<img width="1877" height="212" alt="image" src="https://github.com/user-attachments/assets/84da1870-1e6d-4817-a55e-17544aae3f34" />

## 2. Instalasi Komponen Pendukung
Memastikan komponen penting seperti Ingress NGINX dan cert-manager sudah berjalan dengan normal untuk kebutuhan routing dan SSL.
<img width="1880" height="96" alt="image" src="https://github.com/user-attachments/assets/82b9e184-538c-403f-b8bb-060173a52638" />
<img width="1919" height="332" alt="image" src="https://github.com/user-attachments/assets/4cc9e915-6670-4a51-91b8-e97af7260a86" />
<img width="1879" height="118" alt="image" src="https://github.com/user-attachments/assets/53b01c3d-e49d-4472-af34-260663a0d62e" />

## 3. Persiapan Aplikasi Frontend
Struktur project frontend disiapkan, termasuk Dockerfile multi-stage untuk build React app dan konfigurasi NGINX sebagai web server.
<img width="1919" height="473" alt="image" src="https://github.com/user-attachments/assets/42e6e3de-438e-4712-9c4f-7d6a883ac115" />
Dockerfile ini menggunakan multi-stage build untuk membangun aplikasi frontend menggunakan Node.js, kemudian hasil build berupa file statis dijalankan menggunakan NGINX sebagai web server yang ringan dan efisien, dengan konfigurasi NGINX khusus serta mengekspos port 80 untuk akses aplikasi.
<img width="1893" height="366" alt="image" src="https://github.com/user-attachments/assets/65d9b3bf-8377-4210-87da-138693cc2e08" />
File nginx.conf ini berfungsi mengatur NGINX sebagai web server frontend dengan menjalankan aplikasi di port 80, menampilkan file statis dari hasil build, mendukung routing SPA menggunakan try_files, serta mengaktifkan gzip compression untuk meningkatkan performa loading aplikasi.
<img width="1892" height="361" alt="image" src="https://github.com/user-attachments/assets/ae328770-0b90-4c30-9899-6f603486be9c" />

## 4. Build dan Push Image
Workflow GitHub Actions ini digunakan untuk build dan push Docker image frontend secara otomatis ke private registry setiap ada push ke branch main, dimulai dari checkout source code, login ke registry menggunakan secret, lalu membangun image dan mengirimkannya ke registry dengan tag latest.
<img width="1501" height="926" alt="image" src="https://github.com/user-attachments/assets/a04fb315-6f95-4721-91d5-20f17fa44381" />
<img width="1452" height="504" alt="image" src="https://github.com/user-attachments/assets/4936fedd-815a-4499-ad3f-62b81036af6e" />

## 5. Konfigurasi Kubernetes Manifest
File deployment.yaml ini mendefinisikan Deployment Kubernetes untuk aplikasi frontend Wayshub dengan 2 replica agar high availability, menggunakan image dari private registry, menjalankan container di port 80, serta memastikan pod selalu diperbarui dengan image terbaru.
<img width="1896" height="530" alt="image" src="https://github.com/user-attachments/assets/9c18c875-54b6-4461-9d88-c426bf21aed4" />
File service.yaml ini berfungsi membuat Service Kubernetes bertipe ClusterIP untuk mengekspos aplikasi frontend di dalam cluster, mengarahkan traffic ke pod dengan label wayshub-frontend melalui port 80.
<img width="1895" height="326" alt="image" src="https://github.com/user-attachments/assets/3c73c42a-73e6-4ca4-aa10-08e505120b28" />
File **ingress.yaml** ini mengatur **akses HTTP/HTTPS ke aplikasi frontend** melalui domain `kube.fauzan.studentdumbways.my.id`, menggunakan **NGINX Ingress Controller**, mengaktifkan **SSL otomatis dari cert-manager (Let’s Encrypt)**, serta meneruskan traffic ke Service frontend pada port 80.
<img width="1897" height="625" alt="image" src="https://github.com/user-attachments/assets/7ca70a41-09f2-4635-9ee2-e60e9f2f00a9" />
File clusterissuer.yaml ini digunakan untuk mengonfigurasi cert-manager agar dapat menerbitkan sertifikat SSL dari Let’s Encrypt secara otomatis di seluruh cluster Kubernetes, menggunakan ACME HTTP-01 challenge melalui NGINX Ingress Controller, serta menyimpan kunci privat sertifikat pada secret letsencrypt-prod.
<img width="1893" height="372" alt="image" src="https://github.com/user-attachments/assets/9ec975d4-9808-4dc9-8a00-2a696140e608" />

## 6. Verifikasi Deployment
Dilakukan pengecekan pod, service, ingress, dan sertifikat untuk memastikan aplikasi berjalan normal dan dapat diakses melalui HTTPS.
<img width="1919" height="303" alt="image" src="https://github.com/user-attachments/assets/dccbbbdf-2a35-4936-b567-ab54ab0531bf" />
<img width="1919" height="219" alt="image" src="https://github.com/user-attachments/assets/919e61df-05e2-4bde-a48f-0c250ecc91ed" />














