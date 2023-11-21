# This repo contains the code underlying a docker container for querying the lipdverse

## Use

create a local directory with a queryParams.json file and an empty directory named 'output'
alter the queryParams.json file to suit your needs
run the following, replacing '~/query-container/' with the appropriate local path: docker run -it --rm -v ~/query-container/output://output -v ~/query-container/queryParams.json://queryParams.json davidedge/lipd_webapps:queryContainer
the resulting lipd file will be stored in .rds format within the '/output' directory
