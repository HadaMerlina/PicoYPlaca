require 'time'

#Defining Class
class Vehicle
  
  #initializing Vehicle
  def initialize (plateNumber, brand, model)
    @PlateNumber = plateNumber
    @Brand = brand
    @Model = model
  end
  
  #getter methods
  def getPlateNumber
    @PlateNumber
  end
  def getBrand
    @Brand
  end
  def getModel
    @Model
  end
  
  #setter methods
  def setPlateNumber=(value)
    @PlateNumber = value
  end
  def setBrand=(value)
    @Brand = value
  end
  def setModel=(value)
    @Model = value
  end
  
end

#creating array emulated database for future use
Car = Array.new
Car[0] = Vehicle.new('PWE0450', 'Chevrolet', 'Sail') 
Car[1] = Vehicle.new('PCF7893', 'Hyundai', 'I10')
Car[2] = Vehicle.new('TFC0987', 'Ford', 'F150')

#defining limitations on arrays
Day = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
Number = [[1,2],[3,4],[5,6],[7,8],[9,0]]
@range1 = "7:00".."9:30"
@range2 = "16:00".."19:30"

#checking database, using object, easier with SQL
def carInfo(plateNumber)
  $i = 0
  temp = Car.length()-1
  while $i <= Car.length()-1 do
      if (Car[$i].getPlateNumber==plateNumber)
        print "Plate: " + Car[$i].getPlateNumber + "\n"
        print "Brand: " + Car[$i].getBrand + "\n"
        print "Model: " + Car[$i].getModel + "\n"
      end
      $i += 1
  end
end

#movement allowance
def carOnTheRoad (plateNumber, dateRoad, timeRoad)
  #counter
  $i = Day.length-1
  #condition if printed
  $j = 0
  plateEnd = plateNumber[plateNumber.length()-1]
  date = dateRoad + ' ' + timeRoad
  time = Time.parse(date)
  plateEnd = plateNumber[plateNumber.length-1]
  while $i >= 0  && $j == 0 do
    if time.strftime("%A")==Day[$i] && (Number[$i][0]==plateEnd.to_i || Number[$i][1]==plateEnd.to_i) && (@range1===timeRoad || @range2===timeRoad)
        puts("Car with plate " + plateNumber + " can't be on the road")
        $j += 1
    elsif ($i==0)
        puts("Car with plate " + plateNumber + " can be on the road")
    end
    $i -= 1
  end
end

#interacting with user
print "Please enter your Plate Number <Ex: PXX0000>"
plate = gets.chomp.upcase  #'TFC0987'
if plate.length == 7
  print "Please enter the date <DD/MM/YYYY>"
  date = gets.chomp #'24/08/2016'
  if date.length == 10
    print "Please enter the time <24:59>"
    time = gets.chomp #'8:30'
    if time.length.between?(4,5)
      carInfo(plate)
      carOnTheRoad(plate, date, time)
    end
    else
      print "Error"
  end
else
  print "Error"
end

module LifeCycle
  RESET = 'reset'
end