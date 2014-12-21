certequiv <- function(lb=0,ub=10000,ce=5000) {
        
        # This function designates a lower bound (lb) and
        # upper bound (ub) and uses these to fit an exponential
        # utility function based on a certainty equivalent (ce)
        # submitted by the subject or decision maker.  A concave
        # utility function denotes a risk averse decision maker,
        # while a convex utility function denotes a decision maker
        # who is risk seeking.  A linear or near-linear utilty function
        # denotes a decision maker who is risk neutral.  A modern
        # reference explaining these concepts is French, Maule, and
        # Papamichail. 2009.  Decision Behaviour, Analysis, and Support.
        # Cambridge University Press.
        
        c <- 0.0002 # initialize c
        x <- seq(lb,ub,by=500) # set vector of monetary values
        
        if (ce != 0.5*(ub-lb))  { 
                
                # non-linear utility function
                f <- function (c,lb,ub,ce) {
                        
                        exp(lb*c)/(exp(lb*c)-exp(ub*c))-
                                1/(exp(lb*c)-exp(ub*c))*exp(ce*c)-0.5
                        
                }
                
                c <- uniroot(f, c(-0.005,0.005),lb,ub,ce,tol=1e-08)$root
                a <- exp(lb*c)/(exp(lb*c)-exp(ub*c))
                b <- -1/(exp(lb*c)-exp(ub*c))
                
                y <- a+b*exp(c*x)
                
        }  else  { 
                
                # linear utility function
                m <- 1/ub
                y <- m*x
        }
        
        plot(x,y,type="l",ylab="Utility",xlab="Money") # utility function
}
