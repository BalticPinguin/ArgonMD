#!/usr/bin/python3
import numpy as np
#from scipy import stats as sc #for the maxwell-distribution
import random as rand

def seed_fcc(N,L,T):
   def fcc(r, l):
      parti=np.zeros((4,3))
      parti[0]=r
      #print(r[0], r[1], r[2])
      parti[1]=[r[0]+l/2,r[1]+l/2,r[2]]
      #print(r[0]+l/2,r[1]+l/2,r[2])
      parti[2]=[r[0]+l/2,r[1],r[2]+l/2]
      #print(r[0]+l/2,r[1],r[2]+l/2)
      parti[3]=[r[0],r[1]+l/2,r[2]+l/2]
      #print(r[0],r[1]+l/2,r[2]+l/2)
      return parti

   k=2.078616e-8
   N=256
   phasecoord=np.zeros((N,6))
   mass=np.ones(N) #can be changed to treat different particles
   #r=[L/16,L/16,L/16]
   a=L/4
   r=[0,0,0]
   for particle in range(0,N,4):
      phasecoord[particle:particle+4].T[:3]=fcc(r,a).T
      if r[0]<L-a:
         r[0]+=a
      elif r[1]<L-a:
         r[0]=0
         r[1]+=a
      else:
         r[0]=0
         r[1]=0
         r[2]+=a
      # boltzmann-distribution for velocities
      #phasecoord[particle][3:]=sc.maxwell.rvs(size=3)
      for coord in range(3,6):
         phasecoord[particle][coord]=(rand.random()-0.5)*4*np.sqrt(T*k)
   for particle in range(N):
      for i in range(3):
         phasecoord[particle][i]+=a/4
   return phasecoord,mass

def seed_small(N,L,T):
   def fcc(r, l):
      parti=np.zeros((4,3))
      parti[0]=r
      #print(r[0], r[1], r[2])
      parti[1]=[r[0]+l/2,r[1]+l/2,r[2]]
      #print(r[0]+l/2,r[1]+l/2,r[2])
      parti[2]=[r[0]+l/2,r[1],r[2]+l/2]
      #print(r[0]+l/2,r[1],r[2]+l/2)
      parti[3]=[r[0],r[1]+l/2,r[2]+l/2]
      #print(r[0],r[1]+l/2,r[2]+l/2)
      return parti

   k=2.078616e-8
   N=32
   phasecoord=np.zeros((N,6))
   mass=np.ones(N) #can be changed to treat different particles
   a=L/2
   r=[0,0,0]
   for particle in range(0,N,4):
      phasecoord[particle:particle+4].T[:3]=fcc(r,a).T
      if r[0]<L-a:
         r[0]+=a
      elif r[1]<L-a:
         r[0]=0
         r[1]+=a
      else:
         r[0]=0
         r[1]=0
         r[2]+=a
      for coord in range(3,6):
         phasecoord[particle][coord]=(rand.random()-0.5)*4*np.sqrt(T*k)
   for particle in range(N):
      for i in range(3):
         phasecoord[particle][i]+=a/4
   return phasecoord,mass

def seed_small_det(N,L,T):
   def fcc(r, l):
      parti=np.zeros((4,3))
      parti[0]=r
      #print(r[0], r[1], r[2])
      parti[1]=[r[0]+l/2,r[1]+l/2,r[2]]
      #print(r[0]+l/2,r[1]+l/2,r[2])
      parti[2]=[r[0]+l/2,r[1],r[2]+l/2]
      #print(r[0]+l/2,r[1],r[2]+l/2)
      parti[3]=[r[0],r[1]+l/2,r[2]+l/2]
      #print(r[0],r[1]+l/2,r[2]+l/2)
      return parti

   k=2.078616e-8
   N=32
   phasecoord=np.zeros((N,6))
   mass=np.ones(N) #can be changed to treat different particles
   r=[L/8,L/8,L/8]
   for particle in range(0,N,4):
      phasecoord[particle:particle+4].T[:3]=fcc(r,L/2).T
      if r[0]<L-2*L/3:
         r[0]+=L/2
      elif r[1]<L-2*L/3:
         r[0]=L/8
         r[1]+=L/2
      else:
         r[0]=L/8
         r[1]=L/8
         r[2]+=L/2
      # boltzmann-distribution for velocities
      #phasecoord[particle][3:]=sc.maxwell.rvs(size=3)
      for coord in range(3,6):
         phasecoord[particle][coord]=np.sqrt(k)
   return phasecoord,mass

