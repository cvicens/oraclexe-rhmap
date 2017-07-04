# RHMAP Docker image

## Clone this repo

```
$ git clone https://github.com/cvicens/oraclexe-rhmap
```

## Create a directory to run your projects locally
You'll mount a volume when you run the docker image and this 'projects' directory will be used in the container to allow persistence.

```
$ mkdir projects
```

## Set up environment to name the image properly

```
export PROJECT_ID="rhmap-docker"
export IMAGE_NAME="oraclexe-11g-node-4.4"
export IMAGE_VERSION="v1.0"
export CONTAINER_NAME="oraclexe-rhmap-docker-dev"
```

## Build the image

```
docker build -t $PROJECT_ID/$IMAGE_NAME:$IMAGE_VERSION .
```

## Now let's run the image

As you can see below we're exposing port 8001 but you have to export the ports you need.

```
docker run -p=8001:8001 -p=40022:22 -p=41521:1521 -it --rm -v $(pwd)/projects:/usr/projects -e ORACLE_ALLOW_REMOTE=true --name $CONTAINER_NAME $PROJECT_ID/$IMAGE_NAME:$IMAGE_VERSION /bin/bash
```

## Example: running a cloud app and a service locally
Running locally a Cloud App that in its turn call a service also running locally.

### Run the container exposing 8001

```
docker run -p=8001:8001 -it --rm -v $(pwd)/projects:/usr/projects --name $CONTAINER_NAME $PROJECT_ID/$IMAGE_NAME:$IMAGE_VERSION /bin/bash
```

### Running the service in background

Clone both repos and run ``npm install`` (Cloud App and Service) then change dir to the service folder and run.

```
$ nohup grunt serve &
```

Now move to the cloud app folder and run

```
$ grunt serve:local
```

Finally use Postman, for instance, to call you cloud app running on port 8001 on your localhost.

### Stop all and exit
Type Ctrl+C and exit

## Oracle HR schema scripts

```
select * from EMPLOYEES;
select * from DEPARTMENTS;
select * from JOBS;
select * from JOB_HISTORY;

EMPLOYEE_ID START_DATE                  END_DATE                    JOB_ID  DEPARTMENT_ID
102	        TO_DATE('2006-07-25', 'yyyy-MM-dd')	TO_DATE('2007-07-24', 'yyyy-MM-dd')	SA_REP 60

(  p_emp_id          job_history.employee_id%type
   , p_start_date      job_history.start_date%type
   , p_end_date        job_history.end_date%type
   , p_job_id          job_history.job_id%type
   , p_department_id   job_history.department_id%type
   )

```