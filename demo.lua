require('randomlua')

l1 = lcg(0) -- Linear congruential generator (Ansi C params)
l2 = lcg(0, 'nr') --Linear congruential generator (Numerical recipes params)
c1 = mwc(0) -- Multiply-with-carry (Ansi C params)
c2 = mwc(0, 'nr') -- Multiply-with-carry (Numerical recipes params)
m = twister(0) -- Mersenne twister

for n = 1, 10 do
   io.write(string.format("%8u%8u%8u%8u%16u\n", l1:random(0), l2:random(0), c1:random(0), c2:random(0), m:random(0)))
end

-- lets run them all a bunch of times and gather stats
count = 10000
names = {"l1", "l2", "c1", "c2", "m"}
generators = {l1, l2, c1, c2, m}
mins = {}
maxs = {}
bins = {}
for i, gen in ipairs(generators) do
	bins[i] = {}
	for n = 1, count do
		x = gen:random()
		bin = math.floor(x*10) + 1
		bins[i][bin] = (bins[i][bin] or 0) + 100/count
		if mins[i] == nil or x < mins[i] then
			mins[i] = x
		end
		if maxs[i] == nil or x > maxs[i] then
			maxs[i] = x
		end
	end
end

print("name: min - max [histogram of each 10%]")
for i = 1, #generators do
	for j = 1, #bins[i] do
		bins[i][j] = string.format("%2.0f%%", bins[i][j])
	end
	distribution = table.concat(bins[i], " ")
	print(string.format("%2s: %f - %f [%s]", names[i], mins[i], maxs[i], distribution))
end
