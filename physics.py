#!/usr/bin/python3
import numpy as np
#from scipy import stats as sc #for the maxwell-distribution
import random as rand

def seed_fcc(N,L,T):
   def fcc(r, l):
      parti=np.zeros((4,3))
      parti[0]=r
      print(r[0], r[1], r[2])
      parti[1]=[r[0]+l/2,r[1]+l/2,r[2]]
      print(r[0]+l/2,r[1]+l/2,r[2])
      parti[2]=[r[0]+l/2,r[1],r[2]+l/2]
      print(r[0]+l/2,r[1],r[2]+l/2)
      parti[3]=[r[0],r[1]+l/2,r[2]+l/2]
      print(r[0],r[1]+l/2,r[2]+l/2)
      return parti

   k=2.07e-8
   N=256
   phasecoord=np.zeros((N,6))
   mass=np.ones(N) #can be changed to treat different particles
   r=[L/16,L/16,L/16]
   for particle in range(0,N,4):
      phasecoord[particle:particle+4].T[:3]=fcc(r,L/4).T
      if r[0]<L-L/3:
         r[0]+=L/4
      elif r[1]<L-L/3:
         r[0]=L/16
         r[1]+=L/4
      else:
         r[0]=L/16
         r[1]=L/16
         r[2]+=L/4
      # boltzmann-distribution for velocities
      #phasecoord[particle][3:]=sc.maxwell.rvs(size=3)
      for coord in range(3,6):
         phasecoord[particle][coord]=(rand.random()-0.5)*4*np.sqrt(T*k)
   return phasecoord,mass

def seed(N,L,T):
   """ simple method for placing particles randomly in the cell. No test of overlapping (small distances) is done.
   """
   k=2.07e-8
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
   k=2.07e-8
   N=2
   phasecoord=np.zeros((N,6))
   mass=np.ones(N) #can be changed to treat different particles
   for particle in range(N):
      for coord in range(3):
         phasecoord[particle][coord]= rand.random()*L #random float in the box
      for coord in range(3,6):
         # allow for velocities 
         phasecoord[particle][coord]=(rand.random()-0.5)*4*np.sqrt(T*3*k/mass[particle])/np.sqrt(3)
   return phasecoord,mass

def testForce(N,L, T):
   """ simple method for placing particles randomly in the cell. No test of overlapping (small distances) is done.
   """
   N=3
   phasecoord=np.zeros((N,6))
   mass=np.ones(N) #can be changed to treat different particles
   phasecoord[0][0]= L/2
   phasecoord[0][1]= L/2
   phasecoord[0][2]= L/2
   phasecoord[1][0]= L/2+3.8
   phasecoord[1][1]= L/2
   phasecoord[1][2]= L/2
   phasecoord[2][1]= L/3
   phasecoord[2][0]= 1.9 #half of the ... radius
   phasecoord[0][3]= 0.0002
   phasecoord[1][3]=-0.0002
   phasecoord[0][4]= 0.001
   phasecoord[1][4]=-0.001
   phasecoord[2][3]=-0.0002
   phasecoord[2][4]=-0.001
   return phasecoord,mass

def propagate(f,particle,L,dt, mass, alpha,T):
   """ Calculate one propagation step 
   """
   #update force and momentum for particles:
   numPart=len(particle)
   for part in range(numPart):
      #print( particle[part][3:],1/(2*mass[part])*f[part])
      particle[part][:3]+=dt*particle[part][3:]+dt*dt/(2*mass[part])*f[part]
      particle[part][3:]+=dt/mass[part]*f[part]/2
      #print(f[part])
   f=update_force(particle,L)
   for part in range(numPart):
      particle[part][3:]+=dt/mass[part]*f[part]/2
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
      k_b=2.07e-8
      e=0
      sigma=3.4
      epsilon=120.*k_b #in A/ps
      if r>2.5*sigma:
         return 0
      if r<e: #make potential constant in the center
         x=pow(sigma/e,6.)
         return 24*epsilon*(2*x-1)*x/(e*e)
      x=pow(sigma/r,6.)
     # print(24*epsilon*(2*x*x-x)/(r*r), r)
      return 24*epsilon*(2*x-1)*x/(r*r)

   def minImage(x_0,x,L):
      x_update=np.zeros(3)
      for i in range(3):
            a=(x_0[i]-x[i])%(L)
            b=(x_0[i]-x[i]+L)%(L)-L
            if abs(b)>=a:
               x_update[i]=a
            else:
               x_update[i]=b
      return x_update
   
   def nextMirror(x,L):
      x_update=np.zeros(3)
      for i in range(3):
         if x[i]>L/2:
            x_update[i]=2*(L-x[i])
         else:
            x_update[i]=2*x[i]
      return x_update

   numPart=len(particle)
   f=np.zeros((numPart,3))
   r_ij=np.zeros(3)
   f_ij=np.zeros(3)
   for part in range(numPart):
      f_ij*=0 #set the vector to 0
      for interact in range(numPart):
         if part==interact: #avoid self-interaction with mirror
            r_ij=nextMirror(particle[part][:3],L)
         else:
            r_ij=minImage(particle[part][:3],particle[interact][:3],L)
         f_ij+=F(r_ij[0]*r_ij[0]+r_ij[1]*r_ij[1]+r_ij[2]*r_ij[2])*r_ij
         f[part]=f_ij
   return f

def temp(particle):
   N=len(particle)
   k_b=2.07e-8
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
      k_b=2.07e-8
      sigma=3.4
      epsilon=120.*k_b #in A/ps
      for j in range(len(parti)):
         if j==i:
            continue #no self-interaction
         r=np.sqrt(
                  (parti[j][0]-parti[i][0])*(parti[j][0]-parti[i][0])+
                  (parti[j][1]-parti[i][1])*(parti[j][1]-parti[i][1])+
                  (parti[j][2]-parti[i][2])*(parti[j][2]-parti[i][2]) )
         if r>2.5*sigma:
            continue #add 0 to potential
         #else:
         x=pow(sigma/r,6.)
         V+=4*epsilon*(x*x-x)
      return V

   out=open(output,"a")
   T=temp(particle)
   for i in range(len(particle)):
      v=particle[i][3]*particle[i][3]+particle[i][4]*particle[i][4]+particle[i][5]*particle[i][5]
      V=potential(particle,i)
      out.write("%f  %d  %2.6f  %2.6f  %2.6f  %4.6g  %4.6g %4.4g \n"
            %(t, i, particle[i][0],  particle[i][1], particle[i][2],np.sqrt(v), V,T))
   out.write("\n\n")
   
   #print pair distributions. Correct for r<=L; all values with higher difference are omitted.
   N=len(particle)
   out=open(output2,"a")
   for i in range(N):
      for a in [-L,0,L]:
         for b in [-L,0,L]:
            for c in [-L,0,L]:
               R=[a,b,c] #get all neighbouring cells as well
               for j in range(i+1,N): 
                  r_ij=(particle[i][:3]-particle[j][:3]-R).dot(particle[i][:3]-particle[j][:3]-R)
                  if r_ij>L: #save space and discart values that will give wrong statistics anyways.
                     continue
                  out.write("%f  %14.10g\n" %(t,np.sqrt(r_ij)*(N-1)/N))
      out.write("\n\n")
