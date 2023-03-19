SearchFunction(image,variation){ ;imagesearch in function so it's nicer to use.
	mousemove,A_ScreenWidth/2,A_ScreenHeight/2
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *%variation% images\%image%
	return [ErrorLevel,FoundX,FoundY]
} 

camrotate(amount,dir){ ;just rotates the damn camera
	if (dir = "l"){
		if (keyboardtype = "azerty"){
			dir := ";"
		}else if (keyboardtype = "qwertz"){
			dir := "."
		}else if (keyboardtype = "qwerty"){
			dir := ","
		}
	}else{
		if (keyboardtype = "azerty"){
			dir := ":"
		}else if (keyboardtype = "qwertz"){
			dir := ","
		}else if (keyboardtype = "qwerty"){
			dir := "."
		}
	}loop %amount%{
		Send %dir%
	}
} 

walk(time,dir){ ;makes the character do walking and stuff like that.
	distance := (time/haststatus)*28
	if (dir = "f"){
		if (keyboardtype = "azerty"){
			Send {z down}
			sleep %distance%
			Send {z up}
			Send {z up}
		}else{
			Send {w down}
			sleep %distance%
			Send {w up}
			Send {w up}
		}
	}else if (dir = "l"){
		if (keyboardtype = "azerty"){
			Send {q down}
			sleep %distance%
			Send {q up}
			Send {q up}
		}else{
			Send {a down}
			sleep %distance%
			Send {a up}
			Send {a up}
		}
	}else if (dir = "b"){
		Send {s down}
		sleep %distance%
		Send {s up}
		Send {s up}
	}else if (dir = "r"){
		Send {d down}
		sleep %distance%
		Send {d up}
		Send {d up}
	}
}

walkhold(dir,setting){ ;basically just the same as keydown but without a keyup after.
	if (dir = "f"){
		if (keyboardtype = "azerty"){
			Send {z %setting%}
		}else{
			Send {w %setting%}
		}
	}else if (dir = "l"){
		if (keyboardtype = "azerty"){
			Send {q %setting%}
		}else{
			Send {a %setting%}
		}
	}else if (dir = "b"){
		Send {s %setting%}
	}else if (dir = "r"){
		Send {d %setting%}
	}
}

SendSpace(){ ;makes the character jump.
	Send {space down}
	sleep 100
	Send {space up}
} 

walktocannon(){ ;makes the character walk to the cannon.
	attempts := 0
	cannonstart:
	if (attempts != 0){
		Reset()
	}
	attempts++
	sleep 100
	walk(1000,"f") 
	send {d down}
	sleep 6500
	sendSpace()
	sleep 400
	send {d up}
	WinGetPos , windowX, windowY, windowWidth, windowY, Roblox
	WindowY := windowY/3
	btimer := A_Tickcount
	loop{
		ImageSearch,foundx,foundy,0,0,A_ScreenWidth,windowY,*10 images/e.png 
		if (errorlevel = 0){
			break
		}else{
			walk(50,"r")
		}
		if (A_Tickcount - btimer > 5000){
			if (attempts > 2){
				if (tier = 1){
					GuiControlGet,pineconvhive
					if (pineconvhive){
						Reset()
					}
				}
				global reconnectedcannon := true
				return
			}else{
				goto,cannonstart
			}
		}
	}
} 

Reset(){ ;this will make your character commit suicide and also has some crapy anti bear glitch protection which only works half of the time but it's better than other macros which will let your character fling all the way to the onett house instead of going to pepper
	Retryy:
	r(true)
	breaktimer := A_TickCount
	while (1){
		sleep 100
		if (SearchFunction("hive.png",30)[1] = 0 || SearchFunction("hiven.png",30)[1] = 0){
			camrotate(4,"l")
			Send ooooooooo
			break
		}
		else{
			camrotate(4,"l")
		}
		if (A_TickCount - breaktimer > 15000){
			goto,Retryy
		}
	}
	Send ooooooooo
}

r(var){ ;kills your character
	SendInput {Escape}
	sleep 250
	SendInput {r}
	sleep 250
	SendInput {Enter}
	sleep 250
	if(var){
		sleep 8000
	}
}
