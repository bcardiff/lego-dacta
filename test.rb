# require 'serialport'

# sp = SerialPort.new(1, 9600, 8, 1, SerialPort::NONE)

open("/dev/tty", "r+") do |tty|
#   tty.sync = true
#   Thread.new {
#     while true do
#       tty.printf("%c", sp.getc)
#     end
#   }
#   # while (l = tty.gets) do
#   #   sp.write(l.sub("\n", "\r"))
#   # end
# }

	tty.write "connecting..."

	open("/dev/cu.usbserial", "r+") do |serial|
		# serial.write "p\0###Do you byte, when I knock?$$$"
		"p\0###Do you byte, when I knock?$$$".each_byte { |b| serial.putc b }

		Thread.new {
			while true do
				tty.printf("%c", serial.getc)
			end
		}

		sleep 4
	end

end

# sp.write 
# sp.close