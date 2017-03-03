
# fail

ps = 11
pc = 1

psf = 1.0 / ps
pcf = pc

for n in 0..12
    f = n * (psf)
    puts "%d × ( 1/%d ) = %f" % [n,ps,f]
end

puts

for n in 0..12
    m = 12 - n
    f = m * (psf) + n * (pcf) 
    puts "%d × ( 1/%d ) + %d × ( %d ) = %f" % [m,ps,n,pc,f]
end
