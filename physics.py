#!/usr/bin/python3
import numpy as np
import random as rand

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
         phasecoord[particle][coord]=(rand.random()-0.5)*2*np.sqrt(T*3*k/mass[particle])/np.sqrt(3)
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
   N=2
   phasecoord=np.zeros((N,6))
   mass=np.ones(N) #can be changed to treat different particles
   phasecoord[0][0]= L/2
   phasecoord[0][1]= L/2
   phasecoord[0][2]= L/2
   phasecoord[1][0]= L/2+3.8
   phasecoord[1][1]= L/2
   phasecoord[1][2]= L/2
   phasecoord[0][3]= 0.0002
   phasecoord[1][3]=-0.0002
   phasecoord[0][4]= 0.001
   phasecoord[1][4]=-0.001
   return phasecoord,mass

def propagate(f,particle,L,dt, mass):
   """ Calculate one propagation step 
   """
   #update force and momentum for particles:
   numPart=len(particle)
   for part in range(numPart):
      #print( particle[part][3:],1/(2*mass[part])*f[part])
      particle[part][:3]+=dt*particle[part][3:]+dt*dt/(2*mass[part])*f[part]
      particle[part][3:]+=dt/mass[part]*f[part]/2
      #print(f[part])
   f=update_force(particle)
   for part in range(numPart):
      particle[part][3:]+=dt/mass[part]*f[part]/2
      for i in range(3):
         particle[part][i]=particle[part][i]%L
   return f,particle

def update_force(particle):
   def F(r):
      """returns the F/r for the Lennard-Jones potential
      """
      r=np.sqrt(r)
      k_b=2.07e-8
      epsilon=1e-10
      sigma=3.4
      epsilon=120.*k_b #in A/ps
      if r>2.5*sigma:
         return 0
      if r<epsilon:
         return 4
      x=pow(sigma/r,6.)
      print(24*epsilon*(2*x*x-x)/(r*r), r)
      return 24*epsilon*(2*x-1)*x/(r*r)
   
   numPart=len(particle)
   f=np.zeros((numPart,3))
   r_ij=np.zeros(3)
   f_ij=np.zeros(3)
   for part in range(numPart):
      f_ij*=0 #set the vector to 0
      for interact in range(numPart):
         if part!=interact: #avoid self-interaction
            for i in range(3):
               r_ij[i]=particle[part][i]-particle[interact][i]
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

def print_conf(particle,output, t):
   out=open(output,"a")
   T=temp(particle)
   for i in range(len(particle)):
      out.write("%f  %d  %2.6f  %2.6f  %2.6f  %4.6g  %4.6g  %4.6g   %4.8g\n"
            %(t, i, particle[i][0],  particle[i][1], particle[i][2],particle[i][3],  particle[i][4], particle[i][5],
            T))
   out.write("\n\n")
