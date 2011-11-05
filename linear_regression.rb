class LinearRegression
  def sum(arr)
    arr.reduce(0.0) {|a,x| a+x}
  end

  def sqrSum(arr)
    arr.reduce(0.0) {|a,x| a + (x*x)}
  end

  def initialize(x,y)
    @x = x; @y = y
    @sumX = sum(x); @sumY = sum(y); @avg = @sumY/@y.size
    @sumXX = sum(x.map{|e| e*e})
    @sumXY = sum((x.zip y).map{|a,b| a*b})
    @w1 = getW1; @w0 = getW0
  end

  def getW1
    (@x.size * @sumXY - @sumX * @sumY) / (@x.size * @sumXX - @sumX * @sumX)
  end

  def getW0
    (@sumY - getW1 * @sumX)/@x.size
  end

  def getEq
    "#{@w1}x #{@w0 > 0 ? '+' : '-'}  #{@w0.abs}"
  end

  def stats
    y1m = -> x {@w1*x + @w0 - @avg}
    y0m = -> y {y - @avg}
    n = sqrSum(@x.map &y1m)
    d = sqrSum(@y.map &y0m)
    rss = (n - d).abs
    r = Math.sqrt (n / d)
    {:rss => rss, :r => r, :tss => d}
  end
end

# Data is from AI Class assignment
a = LinearRegression.new([0,1,2,3,4],[3,6,7,8,11])
puts a.getEq

# Data is from http://en.wikipedia.org/wiki/Ordinary_least_squares
b = LinearRegression.new(
 [1.47, 	1.50, 	1.52, 	1.55, 	1.57, 	1.60, 	1.63, 	1.65, 	1.68, 	1.70, 	1.73, 	1.75, 	1.78, 	1.80, 	1.83],
 [52.21, 	53.12, 	54.48, 	55.84, 	57.20, 	58.57, 	59.93, 	61.29, 	63.11, 	64.47, 	66.28, 	68.10, 	69.92, 	72.19, 	74.46]
)
puts b.getEq, b.stats