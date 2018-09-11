# Cypress & Docker Template
This is the template for Cypress and Docker, it will run the test inside the container and generates a report using `mochawesome` library. You could easily grab the docker and cypress configuration along with automation shell for your own project.

## Run using Docker Shell
Please navigate to the root of the project where docker.sh file is located and run the following:
```bash
$: ./docker.sh up
```

This shell script will create, runs the shell from container. In order to down your docker container, please run the following command using docker.sh:
```bash
$: ./docker.sh down
```

### Cypress Commands
In order to run the sample test, after running `./docker.sh`, you will be given a command prompt, please type the following command:
```bash
$: npm run cypress
```
or you could run following if you wished to keep waiting for changes on save for test files:
```bash
$: npm run cypress-watch
```

It won't allow video capturing if you use Chrome browser instead of default Electron browser:
```bash
$: npm run cypress-chrome
```

### Contributors
If you wish to modify or contribute to this repository, please fork and create a pull request to the master branch.

#### Support
Please ask your questions using QA in the Git repository and if you noticed a bug please use issues to report.