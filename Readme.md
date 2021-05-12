# Ktor Webserver Docker Container (for Raspberry Pi 4)

Have you ever wanted to build a local web server using Kotlin, and run it in Docker on your Raspberry Pi? Then this might be for you (Of course you can run your container on other machines too). This should enable you to quickly deploy a base application to your Pi without searching the web for all the issues why it's not working yet :-)

### (Warning: This readme and "easyfication" of setting up are still a work in progress, so be aware: Everything works, but the setup process is not as smooth as desired yet. You might have to get your hands dirty here and there)

## Setup

1. Clone this repository into a convenient location on your device
2. Navigate into the cloned repository's directory
3. If you're **not** using this on a Raspberry Pi 4 (or another armv7 machine), open the `Dockerfile` and change the used JDK image in the FROM step to the appropriate one
3. Run `./bin/setup.sh` to install and setup **Docker** and **Docker Compose** (If you want a different user than **pi** to be your Docker user, change it in the script first)
4. Restart the pi: `./sudo reboot now`
5. Navigate into the repository's directory again
6. Make sure **libseccomp 2.4.2*** or higher is installed on your machine. If that's not the case, download it [here](https://packages.debian.org/sid/armhf/libseccomp2/download) and install it manually
7. Change the ip address the container should expose in your `Dockerfile` to something fitting to your network.
6. Start docker: `docker-compose up`
7. Check if your container is running: `docker ps`
8. See the **Hello, World** message by navigating to `http://[your-container's ip address]:8080`
9. Open the `/application` directory in your favourite IDE and start building your Ktor server on top of the example
