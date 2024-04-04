# dockerized-blog-application

Need to Clone this Project 

``git clone https://github.com/mhbabu/dockerized-blog-application``




1. Install Docker and Docker Composer using below link
         -> https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04
         -> https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-22-04
2. Go to : assingment_docker folder  and run below command
          ->  sudo docker compose up --build -d 
          
3. Go to : new-assignment folder and run below command
          ->   ``sudo bin/deploy.sh local``
          ->   ``sudo docker exec -it assignment-admin-service bash``
          ->   ``composer instal``
          ->   ``chmod 777 -R storage/``
          ->   ``curl -sL https://deb.nodesource.com/setup_14.x | bash -
               apt-get install -y nodejs``
               ``curl -L https://www.npmjs.com/install.sh | sh``
               ``npm install``
               ``npm run dev``
          ->   ``php artisan migrate --seed``  
4.  Now Go to browser hit to below link : 
          -> http://127.0.0.1:7010/   
5.  Then login Using this credentials
          ->  admin@gmail.com
          ->  12345678                             
