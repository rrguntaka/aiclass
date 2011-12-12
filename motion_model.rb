def update(k,d)
	(x,y,th) = k
	(dt,v,w) = d
	x1 = x + v * dt * Math.cos(th)
	y1 = y + v * dt * Math.sin(th)
	th1 = th + w * dt
	[x1,y1,th1]
end