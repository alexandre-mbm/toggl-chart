t = 488000
#t = 38030000

def human_time(t)

    t /= 1000

    mm, ss = t.divmod(60)            #=> [4515, 21]
    hh, mm = mm.divmod(60)           #=> [75, 15]
    dd, hh = hh.divmod(24)           #=> [3, 3]

    #puts "%d days, %d hours, %d minutes and %d seconds" % [dd, hh, mm, ss]
    #=> 3 days, 3 hours, 15 minutes and 21 seconds


    # 488000
    # 38030000
    # 17946000
    # 0
    # 29936000

    # 8 min
    # 4:02
    # 2 s

    if hh == 0 and mm == 0
        "%d s" % ss
    elsif hh == 0
        "%d min" % mm
    else 
        #Time.at(t).strftime("%H:%M")
        "%d:%02d" % [hh,mm]
    end

end

#puts human_time(t)
