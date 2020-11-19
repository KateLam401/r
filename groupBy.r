
setwd("path")

packages <- c("odbc","dplyr","readr","shinyjs","shiny","shinyWidgets")
lapply(packages, require, character.only = TRUE)

M <- read_csv("path", progress = show_progress(),
		trim_ws = TRUE, na = c("","NA"), col_types = cols(.default = co_character()))

m <- data.frame(build=c('a','a','a','a','a','a','a'),
			r=c(1,1,2,2,1,1,2,2),
			c=c(1,2,1,2,1,2,1,2),
			f=c(1,2,1,2,1,2,1,2),
			m=c(50,50,50,50,50,50,50,50))

boxdf <- m %>%
	group_by(b, r, c, f) %>%
	summarize()

for (i in 1:nrow(boxdf)){
	b <- as.character(boxdf[i,"build"])
	r <- as.character(boxdf[i,"room"])
	c <- as.character(boxdf[i,"class"])
	f <- as.character(boxdf[i,"freq"])
}
