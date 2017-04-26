from numpy import *
import matplotlib.pyplot as plt

fig=plt.figure()
ax=fig.add_subplot(1,1,1)
M=16
k=1/16
def f(t,y): return ((y/M)*( M - y))

dt=.1
for tp in linspace(0,3,13):
   for yp in linspace(-8,24,11):
      ax.plot([tp,tp],[yp,yp],'bo',ms=4)
      m=f(tp,yp)
      ax.plot([tp-dt,tp+dt],[yp-m*dt,yp+m*dt],'b')
ax.set_xlabel('t')
ax.set_ylabel('y')

plt.title("Slope Field for y'=y-y^2/16")

#plt.savefig('306s17p1sf.pdf')

#plt.show()

#fig=plt.figure()
#ax=fig.add_subplot(1,1,1)

#def f(t,y): return (y/16)*(16-y)

deltat=.1
t0=0.
tend=3.
nsteps=int((tend-t0)/deltat)
y0=8.
yn=y0
tn=t0
ax.plot([tn],[yn],'bo')

for n in range(nsteps):
   m=f(tn,yn)
   yn1=yn+m*deltat
   tn1=tn+deltat
#   print "n=",n," tn=",tn," yn=",yn," tn1=",tn1," yn1=",yn1
   ax.plot([tn,tn1],[yn,yn1],'b-')
   yn=yn1
   tn=tn1

ax.set_xlabel('t')
ax.set_ylabel('y')

plt.title("Euler's Method for y'=0.4y")

#plt.savefig('306s17p1_em.pdf')
#plt.show()
M=16.
def Fty(t,y): return ((y/(y-M))*exp(-t)) 

t=linspace(0.,3.,13)
y=linspace(-8.,24.,11)
T, Y = meshgrid(t, y)
Z=Fty(T,Y)

#fig=plt.figure()
#ax=fig.add_subplot(1,1,1)

CS = plt.contour(T, Y, Z, 9,
                 colors='k',  # contours blac'k',
#                               negative contours dashed by default
                 )
plt.clabel(CS, fontsize=9, inline=1)
plt.title('Logistic Equation S.F, E.M and solution curves by Andy Perez')

plt.savefig('myp1.pdf')

plt.show()



