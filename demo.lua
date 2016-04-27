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
