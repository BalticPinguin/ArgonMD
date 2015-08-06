#!/usr/bin/python3
import physics as ph
import sys

def frange(start, stop, step): #imitate range, but with floats.
   r = start
   i=0
   while r <= stop:
      yield r
      i+=1
      r =start + i*step

def main(argv):
   assert len(argv)==1, "only temperature and alpha are allowed as input-parameter!"
   N=256 #number of particles
   #N=32 #number of particles
   #length in angstroem, integer required
   #L=10 #size of box; needs to be cubic for the method to be working
   T=float(argv[0])
   dt=10
   t=3e3
   alpha=0.02
   L=21   #-->  density of rho=1.8 g/cm^3
   #L=10.5   #-->  density of rho=1.8 g/cm^3
   #time-step (in ps)
   #t=30e3
   output="box.dat"
   output2="pairDist.dat"
   #now, start simulation

   #particle,mass=ph.testBox(N,L, T)
   #particle,mass=ph.testForce(N,L, T)
   #particle,mass=ph.seed_fcc(N,L,T)
   particle,mass=ph.seed_small(N,L,T)
   #particle,mass=ph.seed(N,L, T)

   force=ph.update_force(particle,L) #get forces
   #ph.print_conf(particle,output, output2,0, L)
   for time in frange(dt,t,dt):
      force,particle=ph.propagate(force,particle,L, dt,mass, alpha,T)
      if time >2e3: # don't waste time, printing dumb data.
      ph.print_conf(particle,output, output2, time, L)

if __name__=="__main__":
   main(sys.argv[1:])
