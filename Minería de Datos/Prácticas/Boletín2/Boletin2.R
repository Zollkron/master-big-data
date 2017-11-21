ejemplo1 <- read.csv("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/Boletín2/ejemplo1.dat")
shapiro.test(ejemplo1$nnet-ejemplo1$C50)
library(nortest)
lillie.test(ejemplo1$nnet-ejemplo1$C50)

datos <- stack(list(nnet=ejemplo1$nnet,C50=ejemplo1$C50))
library(car)
leveneTest(values ~ ind, data = datos)
bartlett.test(values ~ ind, data = datos)

t.test(ejemplo1$nnet,ejemplo1$C50, paired = TRUE)
t.test(ejemplo1$nnet-ejemplo1$C50)

ejemplo2 <- read.csv("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/Boletín2/ejemplo2.dat")
shapiro.test(ejemplo2$SVM-ejemplo2$LDA)

matriz.conf <- read.csv("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/Boletín2/matrizConfEjemplo2.dat", header=TRUE, row.names = 1)
mcnemar.test(as.matrix(matriz.conf))
wilcox.test(ejemplo2$SVM,ejemplo2$LDA, paired = TRUE)

ejemplo3 <- read.csv("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/Boletín2/Ejemplo3.dat")
wilcox.test(ejemplo3$SVMLinear,ejemplo3$C50, paired = TRUE)

ejemplo4 <- read.csv("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/Boletín2/Ejemplo4.csv",row.names = 1)
df4.stack <- stack(ejemplo4)
df4.stack$DataSet <- as.factor(rep(row.names(ejemplo4), times = 3))
names(df4.stack) <- c("Accuracy","Method", "DataSet")
df4.stack
test <- tapply(df4.stack$Accuracy, df4.stack$Method,shapiro.test)
test

model.lm <- lm(as.matrix(ejemplo4) ~ 1)
library(car)
design <- factor(c("classA","classB","classC"))
options(contrasts=c("contr.sum", "contr.poly"))
aov <- Anova(model.lm, idata=data.frame(design), idesign=~design)
summary(aov, multivariate=F)

Aov.mod <- aov(Accuracy ~ Method + Error(DataSet),data=df4.stack)
summary(Aov.mod)
library(nlme)
Lme.mod <- lme(Accuracy ~ Method, random = ~1 | DataSet, data=df4.stack)
anova(Lme.mod)

library(multcomp)
tuk.lme <- glht(Lme.mod, linfct=mcp(Method="Tukey"))
summary(tuk.lme)

ejemplo5 <- read.csv("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/Boletín2/Ejemplo3TablaKappa.csv",row.names = 1)
df5.stack <- stack(ejemplo5)
df5.stack$DataSet <- as.factor(rep(row.names(ejemplo5), times = 3))
names(df5.stack) <- c("Kappa","Method", "DataSet")
test.norm <- tapply(df5.stack$Kappa, df5.stack$Method,shapiro.test)
test.norm

test.friedman <- friedman.test(Kappa ~ Method | DataSet, data = df5.stack )
test.friedman

library(PMCMR)
nemenyi.test <- posthoc.friedman.nemenyi.test(Kappa ~ Method | DataSet, data = df5.stack)
nemenyi.test

