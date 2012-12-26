def l(prefix, char)
	puts " #{prefix} '#{char.ord != 10 && char.ord != 13 ? char : "-"}' (#{char.ord})"
end

open("/Users/bcardiff/Work/Lego/lego-dacta/snif.usbserial", "r+") do |fake|
	open("/dev/cu.usbserial", "r+") do |real|
		puts "connecting..."

		Thread.new {
			while true
				a = fake.getc
				real.printf("%c", a)
				l "pc -> com", a
			end
		}

		Thread.new {
			while true
				b = real.getc
				fake.printf("%c", b)
				l "com -> pc", b
			end
		}

		gets
	end
end
