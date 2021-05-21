# 중재 메타분석: R을 활용한 적용과 실제
# https://doi.org/10.4178/epih.e2019008

library(meta)

#####################################
#연속형(continuous data) 예제자료
#####################################
data_con <- read.csv("shim_con.csv", header=TRUE)
show(data_con)
data_con <- data_con[,c(1:7,13)]
show(data_con)
#종합 효과크기
ma_con <- metacont(n1, m1, s1, n2, m2, s2, sm="SMD", method.smd="Hedges", study,
                    byvar=g ,data=data_con)
ma_con <- metacont(n1, m1, s1, n2, m2, s2, sm="SMD", method.smd="Hedges", study,
                    data=data_con)
print(ma_con , digits=3)

#Forest plot(숲 그림)
forest(ma_con, comb.fixed=TRUE, comb.random=TRUE,digits=3,
       rightcols=c("effect", "ci"))
forest(ma_con, comb.fixed=TRUE, comb.random=TRUE,digits=3)

#이질성 원인파악 : meta-regression
metareg(ma_con,g, method.tau="REML", digits=3)

bubble(metareg(ma_con, g, method.tau="REML"))
       
# 시각적확인: funnel plot
funnel(ma_con, comb.fixed=TRUE, comb.random=FALSE)

#출판편향 통계적 검정

ma_con <- metacont(n1, m1, s1, n2, m2, s2, sm="SMD", method.smd="Hedges", 
                   study,data=data_con)

#Egger’s linear regression method test
metabias(ma_con, method.bias="linreg")
#Begg and Mazumdar’s rank correlation test
metabias(ma_con, method.bias="rank")

#####################################
#이분형(binary data) 예제자료
#####################################

data_bin <- read.csv("hwang_bin.csv", header=TRUE)

#종합 효과크기
ma_bin <- metabin(tp,tp+fp,fn,fn+tn, sm="OR", method ="Inverse", study, byvar=g, 
                  data=data_bin)
print(ma_bin, digits=3)

forest(ma_bin, comb.fixed=TRUE, comb.random=TRUE,digits=3,rightcols=c("effect", "ci"))

#이질성 원인파악 : meta-regression
metareg(ma_bin, g, method.tau="REML", digits=3)

#출판편향 확인 (publication bias)
funnel(ma_bin, comb.fixed=TRUE, comb.random=FALSE)

#####################################
#자료유형 상관없이 메타분석
#####################################

#데이터 코딩 및 불러오기
data_con <- read.csv("shim_con.csv", header=TRUE)
data_bin <- read.csv("hwang_bin.csv", header=TRUE)

#종합 효과크기
ma_con_es <- metagen(cohen_d, cohen_se, sm="Cohen(SMD)", study, byvar=g, 
                     data=data_con)
print(ma_con_es, digits=3)
forest(ma_con_es, comb.fixed=TRUE, comb.random=TRUE, digits=3, rightcols=c("effect", 
                                                                            "ci"))
#이분형 자료 효과크기와 표준오차 계산
ma_bin_es <- metagen(lnor, orse, sm="OR", study, data=data_bin)
print(ma_bin_es, digits=3)
forest(ma_bin_es, comb.fixed=TRUE, comb.random=TRUE, digits=3, rightcols=c("effect", 
                                                                            "ci"))







        