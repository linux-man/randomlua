# randomlua - Pure Lua Random Generator  

(c) 2017 Caldas Lopes  

Mersenne twister (http://en.wikipedia.org/wiki/Mersenne_twister), very good and slow  
Multiply-with-carry (http://en.wikipedia.org/wiki/Multiply-with-carry), probably the best option  
Linear congruential generator (http://en.wikipedia.org/wiki/Linear_congruential_generator), fast and, well, it works... kind of.  

MWC and LCG come with 3 pre-defined parameters.

m = twister(seed) - Create a generator.  

Usually it's better to initialize the generators without params. m = twister() use os.time() for seed.
A seed must be given when choosing the LCG params, as in l3 = lcg(0, 'mvc'). After that, call l3:randomseed()

:random() returns a float between 0 and 1.
:random(max) returns an integer between 1 and max
:random(min, max) returns an integer between min and max
:random(0) return the original 31 (twister) or 16 (lcg and mwc) bits integer.

:randomseed(seed) to change seed. Again, randomseed() call os.time().

Code example:  

require('randomlua')  

l1 = lcg(0) -- Linear congruential generator (Ansi C params)  
l2 = lcg(0, 'nr') --Linear congruential generator (Numerical recipes params)  
l3 = lcg(0, 'mvc') -- Linear congruential generator (Microsoft Visual C params)  
c1 = mwc(0) -- Multiply-with-carry (Ansi C params)  
c2 = mwc(0, 'nr') -- Multiply-with-carry (Numerical recipes params)  
c3 = mwc(0, 'mvc') -- Multiply-with-carry (Microsoft Visual C params)  
m = twister(0) -- Mersenne twister  

for n = 1, 10 do  
   io.write(string.format("%8d%8d%8d%8d%8d%8d%16u\n", l1:random(0), l2:random(0), l3:random(0), c1:random(0), c2:random(0), c3:random(0), m:random(0)))  
end
