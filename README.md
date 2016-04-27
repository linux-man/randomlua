#randomlua - Pure Lua Random Generator  

(c) 2016 Caldas Lopes  
This software is provided 'as-is', without any express or implied warranty. In no event will the authors be held liable for any damages arising from the use of this software.  
Permission is granted to anyone to use this software for any purpose, including commercial applications, and to alter it and redistribute it freely, subject to the following restrictions:  
    1. The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation would be appreciated but is not required.  
    2. Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.  
    3. This notice may not be removed or altered from any source distribution.  

    Mersenne twister (http://en.wikipedia.org/wiki/Mersenne_twister), very good and slow
    Multiply-with-carry (http://en.wikipedia.org/wiki/Multiply-with-carry), probably the best option
    Linear congruential generator (http://en.wikipedia.org/wiki/Linear_congruential_generator), fast and, well, it works... kind of.

MWC and LCG come with 3 pre-defined parameters.

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