def seed(N,L,T):
   """ simple method for placing particles randomly in the cell. No test of overlapping (small distances) is done.
   """
   k=2.078616e-8
   phasecoord=np.zeros((N,6))
   mass=np.ones(N) #can be changed to treat different particles
   for particle in range(N):
      for coord in range(3):
         phasecoord[particle][coord]= rand.random()*L #random float in the box
      for coord in range(3,6):
         # allow for velocities between 1 and -1
         phasecoord[particle][coord]=(rand.random()-0.5)*2*2*np.sqrt(T*k)
   return phasecoord,mass

def testBox(N,L, T):
   """ simple method for placing particles randomly in the cell. No test of overlapping (small distances) is done.
   """
   k=2.078616e-8
   N=2
   phasecoord=np.zeros((N,6))
   mass=np.ones(N) #can be changed to treat different particles
   for particle in range(N):
      for coord in range(3):
         phasecoord[particle][coord]=rand.random()*0.8*L+ 0.1*L #random float in the box
         phasecoord[particle][coord+3]=(rand.random()-0.5)*4*np.sqrt(T*k)
         # allow for velocities 
   return phasecoord,mass

def testForce(N,L, T):
   """ simple method for placing particles randomly in the cell. No test of overlapping (small distances) is done.
   """
   N=2
   phasecoord=np.zeros((N,6))
   mass=np.ones(N) #can be changed to treat different particles
   phasecoord[0][0]= L/2-1.5
   phasecoord[0][1]= L/2
   phasecoord[0][2]= L/2
   phasecoord[1][0]= L/2+2.3
   phasecoord[1][1]= L/2
   phasecoord[1][2]= L/2
   phasecoord[0][3]= 0.0002
   phasecoord[1][3]=-0.0002
   phasecoord[0][4]= 0.001
   phasecoord[1][4]=-0.001
   return phasecoord,mass

def propagate(f,particle,L,dt, mass, alpha,T):
   """ Calculate one propagation step 
   """
   #update force and momentum for particles:
   numPart=len(particle)
   for part in range(numPart):
      #print( particle[part][3:],1/(2*mass[part])*f[part])
      particle[part][:3]+=dt*particle[part][3:]+dt*dt*f[part]/2
      particle[part][3:]+=dt*f[part]/2
      #print(f[part])
   f=update_force(particle,L)
   for part in range(numPart):
      particle[part][3:]+=dt*f[part]/2
      for i in range(3):
         particle[part][i]=particle[part][i]%L
   T_inst=temp(particle)
   #thermostate:
   for part in range(numPart):
      for i in range(3):
         particle[part][i+3]*=(1-alpha*(1-np.sqrt(T/T_inst)))
   return f,particle

def update_force(particle,L):
   def F(r):
      """returns the F/r for the Lennard-Jones potential
      """
      r=np.sqrt(r)
      k_b=2.078616e-8
      sigma=3.4
      epsilon=120.*k_b #in A/ps
    #  if r>2.5*sigma:
    #     return 0
      #x=pow(sigma/r,6.)
      x=(sigma/r)*(sigma/r)
      x*=x*x
      #print(24*epsilon*(2*x*x-x)/(r), r)
      return 24*epsilon*(2*x-1)*x/(r*r)

   def minImage(x_0,x,L):
      x_update=np.zeros(3)
      for i in range(3):
            a=(x_0[i]-x[i])%(L)
            b=(x_0[i]-x[i]+L)%(L)-L
            if -b>=a:
               x_update[i]=a
            else:
               x_update[i]=b
      return x_update
   
   def nextMirror(x,L):
      x_update=np.zeros(3)
      ma=np.argmax(x)
      mi=np.argmin(x)
      x_update=x.copy()
      if x[mi]<L/2:
         if x[mi]<L-x[ma]:
            x_update[mi]=-(x[mi])
         else:
            x_update[ma]+=2*(L-x[ma])
      else:
         x_update[ma]+=2*(L-x[ma])
      return x-x_update

   numPart=len(particle)
   f=np.zeros((numPart,3))
   #r_ij=np.zeros(3)
   for part in range(numPart):
      for interact in range(numPart):
         if part==interact: # self-interaction with mirror
            continue
         r_ij=minImage(particle[part][:3],particle[interact][:3],L)
         f[part]+=F(r_ij[0]*r_ij[0]+r_ij[1]*r_ij[1]+r_ij[2]*r_ij[2])*r_ij
            #f[part]+=F(r_ij[0]*r_ij[0]+r_ij[1]*r_ij[1]+r_ij[2]*r_ij[2])*r_ij
            #f[part]+=F(r_ij.dot(r_ij))*r_ij
      #print(f[part], particle[part][3:])
   return f

