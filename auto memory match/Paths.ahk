Class Memory{
	Path(which){
		if (which = 1){
			Reset()
			walktocannon()
			camrotate(4,"r")
			Send e
			camrotate(2,"l")
			sleep 5000
			walk(3000,"b")
			walk(1500,"f")
			timer := A_TickCount
			while (1){
				walk(100,"l")
				if (SearchFunction("e.png",10)[1] = 0){
					break
				}
				if (A_TickCount - timer > 10000){
					return
				}
			}
			msgbox,found E
			return
		}
		if (which = 2){
			
			return
		}
		if (which = 3){
			
			return
		}
	}
}