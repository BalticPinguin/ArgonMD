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
   assert len(argv)==2, "only temperature and alpha are allowed as input-parameter!"
   N=256 #number of particles
   #length in angstroem, integer required
   #L=10 #size of box; needs to be cubic for the method to be working
   L=21   #-->  density of rho=1.8 g/cm^3
   T=float(argv[0])
   #time-step (in ps)
   dt=1e-2
   t=10e+03
   alpha=float(argv[1])/10
   #dt=10.0
   #t=6000e0
   output="box.dat"
   output2="pairDist.dat"
   #now, start simulation

   #particle,mass=ph.testBox(N,L, T)
   #particle,mass=ph.testForce(N,L, T)
   particle,mass=ph.seed_fcc(N,L,T)
   #particle,mass=ph.seed(N,L, T)
   force=ph.update_force(particle,L) #get forces
   ph.print_conf(particle,output, output2,0, L)
   for time in frange(dt,t,dt):
      force,particle=ph.propagate(force,particle,L, dt,mass, alpha,T)
      ph.print_conf(particle,output, output2, time, L)

if __name__=="__main__":
   main(sys.argv[1:])