def temp(particle):
   N=len(particle)
   k_b=2.078616e-8
   T=0
   for i in range(N):
      for j in range(3,6):
         T+=particle[i][j]*particle[i][j]
   T/=3*N*k_b
   return T

def pairDist(p,L):
   N=len(particle)
   g=[]
   for i in range(N):
      for j in range(i+1,N): 
         g.append(np.sqrt((p[i][:3]-p[j][:3])*(p[i][:3]-p[j][:3])))
   g*=L*L*L*(N-1)*2/N
   return g

def print_conf(particle,output,output2, t,L):
   def potential(parti,i):
      """returns the V(r) for the Lennard-Jones potential
      """
      V=0
      k_b=2.078616e-8
      sigma=3.4
      epsilon=120.*k_b #in A/ps
      for j in range(len(parti)):
         if i==j:
            #dist=nextMirror(parti[i][:3],L)
            #r=np.sqrt(dist.dot(dist) )
            #r=np.sqrt(dist[0]*dist[0]+dist[1]*dist[1]+dist[2]*dist[2])
            continue
         else:
            dist=minImage(parti[j][:3],parti[i][:3],L)
            #r=np.sqrt(dist.dot(dist) )
            r=np.sqrt(dist[0]*dist[0]+dist[1]*dist[1]+dist[2]*dist[2])
         #   if r>2.5*sigma:
         #      continue #add 0 to potential
         x=(sigma/r)*(sigma/r)
         x*=x*x
         V+=4*epsilon*(x*x-x)
      return V

   def minImage(x_0,x,L):
      x_update=np.zeros(3)
      for i in range(3):
            a=(x_0[i]-x[i])%(L)
            b=(x_0[i]-x[i]+L)%(L)-L #always <=0 (by construction)
            if -b>=a:
               x_update[i]=a
            else:
               x_update[i]=b
      return x_update
   
   def nextMirror(x,L):
      x_update=np.zeros(3)
      ma=np.argmax(x)
      mi=np.argmin(x)
      x_update=x.copy()
      if x[mi]<L/2:
         if x[mi]<L-x[ma]:
            x_update[mi]=-(x[mi])
         else:
            x_update[ma]+=2*(L-x[ma])
      else:
         x_update[ma]+=2*(L-x[ma])
      return x-x_update

   out=open(output,"a")
   T=temp(particle)
   E=[0,0]
   N=len(particle)
   for i in range(N):
      part=particle[i]
      #v=particle[i][3]*particle[i][3]+particle[i][4]*particle[i][4]+particle[i][5]*particle[i][5]
      v=part[3]*part[3]+part[4]*part[4]+part[5]*part[5]
      V=potential(particle,i)
      out.write("%f  %d  %2.6f  %2.6f  %2.6f  %4.6g  %4.6g\n"
            %(t, i, part[0],  part[1], part[2], np.sqrt(v), V))
      E[0]+=v/2 #is v^2/2
      E[1]+=V/2 #/2 since sum runs over all indices
   print(t,E[0], E[1], T)
   out.write("\n\n")
   out.close()
   
   #print pair distributions. Correct for r<=L; all values with higher difference are omitted.
   out=open(output2,"a")
   for i in range(N):
      for j in range(i+1,N): 
         r_ij=0
         for k in range(3):
            r_ij+=min((particle[i][k]-particle[j][k]-L)*(particle[i][k]-particle[j][k]-L),\
                      (particle[i][k]-particle[j][k]  )*(particle[i][k]-particle[j][k]  ),\
                      (particle[i][k]-particle[j][k]+L)*(particle[i][k]-particle[j][k]+L))
         if r_ij<=L*L: #save space and discart values that will give wrong statistics anyways.
            out.write("%f  %14.10g\n" %(t,np.sqrt(r_ij)) )
   out.write("\n\n")
   out.close()
