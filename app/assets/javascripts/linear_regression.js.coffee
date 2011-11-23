@linearRegression = (points) ->
	Exy = points.reduce ((sum, e) -> e[0] * e[1] + sum), 0
	Ex = points.reduce ((sum, e) -> e[0] + sum), 0
	Ey = points.reduce ((sum, e) -> e[1] + sum), 0
	Exx = points.reduce ((sum, e) -> e[0] * e[0] + sum), 0

	M = points.length
	w1 = (M*Exy - Ex*Ey)/(M*Exx - Ex*Ex)
	w0 = (Ey - w1*Ex)/M
	#console.log(Exy, Ex, Ey, Exx, M, w1, w0)
	[w0, w1]

#linearRegression([1,1], [2,2]) == [0, 1]
#linearRegression([[1,2], [3,5.2], [4,6.8], [5,8.4], [9,14.8]]) == [0.4, 1.6]

#class @LinearRegression
#	constructor: (@points) ->
#	points: () -> @points
