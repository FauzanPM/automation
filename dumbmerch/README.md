# FINAL TASK
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

> <img width="1884" height="491" alt="image" src="https://github.com/user-attachments/assets/2c695791-a83d-4141-80a8-36b2e99d7c66" />
> This file is used to define hosts and their grouping in Ansible, such as appserver, monitoring, and gateway. Each group contains the target server IP, as well as global variables to determine the SSH user and Python interpreter used during playbook execution.

> <img width="1885" height="487" alt="image" src="https://github.com/user-attachments/assets/6e8ebfed-ee12-4445-b62f-1c947552ad14" />
> This configuration file is used to set Ansible's default behavior, such as the inventory location, SSH key used, remote user, and disabling host key checking. In addition, this configuration also sets SSH connection optimization and privilege escalation using sudo.

> <img width="1885" height="525" alt="image" src="https://github.com/user-attachments/assets/9cd598d9-20d2-48b6-8553-7a0e3b9657cf" />
> This playbook serves to create devops users across all servers, grant sudo access rights, and add SSH public keys so that users can log in via SSH. Users are created with a home directory, bash shell, SHA-256 hashed encrypted password, and are added to the sudo group.


## 2. Repository

> <img width="1887" height="960" alt="image" src="https://github.com/user-attachments/assets/974b3d0d-82af-4946-8e56-dbade12d4540" />
> <img width="1884" height="864" alt="image" src="https://github.com/user-attachments/assets/02f6b06c-e8f6-4f53-a511-406cbb37a1bf" />
> <img width="1871" height="268" alt="image" src="https://github.com/user-attachments/assets/bc8114eb-4534-47bd-bcd8-40a270b452b5" />
> <img width="1919" height="647" alt="image" src="https://github.com/user-attachments/assets/26f0fb76-dac4-45ab-85cd-525c56ee3c01" />
> This playbook is used to set up the initial Git configuration on the application server. Its functions include creating an SSH directory, adding GitHub to known_hosts, setting up Git identity (username & email), cloning the frontend and backend template repositories, changing the remote to a private repository, and creating and pushing staging and production branches to GitHub.

> <img width="1885" height="952" alt="image" src="https://github.com/user-attachments/assets/cb7097b0-f2be-4d22-bef4-e987c4310e2c" />
> <img width="1877" height="645" alt="image" src="https://github.com/user-attachments/assets/fdbc7ade-ccac-4f7e-9028-489353c32836" />
> This playbook is used to push local code changes to the GitHub repository. The script will automatically commit and then push to the staging and production branches for the frontend and backend, thereby simplifying the code synchronization process between environments.

> <img width="1881" height="966" alt="image" src="https://github.com/user-attachments/assets/447a43f9-7d96-4c63-9f49-d1a281a88ea2" />
> <img width="1882" height="630" alt="image" src="https://github.com/user-attachments/assets/cd0bf2a8-9ca8-4c7b-ab66-486f9f51dd70" />
> This playbook is used to update application code by pulling the frontend and backend repositories from GitHub based on a specific branch (default: staging). It is used on deployment servers to ensure that the running code always follows the latest version of the repository.


## 3. setup configuration

> <img width="1881" height="859" alt="image" src="https://github.com/user-attachments/assets/a228c90a-1315-457f-9e4a-209bfb1b09c5" />
> <img width="1887" height="811" alt="image" src="https://github.com/user-attachments/assets/b0a6d0b8-8079-4994-8146-2f6d508d173a" />
> <img width="1879" height="483" alt="image" src="https://github.com/user-attachments/assets/9738abb6-febf-4e65-8fc1-d099bb96379a" />
> Playbook ini digunakan untuk menyiapkan Docker Private Registry pada server monitoring dengan sistem autentikasi menggunakan htpasswd (bcrypt). Registry dijalankan sebagai container Docker dengan data dan konfigurasi autentikasi yang bersifat persisten. Setelah registry aktif, dilakukan pengecekan endpoint untuk memastikan layanan berjalan dan akses tanpa autentikasi ditolak. 

