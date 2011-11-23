@linearRegression = (points) ->
	Exy = points.reduce ((sum, e) -> e.x * e.y + sum), 0
	Ex = points.reduce ((sum, e) -> e.x + sum), 0
	Ey = points.reduce ((sum, e) -> e.y + sum), 0
	Exx = points.reduce ((sum, e) -> e.x * e.x + sum), 0

	M = points.length
	w1 = (M*Exy - Ex*Ey)/(M*Exx - Ex*Ex)
	w0 = (Ey - w1*Ex)/M
	#console.log(Exy, Ex, Ey, Exx, M, w1, w0)
	#{a: w1, b: w0}
	(x) -> w1 * x + w0

@averagePoint = (points) ->
	Ex = points.reduce ((sum, e) -> e.x + sum), 0
	Ey = points.reduce ((sum, e) -> e.y + sum), 0
	{avgX: Ex/points.length, avgY: Ey/points.length}

@lineOffset = (lineFn, averagePoint) ->

@randomPoints = (count, minX, minY, maxX, maxY) ->
	{x: rand(minX, maxX), y: rand(minY, maxY)} for [0...count]

@rand = (min, max) -> min + Math.floor(Math.random()*max)

@draw = () ->
	height = 200
	width = 320
	radius = 10
	numPoints = 10
	$("#graph").css("width",width+"px").css("height",height+"px").css("background-color","gray")
	paper = Raphael "graph", width, height
	points = randomPoints(numPoints, radius, radius, width - radius, height - radius)
	#points = [{x:30, y:30}, {x: 50, y:50}]
	lineFn = linearRegression points
	circles = points.map (point) ->
		circle = paper.circle point.x, point.y, radius/2
		circle.attr {fill: "#fff", stroke: "none"}
	lineString = "M0,"+(lineFn(0))+"L"+width+","+(lineFn(width))
	line = paper.path(lineString)
	line.attr({fill: "none", "stroke-width": 4, "stroke-linecap": "round"})
	
$(document).ready -> draw()

#linearRegression([1,1], [2,2]) == [0, 1]
#linearRegression([[1,2], [3,5.2], [4,6.8], [5,8.4], [9,14.8]]) == [0.4, 1.6]

#class @LinearRegression
#	constructor: (@points) ->
#	points: () -> @points
