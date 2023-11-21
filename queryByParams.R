print("Initiating environment...")

#remotes::install_github("nickmckay/lipdR", upgrade="never")
suppressWarnings(suppressPackageStartupMessages(library(lipdR))) #to read and interact with LiPD data
packageVersion("lipdR")

print("Script starting...")

print(getwd())

#get parameters
params <- jsonlite::fromJSON(paste(readLines("queryParams.json"), collapse=""))

#D <- readLipd("https://lipdverse.org/Temp12k/1_0_2/Temp12k1_0_2.zip")

print("Filtering data")
#update query table for filtering
queryTable <- lipdR:::newQueryTable()

#Use small area for example
#params$coord <- c(20,30,0,15)

#filter proxy data
qt <- queryLipdverse(  variable.name = params$variable.name,
		       archive.type = params$archive.type,
		       paleo.proxy = params$paleo.proxy,
		       paleo.units = params$paleo.units,
		       coord = params$coord,
		       age.min = params$age.min,
		       age.max = params$age.max,
		       pub.info = params$pub.info,
		       country = params$country,
		       continent = params$continent,
		       ocean = params$ocean,
		       seasonality = params$seasonality,
		       season.not = params$season.not,
		       interp.vars = params$interp.vars,
		       interp.details = params$interp.details,
		       compilation = params$compilation,
		       verbose = FALSE,
		       skip.update = TRUE)


URLs <- convert_dsid_to_path(qt$datasetId)
D <- readLipd(URLs)

saveRDS(D, "output/lipd.rds")

print("LiPD download complete!")
