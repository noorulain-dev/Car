require 'rubygems'
require 'gosu'
require './circle'

#the screen has layers: Background, middle, top
module ZOrder
BACKGROUND, MIDDLE, TOP = *0..2
end

class DemoWindow <Gosu::Window
    def initialize
	   super(840,720, false)
	end
	
	def draw 
	draw_quad(0, 0, Gosu::Color::BLUE, 840, 0, Gosu::Color::BLUE, 0, 720, Gosu::Color::BLUE, 840, 720, Gosu::Color::BLUE, ZOrder::BACKGROUND)
	Gosu.draw_rect(50,350, 700, 120, Gosu::Color::CYAN, ZOrder::TOP, mode=:default)
	draw_quad(140, 350, Gosu::Color::YELLOW, 250, 250, Gosu::Color::YELLOW, 525,250, Gosu::Color::YELLOW, 630, 350, Gosu::Color::YELLOW, ZOrder:: MIDDLE)
	Gosu.draw_line(385, 250, Gosu::Color::BLACK, 385, 470, Gosu::Color::BLACK, ZOrder::TOP, mode=:default)
	img = Gosu::Image.new(Circle.new(10,128,128,128), false)
	img.draw 75, 375, ZOrder::TOP
	img.draw 75, 415, ZOrder::TOP
	img = Gosu::Image.new(Circle.new(50,255,0,0),false)
	img.draw 250, 450, ZOrder::MIDDLE
	img.draw 450, 450, ZOrder::MIDDLE
	
	end
	end
	
	DemoWindow.new.show
	