> <img width="1884" height="976" alt="image" src="https://github.com/user-attachments/assets/2db99869-9c3f-43fc-a7fd-800df3dc9525" />
> <img width="1889" height="891" alt="image" src="https://github.com/user-attachments/assets/0d7555e9-e2e9-4da3-8789-101af77ac49d" />
> This playbook is used to install and set up Docker Engine on all hosts. The process includes updating the system repository, installing supporting dependencies, adding the GPG key and official Docker repository, installing Docker Engine and its components, ensuring that the Docker service runs automatically, and adding users to the docker group so that they can run Docker without root access.

> <img width="1884" height="970" alt="image" src="https://github.com/user-attachments/assets/290beb1f-3fee-42b7-ab17-7f56ac59550b" />
> <img width="1885" height="89" alt="image" src="https://github.com/user-attachments/assets/3d7fbc13-edfb-404b-874d-8bbe54d72e09" />
> This playbook is used to run Jenkins using Docker on a monitoring server. The process includes creating a Jenkins data storage directory, running the Jenkins container with the necessary ports and volumes, waiting until the initial password file is available, and displaying the Jenkins access URL and initial admin password for the initial setup process.

> <img width="1880" height="967" alt="image" src="https://github.com/user-attachments/assets/3e7122c2-72f2-4f64-bb90-3d7cd89fa2a2" />
> <img width="1892" height="806" alt="image" src="https://github.com/user-attachments/assets/e8d57963-fe41-4938-a3a1-15072fec322a" />
> <img width="1886" height="901" alt="image" src="https://github.com/user-attachments/assets/8b4b696f-fc80-4ad2-b5d6-065728ade457" />
> <img width="1894" height="387" alt="image" src="https://github.com/user-attachments/assets/9d814425-30d6-4d62-90b8-d4261fc1d034" />
> This playbook is used to deploy SonarQube along with a PostgreSQL database using Docker. The process includes creating directories and setting permissions for SonarQube data, adjusting the vm.max_map_count kernel parameter for Elasticsearch, running the PostgreSQL container as a database, and running the SonarQube container connected via a dedicated Docker network.

## 3. CI/CD

> <img width="1636" height="312" alt="image" src="https://github.com/user-attachments/assets/7f0763b8-36e4-47a1-9741-cb84195685ce" />
> adding credentials to log in to the server, git repository, and connecting to SonarQube

> <img width="1296" height="741" alt="image" src="https://github.com/user-attachments/assets/0d012001-31db-4e87-89f4-5ab54d20c6f7" />
> Using a Jenkins multibranch pipeline and performing Branch Sources to Git with an SSH repository and SSH Git credentials, then scanning all branches.

> <img width="1514" height="178" alt="image" src="https://github.com/user-attachments/assets/f9b72263-b98c-4b3b-b61a-01bfdbe27a28" />
> Then branches will appear as above in the form of staging and production according to the git repository.

> <img width="1194" height="533" alt="image" src="https://github.com/user-attachments/assets/85a5098f-f323-456f-b10d-a978d3f9773d" />
> Webhooks are used to trigger actions every time a push is made to a git repository by adding the Jenkins URL to the repository webhook.

> <img width="1463" height="115" alt="image" src="https://github.com/user-attachments/assets/7758b923-7e6a-4195-88f8-c3769b19e431" />
> To connect Jenkins with SonarQube, you need a token from SonarQube that has been entered into the Jenkins credentials.

> <img width="1660" height="786" alt="image" src="https://github.com/user-attachments/assets/c13ec0da-74ef-4805-8400-d08d0a821da5" />
> adding the SonarQube URL to the Jenkins system

> <img width="1612" height="635" alt="image" src="https://github.com/user-attachments/assets/642ecdd1-77d8-4bad-93a9-02bd6b2b0371" />
> adding SonarQube and Maven tools in Jenkins 

> <img width="1436" height="497" alt="image" src="https://github.com/user-attachments/assets/4a867edf-f5e3-4fc0-a498-13e1b0b6d46c" />
> After running Jenkins, the project will automatically appear in SonarQube.

