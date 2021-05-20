#https://t-lab.tistory.com/6?category=611994

install.packages("RISmed")
library(RISmed)

res <- EUtilsSummary(query="pinkeye", db="pubmed", mindate=2000, maxdate=2015, retmax=500)

t <- ArticleTitle(EUtilsGet(res))

y <- YearPubmed(EUtilsGet(res))

r <- YearReceived(EUtilsGet(res))

auths <- Author(EUtilsGet(res))

abs <- AbstractText(EUtilsGet(res))



head(t, 3)  # 문헌 타이틀

head(auths, 3)  # 문헌 저자

abs[1]  # 문헌 초록

