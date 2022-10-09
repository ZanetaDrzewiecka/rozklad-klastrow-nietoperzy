LL<-c() 

for (i in 1:N) {
  MATRIX<-matrix(data = 0, nrow = K, ncol = M) 
  for (j in 1:NP) {
    przytulanie<-sample(c('tak','nie'),1,prob=c(pr,1-pr))
    if (all(MATRIX==0) || przytulanie=='nie') {
      poz<-which(MATRIX==0, arr.ind=TRUE)
      poz1<-sample(seq(nrow(poz)),1)
      MATRIX[poz[poz1,1], poz[poz1,2]]<-1
      if (poz[poz1,2] < M) {
        MATRIX[poz[poz1,1], poz[poz1,2]+1]<-2 #kolumna po
      }
      if (poz[poz1,1] < K) {
        MATRIX[poz[poz1,1]+1, poz[poz1,2]]<-2 #wiersz po
      }
      MATRIX[poz[poz1,1], poz[poz1,2]-1]<-2 #kolumna przed
      MATRIX[poz[poz1,1]-1, poz[poz1,2]]<-2 #wiersz przed
    } else
      if (all(MATRIX==0) || przytulanie=='tak') {
        poz<-which(MATRIX==2, arr.ind=TRUE)
        poz1<-sample(seq(nrow(poz)),1)
        MATRIX[poz[poz1,1], poz[poz1,2]]<-1
        if (poz[poz1,2] < M) {
          if (MATRIX[poz[poz1,1], poz[poz1,2]+1]!=1) {
            MATRIX[poz[poz1,1], poz[poz1,2]+1]<-2 #kolumna po 
          }
        }
        if (poz[poz1,1] < K) {
          if (MATRIX[poz[poz1,1]+1, poz[poz1,2]]!=1) {
            MATRIX[poz[poz1,1]+1, poz[poz1,2]]<-2 #wiersz po
          }
        }
        if (poz[poz1,2] > 1) {
          if (MATRIX[poz[poz1,1], poz[poz1,2]-1]!=1){
            MATRIX[poz[poz1,1], poz[poz1,2]-1]<-2 #kolumna przed
          }
        }
        if (poz[poz1,1] > 1) {
          if (MATRIX[poz[poz1,1]-1, poz[poz1,2]]!=1){
            MATRIX[poz[poz1,1]-1, poz[poz1,2]]<-2 #wiersz przed
          }
        }
      }
    j=j+1;
  }
  
  MATRIX[MATRIX==2]<-0; #zamiana 5 na 0
  
  klasterLicz<-function(MATRIX) {
    m<-clump(raster(MATRIX), direc=4)
    dane<-tibble(cluster=m@data@values)
    rez<-dane %>% filter(!is.na(cluster)) %>% group_by(cluster) %>% tally()
    return(rez$n)
  } #funkcja zliczajaca klastry
  
  LL<-c(LL,klasterLicz(MATRIX)) #zapis klastrow do listy
  
  i=i+1;
}


