library(SpiecEasi)

input <- function(inputfile) {
  pc <<- read.csv(inputfile, header = TRUE);
}


run <- function() {
  cn <<- colnames(pc);
  cn <<- cn[2:length(cn)];
  pc <<- pc[,-1];
 pc <<- apply(pc, 1, as.numeric);
 pc <<- t(pc); 
iscorr <<- spiec.easi(pc, method='mb', lambda.min.ratio=1e-2,
                            nlambda=20, icov.select.params=list(rep.num=50))
correlations <<- symBeta(getOptBeta(iscorr), mode='maxabs')
  results <<- as.matrix(correlations);
}

output <- function(outputfile) {
   write.table(results, file=outputfile, sep=",", append=FALSE, row.names=unlist(cn), col.names=unlist(cn), na="");
}


