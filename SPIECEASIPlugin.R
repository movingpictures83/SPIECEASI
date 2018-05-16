library(SpiecEasi)

#p_value <- 0.01;
#libs <- c("Hmisc");
#lapply(libs, require, character.only=T);

input <- function(inputfile) {
  pc <<- read.csv(inputfile, header = TRUE);
}


run <- function() {
  cn <<- colnames(pc);
  cn <<- cn[2:length(cn)];
  pc <<- pc[,-1];
  #pc <<- apply(pc, 1, as.numeric);
  #pc <<- t(pc);
  # Used default parameters; you can change as necessary
  iscorr <<- spiec.easi(pc, method='mb', lambda.min.ratio=0.01, nlambda=20, icov.select.params=list(rep.num=100))
  correlations <<- symBeta(getOptBeta(iscorr), mode='maxabs')  
  #correlations <<- rcorr(pc[,], type=c("pearson"));
  pc <<- as.matrix(correlations);
  #pc[is.na(pc)] <<- 0;
  #empty <- c("");
  #pc[which(correlations$P>p_value)] <<- 0;
}

output <- function(outputfile) {
   write.table(pc, file=outputfile, sep=",", append=FALSE, row.names=unlist(cn), col.names=unlist(cn), na="");
}


