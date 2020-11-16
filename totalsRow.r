    df <- data.frame(0=c('a','b','c','d'),
                 a=c(200,200,200,200),
                 b=c(20,20,20,20),
                 c=c(10,10,10,10),
                 d=c(100,100,100,100),
                 e=c(2,2,2,2),
                 f=c(50,50,50,50),
                 g=c(200,200,200,200),
                 h=c(20,20,20,20),
                 i=c(10,10,10,10),
                 j=c(200,200,200,200),
                 k=c(20,20,20,20),
                 l=c(10,10,10,10),
                 m=c(100,100,100,100),
                 n=c(2,2,2,2),
                 o=c(50,50,50,50),
                 stringsAsFactors=FALSE)


totals_list <- data.frame(stringsAsFactors=FALSE)

i <- 2
while (i + 2 <= ncol(df)) {
  x <- colSums(df[i], na.rm = TRUE)
  i <- i + 1
  y <- colSums(df[i], na.rm = TRUE)
  i <- i + 1
  z <- round(y/x, 2)
  i <- i + 1
  totals_list <- c(totals_list, x, y, z)
}

totals_list <- c("Totals", totals_list)
totals_df <- as.data.frame(totals_list, stringsAsFactors=FALSE)
totals_df <- setNames(totals_df, names(df))
final <- rbind(df, totals_df)
print(final)


# This can also be written like this.

totals <- colSums(df[-1])

every_third_index <- which(seq_along(totals) %% 3 == 0)
totals[every_third_index] <- totals[every_third_index - 2] / totals[every_third_index - 1]

rbind(df, c("Totals", totals))