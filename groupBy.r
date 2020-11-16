
setwd("/home/rstudio/projects/")

packages <- c("odbc","dplyr","readr","shinyjs","shiny","shinyWidgets")
lapply(packages, require, character.only = TRUE)

Micro <- read_csv("/home/rstudio/projects/extract", progress = show_progress(),
		trim_ws = TRUE, na = c("","NA"), col_types = cols(.default = co_character()))


# for every room, consider all class, for every class consider every freq
# for every senario, create a df
# generate a box for every df


micro <- data.frame(build=c('a','a','a','a','a','a','a'),
			room=c(1,1,2,2,1,1,2,2),
			class=c(1,2,1,2,1,2,1,2),
			freq=c(1,2,1,2,1,2,1,2),
			measure=c(50,50,50,50,50,50,50,50))

boxdf <- micro %>%
	group_by(build, room, class, freq) %>%
	summarize()

# set veriables
for (i in 1:nrow(boxdf)){
	build <- as.character(boxdf[i,"build"])
	room <- as.character(boxdf[i,"room"])
	class <- as.character(boxdf[i,"class"])
	freq <- as.character(boxdf[i,"freq"])
}