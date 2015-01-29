#! /bin/ruby
require 'rmagick'
require 'pathname'
include Magick
require 'pry'
# test = ImageList.new("./*")
# test.display
# exit
	startingDirectoryPath="/home/thefinalmilkman/myProjects/KasumChecks/FINALIMAGES/1/"
	template="/home/thefinalmilkman/myProjects/templates/test.png"
	
	def prompt(*args)
	    print(*args)
	    gets
	end

	Dir.foreach(startingDirectoryPath) do |item|
	  next if item == '.' or item == '..'
	  pathname = File.basename(item)
	  templateImg = ImageList.new(template) 
	  # currentImage = ImageList.new(item) {self.colorspace = RGBColorspace}
	  currentImage = ImageList.new(item) {self.colorspace = RGBColorspace}
	# currentImage[0].display
	  currentImage[0].composite!(templateImg[0],NorthGravity,OverCompositeOp)
	  # currentImage[0].annotate
	  # currentImage[0].write "testYYYYY.pdf"
	 actNum="122233263"

	puts "CURRENT CHECK IS===========================>" + pathname
	date=prompt "Enter the check DATE:"
	checkNumber = prompt "Enter the check NUMBER:"
	actNum=prompt "Enter the ACCOUNT NUMBER(DEFAULT IS 122233263):"
	payableTo=prompt "Enter the check PAYABLE TO:"
	memo=prompt "Enter the check MEMO:"
	thing=prompt "Enter the FOR value:"
	amount=prompt "Enter the AMOUNT value:"
	puts actNum.class

	draw = Draw.new
    	draw.annotate(currentImage[0],0,0, -247,70, date) {
        self.pointsize = 8;
        self.font = "Courier";
        self.stroke = "black"
        self.stroke = "black"
        self.gravity = NorthGravity
        self.font_weight = 100
        self.font_style = ItalicStyle
        }

	draw.annotate(currentImage[0], 0, 0, -190,70, checkNumber) {
        self.pointsize = 8;
        self.font = "Courier";
        self.stroke = "black"
        self.stroke = "black"
        self.gravity = NorthGravity
        self.font_weight = 100
        self.font_style = ItalicStyle
        }

	draw.annotate(currentImage[0], 0, 0, -155, 70, actNum) {
        self.pointsize = 7;
        self.font = "Courier";
        self.stroke = "black"
        self.stroke = "black"
        self.gravity = NorthGravity
        self.font_weight = 100
        self.font_style = ItalicStyle
        }
	draw.annotate(currentImage[0], 0, 0, -100, 70, payableTo) {
        self.pointsize = 8;
        self.font = "Courier";
        self.stroke = "black"
        self.stroke = "black"
        self.gravity = NorthGravity
        self.font_weight = 100
        self.font_style = ItalicStyle
        }
	draw.annotate(currentImage[0], 0, 0, -50, 70, thing) {
        self.pointsize = 8;
        self.font = "Courier";
        self.stroke = "black"
        self.stroke = "black"
        self.gravity = NorthGravity
        self.font_weight = 100
        self.font_style = ItalicStyle
        }

	draw.annotate(currentImage[0], 0, 0, 10, 70, memo) {
        self.pointsize = 8;
        self.font = "Courier";
        self.stroke = "black"
        self.stroke = "black"
        self.gravity = NorthGravity
        self.font_weight = 100
        self.font_style = ItalicStyle
        }
	draw.annotate(currentImage[0], 0, 0, 230, 70, amount) {
        self.pointsize = 8;
        self.font = "Courier";
        self.stroke = "black"
        self.stroke = "black"
        self.gravity = NorthGravity
        self.font_weight = 100
        self.font_style = ItalicStyle
        }

	  currentImage[0].write "output/fx#{pathname}.pdf"

	  puts `echo COMPLETED!! | figlet`



	end




