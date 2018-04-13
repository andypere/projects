

from numpy import *
import matplotlib.pyplot as plt
fig = plt.figure(figsize=(8,8))
ax = fig.add_subplot(1,1,1)
def f(x,y): return y
m=1
c=0.2
k=4
Fslide=3
vbelt=0.5
def Fb(vrel):return -Fslide*sign(vbelt)
def g(x,y): return (Fb(y-vbelt)-(c*y)-(k*x))/m

#xmin=-1.1*pi; xmax=1.1*pi; nx=23 # mesh for direction field
#ymin=-1.1*pi; ymax=1.1*pi; ny=23
xmin=-1.2*pi; xmax=.6*pi; nx=23 # mesh for direction field
ymin=-1.5*pi; ymax=1.23*pi; ny=23

for xp in linspace(xmin,xmax,nx):
  for yp in linspace(ymin,ymax,ny):
     vx=f(xp,yp)
     vy=g(xp,yp)
     normv=sqrt(vx*vx+vy*vy)
     if(normv>0.001):
       vx=vx/normv
       vy=vy/normv
     ax.plot([xp-0.1*vx,xp+0.1*vx],[yp-0.1*vy,yp+0.1*vy],'b-')
     ax.plot(xp+0.1*vx,yp+0.1*vy,'bo',ms=3)

ax.plot( 0., 0.,'ko',ms=6) # equilibria
#ax.plot( pi, 0.,'ko',ms=6)
#ax.plot(-pi, 0.,'ko',ms=6)

ax.set_xlabel('x'); ax.set_ylabel('y')

plt.title("Direction field and equilibria for x'=y,  y'=-4 sin(x)")
#plt.savefig("306s17p2_df.pdf")
#plt.show()

# Chapter 4: Systems of differential equations
#
# Euler's Method for x'=y, y'=x''=-4 sin(x)

#from numpy import *
#import matplotlib.pyplot as plt
#fig = plt.figure(figsize=(8,8))
#ax = fig.add_subplot(1,1,1)
#def f(x,y): return y
#def g(x,y): return -4.*sin(x)

t0=0. # initial conditions
x0=-1.1
y0=-1.6
tend=10. # ending value of t

for icase in range(3):
   if(icase==0): nsteps=100; tc='r' # trajectory color
   if(icase==1): nsteps=1000; tc='b'
   if(icase==2): nsteps=10000; tc='k'

   h=(tend-t0)/nsteps

   ax.plot([x0,x0],[y0,y0],tc,label='h={0:g}'.format(h)) # label for legend
   ax.plot(x0,y0,tc+'x',ms=8) # plot initial condition as an X

   tn=t0
   xn=x0
   yn=y0

   for n in range(nsteps): # loop for Euler's method
      tn1=tn+h
      xn1=xn+h*f(xn,yn)
      yn1=yn+h*g(xn,yn)
      ax.plot([xn,xn1],[yn,yn1],tc)
      tn=tn1
      xn=xn1
      yn=yn1
   ax.plot(xn1,yn1,tc+'o',ms=8) # approximate (x(tend),y(tend))

ax.set_xlabel('x'); ax.set_ylabel('y')
plt.legend()

plt.title("D.F and E.M for sliding mass system by Andy, Perez",fontsize=15)
plt.savefig("myp2.pdf")
plt.show()

