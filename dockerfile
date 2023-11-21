# Base image davidedge/lipdwebapps:lipdBase
FROM davidedge/lipd_webapps:lipdbasev0

## copy files
COPY queryByParams.R queryByParams.R
COPY queryParams.json queryParams.json

## run Recon
CMD Rscript /queryByParams.R

COPY output/ output/

#run from query-container directory (must include an 'output' folder)
#docker run -it --rm -v ~/queryByParams/output:/output davidedge/lipd_webapps:queryContainer