## 4. Deploy

<img width="1645" height="137" alt="image" src="https://github.com/user-attachments/assets/1aff16c3-b8f5-48cb-ae71-97bff997f871" />

### Frontend

> <img width="1886" height="520" alt="image" src="https://github.com/user-attachments/assets/74eb9b2e-7f46-40bd-8c9c-646ad336e38d" />
> This Dockerfile is used to build the application frontend image using a multi-stage build approach. The first stage builds the React/Node.js v16 application, while the second stage uses Nginx to serve the build results as a static web, making the image lighter and ready to run in a production environment.

> <img width="1790" height="62" alt="image" src="https://github.com/user-attachments/assets/ce4b794f-404e-425d-a9ad-411414b8d601" />
> the result of images that have been created based on the previous Dockerfile

> <img width="1882" height="86" alt="image" src="https://github.com/user-attachments/assets/6443d35f-cc68-4eed-bb8b-7b53ebf3bcad" />
> add baseurl to connect frontend with backend

> <img width="1882" height="960" alt="image" src="https://github.com/user-attachments/assets/6557d203-1bbe-4e6b-9520-20ab9c42cd41" />
> <img width="1885" height="896" alt="image" src="https://github.com/user-attachments/assets/0d588d5b-b7be-46dc-9120-d6591ee1d84e" />
> <img width="1892" height="860" alt="image" src="https://github.com/user-attachments/assets/998972e3-cde8-420c-9e47-363d8f038ddc" />
> <img width="1881" height="399" alt="image" src="https://github.com/user-attachments/assets/8ce65705-60b2-4457-99c1-998950c314f3" />
> This file defines a Jenkins-based frontend CI/CD pipeline. The pipeline will run automatically when there is a push to GitHub, perform code quality analysis using SonarQube, pull the latest code according to the branch, build a Docker image, stop old containers, run new containers based on the branch (staging/production), and perform health checks with wget spider to ensure the application is running properly.

> <img width="1793" height="344" alt="image" src="https://github.com/user-attachments/assets/7c16cf32-d863-4625-9274-44132f74a4e7" />
> results from checking using wget spider 

> <img width="1919" height="1056" alt="image" src="https://github.com/user-attachments/assets/bb81ec23-ecdf-4da5-bec2-47ab68b84d24" />
> results after successfully deploying the frontend

### Backend

> <img width="1882" height="564" alt="image" src="https://github.com/user-attachments/assets/b7bfd5bc-837c-4a72-84d5-8a5b1782a5c4" />
> This file is used to build a Golang v1.16-based backend image using a multi-stage build. The builder stage compiles the Go application into a static binary, then the runtime stage runs that binary on a lightweight Alpine image, including the .env configuration file, so that the container is ready to run with a minimal image size.

> <img width="1714" height="57" alt="image" src="https://github.com/user-attachments/assets/0777ca67-b6b0-48c6-83ac-8e4baa77d72b" />
> he result of images that have been created based on the previous Dockerfile

> <img width="1880" height="955" alt="image" src="https://github.com/user-attachments/assets/5302db69-4fec-4115-afcf-710cfe70f454" />
> <img width="1882" height="900" alt="image" src="https://github.com/user-attachments/assets/3f127120-8945-4a7b-82b4-6d5380d3bf26" />
> <img width="1887" height="859" alt="image" src="https://github.com/user-attachments/assets/51657e46-a21d-4b6b-9875-a84057130922" />
> <img width="1889" height="569" alt="image" src="https://github.com/user-attachments/assets/851f2166-c176-4585-a678-6619814ed494" />
> This file defines a Jenkins-based CI/CD backend pipeline. The pipeline will automatically run when there is a push to GitHub, perform code quality analysis using SonarQube, pull the latest code according to the branch, build the backend Docker image, stop the old container, run the new container with the appropriate port and network configuration, and perform a health check to ensure that the backend service is running normally.

