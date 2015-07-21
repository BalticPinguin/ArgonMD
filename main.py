#!/usr/bin/python3
import physics as ph

def frange(start, stop, step): #imitate range, but with floats.
   r = start
   i=0
   while r <= stop:
      yield r
      i+=1
      r =start + i*step

def main():
   N=50 #number of particles
   #length in angstroem, integer required
   L=10 #size of box; needs to be cubic for the method to be working
   T=200
   #time-step (in ps)
   dt=0.3
   t=10e03
   output="box.dat"
   #now, start simulation

   #particle,mass=ph.testBox(N,L, T)
   #particle,mass=ph.testForce(N,L, T)
   particle,mass=ph.seed(N,L, T)
   force=ph.update_force(particle) #get forces
   ph.print_conf(particle,output, 0)
   for time in frange(dt,t,dt):
      force,particle=ph.propagate(force,particle,L, dt,mass)
      ph.print_conf(particle,output, time)

if __name__=="__main__":
   main()
