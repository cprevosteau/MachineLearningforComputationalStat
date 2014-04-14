library(kernlab)

#t�l�chargement des donn�es

xtrain = read.table("C:/Users/Cl�ment/Desktop/ENSAE 3A/MLCB/xtrain.txt")
ytrain = read.table("C:/Users/Cl�ment/Desktop/ENSAE 3A/MLCB/ytrain.txt")
test = read.table("C:/Users/Cl�ment/Desktop/ENSAE 3A/MLCB/xtest.txt")

FinalTest=t(matrix(test))


matrix(xtrain)
data=as.matrix(xtrain[,2:185])
datat=t(data)

#creation d un set d'entra�nement et d'un set test
xtrain2=datat[1:150,]
ytrain2=ytrain[1:150,]

xtest=datat[151:184,]
ytest=ytrain[151:184,]

#essai sur les set d'entra�nements avec plusieurs noyaux
#lemeilleur sera choisi pour �tre entrain� sur la base compl�te et pr�voir sur les donn�es � traiter
#tanhdot,laplacedot,besseldot,anovadot

GaussianKernel <- ksvm(xtrain2,ytrain2,type="C-svc",kernel="rbfdot",kpar=list(sigma=1),scale=FALSE)
predict(PolyKernel,xtest)-ytest
plot(PolyKernel,data=xtest)

PolyKernel = ksvm(xtrain2,ytrain2,type="C-svc",kernel=polydot(degree=2))
predict(PolyKernel,xtest)-ytest
plot(PolyKernel,data=xtest)

LinearKernel <- ksvm(xtrain2,ytrain2,type="C-svc",kernel="vanilladot")
predict(svp,xtest)-ytest
plot(svp,data=xtest)

AnovaKernel = ksvm(xtrain2,ytrain2,type="C-svc",kernel="anovadot")
predict(PolyKernel,xtest)-ytest
plot(PolyKernel,data=xtest)

#Anova et Poly donnent les meilleurs r�sultats

BestKernel = ksvm(datat,ytrain,type="C-svc",kernel=polydot(degree=2))
predict(BestKernel,FinalTest)

 