> <img width="1886" height="411" alt="image" src="https://github.com/user-attachments/assets/64348113-b682-436d-9087-6264df4429f1" />
> File ini digunakan sebagai konfigurasi environment backend aplikasi. Isinya mencakup pengaturan keamanan (secret key), endpoint file upload, kredensial payment gateway, konfigurasi email sistem, serta parameter koneksi database PostgreSQL dan port aplikasi yang digunakan oleh backend.

> <img width="1588" height="438" alt="image" src="https://github.com/user-attachments/assets/0d2b5135-9ead-4e08-a365-514bdabf5742" />
> Then, we checked the structure and content of the DumbMerch application database running in the PostgreSQL container. The process was done by entering the database container, viewing the list of available tables, and displaying the data in the users table to ensure that the database schema and initial application data had been created and were running properly.

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
> <img width="1885" height="582" alt="image" src="https://github.com/user-attachments/assets/6b806d19-9881-4dfd-b1b1-8bd25a91c7b6" />
> <img width="1887" height="965" alt="image" src="https://github.com/user-attachments/assets/f86f1e1b-2353-4380-ae1e-3b37f10bbe74" />
> This playbook is used to configure SSL on Nginx reverse proxy using Let's Encrypt wildcard certificates. This playbook creates HTTPS configurations for various services (frontend & backend production/staging, Jenkins, Docker registry, Node Exporter, Grafana, and Prometheus), redirects HTTP to HTTPS, applies the same SSL certificate, tests the Nginx configuration, and reloads the Nginx service to activate the changes.

> <img width="1919" height="774" alt="image" src="https://github.com/user-attachments/assets/7cad8869-ec2e-4624-bcca-a1dd4e459475" />
> <img width="1919" height="928" alt="image" src="https://github.com/user-attachments/assets/29c1948a-0118-4b30-8677-e0776f865b64" />
> <img width="1919" height="843" alt="image" src="https://github.com/user-attachments/assets/fa311ed7-afd1-4e52-a3ba-21338c916183" />
> <img width="1919" height="922" alt="image" src="https://github.com/user-attachments/assets/9732f8a9-dd40-435c-ab50-97dde5e37ab1" />
> <img width="1919" height="874" alt="image" src="https://github.com/user-attachments/assets/50a0c23a-57fa-4ced-b3b3-c94dc700487d" />
> <img width="1919" height="856" alt="image" src="https://github.com/user-attachments/assets/34256157-adb1-4f3c-a031-6f8f4cc97b14" />
> <img width="1919" height="744" alt="image" src="https://github.com/user-attachments/assets/4b556c2f-ec44-487a-a760-72bcc917483e" />
> <img width="1919" height="864" alt="image" src="https://github.com/user-attachments/assets/d61baaa5-e3d1-490b-848f-359df79a97c4" />
> <img width="1919" height="669" alt="image" src="https://github.com/user-attachments/assets/8dc84535-4327-434d-9072-63de4da05dfe" />
> This playbook is used to configure SSL/TLS on Nginx reverse proxy on the gateway server using Let's Encrypt wildcard certificates. All application services, CI/CD, and monitoring are accessed via HTTPS with an automatic redirect mechanism from HTTP to HTTPS.
> 
> This playbook creates reverse proxy configurations for frontend and backend in production and staging environments, as well as supporting services such as Jenkins, Docker Registry, Grafana, Prometheus, and Node Exporter. Each domain is directed to the appropriate service based on the internal port of each container or application.
> 
> In addition to SSL implementation, this configuration also forwards standard headers (Host, X-Real-IP, X-Forwarded-*) so that the backend application continues to receive the original request information from the client. For Prometheus, basic authentication is implemented to restrict access to the monitoring dashboard.
> 
> Once all configurations are complete, the playbook will validate the Nginx configuration and reload the Nginx service without downtime so that all changes take effect immediately.




























# Section Heading 

Some body text of this section.

<a name="my-custom-anchor-point"></a>
Some text I want to provide a direct link to, but which doesn't have its own heading.

(… more content…)

[A link to that custom anchor](#my-custom-anchor-point)
