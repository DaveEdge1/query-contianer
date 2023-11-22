# This repo contains the code underlying a docker container for querying the lipdverse

## Use

* create a local directory with a queryParams.json file and an empty directory named 'output'  
* alter the queryParams.json file to suit your needs  
* run the following, replacing '~/query-container/' with the appropriate local path: docker run -it --rm -v ~/query-container/output://output -v ~/query-container/queryParams.json://queryParams.json davidedge/lipd_webapps:queryContainer  
* the resulting lipd file will be stored in .rds format within the '/output' directory  

## Progress and Plans

* This container will be used for Presto to allow querying across all reconstrucions
* the queryParams.json should be ammended to allow for selection of output file type
* need to create pathway to pickle file for python recons
* Presto use will require a yaml config file for creating the UI and a translation function from form output to container input (queryParams.json)

## Query to pickle pathway

query parameter "file.type" set to "Python"
queryContainer takes in queryParams.json and produces the directory '/output' with .lpd files based on query
lipdPickler takes in the folder (output directory from queryContainer) and spits out a pickle file (lipd.pkl)

wrap this all together in a node app that 
1. uses the Presto Form UI to alter the queryParams.json
2. launches the queryContainer to produce the lipd files as rds or pkl
3. if a python path is selected in the queryParams, launch the lipdPickler
4. launch the reconstruction algorithm, which will utilize the rds or pkl

Thoughts:
should the two containers go together?
sibling containers?
I think we could rebuild as a single container such that the output directory survives the transition from R to Python, then the .lpd files are destroyed after creation of the pkl, finally the output directory is exported by volume mount (json params in, rds/pkl out)
