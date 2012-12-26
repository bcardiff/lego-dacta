class Dacta70909

	def initialize
		@serial = open("/dev/cu.usbserial", "r+")
	end
	
	def start
		@serial.write "\0Welcome to the N i n j a /IbmLogo World\rp\0###Do you byte, when I knock?$$$"

		@keep_alive_thread = Thread.new {
			while true do
				serial.putc 2
				sleep 1
			end
		}
	end

	def stop
		@serial.close
		@keep_alive_thread.terminate
	end
	
	def set_output(port, on = true, right = true)
		theonoffbyte = 0x28 # Command to turn port on "00101ppp"
		theleftrightbyte = 0x40 # Command to turn port left "01000ppp"
		
		if port>=0 && port<=7
			theonoffbyte = theonoffbyte + port # Insert port number into command.
			theleftrightbyte = theleftrightbyte + port
			
			if !on
				theonoffbyte = theonoffbyte + 16 # Turn bit 5 on if we're turning port off.
			end
			
			if right
				theleftrightbyte += 8 # Set bit 4 if we want to go right.
			end

			@serial.putc theleftrightbyte
			@serial.putc theonoffbyte
		end
	end
end

d = Dacta70909.new
d.start
sleep 1

d.set_output 0, true
sleep 0.5
d.set_output 1, true
sleep 0.5
d.set_output 2, true
d.set_output 0, false
sleep 0.5
d.set_output 3, true
d.set_output 1, false
sleep 0.5
d.set_output 2, false
sleep 0.5
d.set_output 3, false
sleep 0.5
d.set_output 0, true
d.set_output 1, true
d.set_output 2, true
d.set_output 3, true
sleep 1
d.set_output 0, false
d.set_output 1, false
d.set_output 2, false
d.set_output 3, false

sleep 3
d.stop