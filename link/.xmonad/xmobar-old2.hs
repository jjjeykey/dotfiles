onfig { font = "-misc-fixed-*-*-*-*-13-*-*-*-*-*-*-*"
       , bgColor = "black"
       , fgColor = "grey"
       , position = TopW L 85
       , commands = [ Run Network "wlan0" ["-L","0","-H","32","--normal","green","--high","red"] 10
                    , Run Cpu ["-L","15","-H","50","--normal","green","--high","red"] 10
                    , Run Memory ["-t","Mem: %"] 10
                    , Run Swap [] 10
                    , Run Date "%a %b %_d %Y %H:%M:%S" "date" 10
                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader% }{ %cpu% | %memory% * %swap% | %wlan0% | %date%"
       }
