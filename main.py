#!usr/bin/env python
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import animation
import math
from random import random
from random import randint
from flavo import flavo

def birth():
    xs,ys,theta,random_x,random_y = calc_param(0,100,0,100,num,length)
    flavos.append(flavo(xs,ys,length,theta,random_x,random_y))
    return flavos

def drawDDA(x1,y1,x2,y2):
    xs = []
    ys = []
    x,y = x1,y1
    lengt = (x2-x1) if abs(x2-x1) > abs(y2-y1) else (y2-y1)
    dx = (x2-x1)/float(lengt)
    dy = (y2-y1)/float(lengt)
    xs.append(int(x))
    ys.append(int(y))
    for i in range(abs(int(lengt))):
        x += dx
        y += dy
        xs.append((int(x)))
        ys.append((int(y)))
    #plt.plot(xs,ys)
    #plt.ylim(-300, 300)
    #plt.xlim(-300, 300)
    #plt.show()
    return xs,ys

def calc_param(MIN_X,MAX_X,MIN_Y,MAX_Y,num,length):
    random_x = int(MAX_X*random())
    random_y = int(MAX_Y*random())
    theta = 2*math.pi*random()
    x = int(random_x + length*math.cos(theta))
    y = int(random_y + length*math.sin(theta))
    xs,ys = drawDDA(x,y,random_x,random_y)
    return xs,ys,theta,random_x,random_y

def calc_param_aux(flavo,mode):
    if mode=='yes':
        flavo.length += 1
    x = int(flavo.xs[-1] + flavo.length*math.cos(flavo.theta))
    y = int(flavo.ys[-1] + flavo.length*math.sin(flavo.theta))
    flavo.xs,flavo.ys = drawDDA(x,y,flavo.xs[-1],flavo.ys[-1])
    return flavo

def random_walk(flavo,dt,time):
    flavo = death(flavo,time)
    if flavo.alive == 'yes':
        prob = random()
        if prob>0.8:
            flavo = growth(flavo,'yes')
        else:
            flavo = growth(flavo,'no')
        lotto = random()
        a = (flavo.ys[-1] - flavo.ys[0]) / (flavo.xs[-1] - flavo.xs[0])
        b = (flavo.ys[0] - a * flavo.xs[0])
        print("a= ", a, "b= ", b)
        if lotto > 0.1:  # front
            for i in range(len(flavo.xs)):
                flavo.ys[i] = a*(flavo.xs[i]+dt)+b
                flavo.xs[i] = flavo.xs[i]+dt
        else:  # back
            for i in range(len(flavo.xs)):
                flavo.ys[i] = a*(flavo.xs[i]-dt)+b
                flavo.xs[i] = flavo.xs[i]-dt
        time += 1
    return flavo,time

def random_spin(xs,ys,length):
    tzoker = (math.pi/18)*random()
    new_x,new_y = np.zeros((len(xs))),np.zeros((len(ys)))
    new_x[-1] = length*math.cos(tzoker)
    new_y[-1] = length*math.sin(tzoker)
    new_x[0] = xs[0]
    new_y[0] = ys[0]
    xs,ys = drawDDA(new_x[0],new_y[0],new_x[-1],new_y[-1])
    return xs,ys

def growth(flavo,mode):
    flavo = calc_param_aux(flavo,mode)
    return flavo

def death(flavo,time):
    if flavo.alive == 'yes':
        lotto = random()
        if lotto > 0.8/(time/1000):
            flavo.xs = []
            flavo.ys = []
            flavo.alive = 'no'
            print("i died\n")
            return flavo
    return flavo

def animate(i):
    global time
    flavos[0],time = random_walk(flavos[0],dt,time)
    #x__s,y__s = random_spin(x_s,y_s,length)
    line.set_xdata(flavos[0].xs)
    line.set_ydata(flavos[0].ys)
    return line,

def init():
    line.set_data([],[])
    return line,

flavos = []
dt = 1
time = 1
num = 1
length = 30
MIN_X = 0
MIN_Y = 0
MAX_X = 100
MAX_Y = 100
flavos = birth()
fig = plt.figure()
ax = fig.add_subplot(1,1,1)
plt.ylim(-300,300)
plt.xlim(-300,300)
line, = ax.plot([],[],lw=2)

anim = animation.FuncAnimation(fig, animate, init_func=init, frames=200, interval=100, blit=True)
plt.show()

