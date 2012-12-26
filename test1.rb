open("/dev/cu.usbserial", "r+") do |serial|
	echo_thread = Thread.new {
		while true do
			b = serial.getc
			puts " com -> pc '#{b}' (#{b.ord})"
		end
	}

	serial.write "\0Welcome to the N i n j a /IbmLogo World\rp\0###Do you byte, when I knock?$$$"
	# serial.write "p\0###Do you byte, when I knock?$$$"

	keep_alive_thread = Thread.new {
		# keep alive thread
		while true do
			serial.putc 2
			sleep 1
		end
	}


	sleep 6

	echo_thread.terminate
	keep_alive_thread.terminate
end

#  pc -> com '' (0)
#  pc -> com 'W' (87)
#  pc -> com 'e' (101)
#  pc -> com 'l' (108)
#  pc -> com 'c' (99)
#  pc -> com 'o' (111)
#  pc -> com 'm' (109)
#  pc -> com 'e' (101)
#  pc -> com ' ' (32)
#  pc -> com 't' (116)
#  pc -> com 'o' (111)
#  pc -> com ' ' (32)
#  pc -> com 't' (116)
#  pc -> com 'h' (104)
#  pc -> com 'e' (101)
#  pc -> com ' ' (32)
#  pc -> com 'N' (78)
#  pc -> com ' ' (32)
#  pc -> com 'i' (105)
#  pc -> com ' ' (32)
#  pc -> com 'n' (110)
#  pc -> com ' ' (32)
#  pc -> com 'j' (106)
#  pc -> com ' ' (32)
#  pc -> com 'a' (97)
#  pc -> com ' ' (32)
#  pc -> com '/' (47)
#  pc -> com 'I' (73)
#  pc -> com 'b' (98)
#  pc -> com 'm' (109)
#  pc -> com 'L' (76)
#  pc -> com 'o' (111)
#  pc -> com 'g' (103)
#  pc -> com 'o' (111)
#  pc -> com ' ' (32)
#  pc -> com 'w' (119)
#  pc -> com 'o' (111)
#  pc -> com 'r' (114)
#  pc -> com 'l' (108)
#  pc -> com 'd' (100)
# ' (13) com '
#  pc -> com 'p' (112)
#  pc -> com '' (0)
#  pc -> com '#' (35)
#  pc -> com '#' (35)
#  pc -> com '#' (35)
#  pc -> com 'D' (68)
#  pc -> com 'o' (111)
#  pc -> com ' ' (32)
#  pc -> com 'y' (121)
#  pc -> com 'o' (111)
#  pc -> com 'u' (117)
#  pc -> com ' ' (32)
#  pc -> com 'b' (98)
#  pc -> com 'y' (121)
#  pc -> com 't' (116)
#  pc -> com 'e' (101)
#  pc -> com ',' (44)
#  pc -> com ' ' (32)
#  pc -> com 'w' (119)
#  pc -> com 'h' (104)
#  pc -> com 'e' (101)
#  pc -> com 'n' (110)
#  pc -> com ' ' (32)
#  pc -> com 'I' (73)
#  pc -> com ' ' (32)
#  pc -> com 'k' (107)
#  pc -> com 'n' (110)
#  pc -> com 'o' (111)
#  pc -> com 'c' (99)
#  pc -> com 'k' (107)
#  pc -> com '?' (63)
#  pc -> com '$' (36)
#  pc -> com '$' (36)
#  pc -> com '$' (36)
