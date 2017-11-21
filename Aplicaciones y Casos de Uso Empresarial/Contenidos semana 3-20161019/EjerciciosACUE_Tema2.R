
x<-1:1000
y<-sapply(1:length(x), function(i) log(x[i]) )

smoothingSpline = smooth.spline(x, y, spar=0.35)
plot(x,y)
lines(smoothingSpline)

