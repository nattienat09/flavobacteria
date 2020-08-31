#!usr/bin/env python
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import animation
import math
from random import random
from random import randint

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
    global theta
    random_x = int(MAX_X*random())
    random_y = int(MAX_Y*random())
    theta = 2*math.pi*random()
    x = int(random_x + length*math.cos(theta))
    y = int(random_y + length*math.sin(theta))
    xs,ys = drawDDA(x,y,random_x,random_y)
    return xs,ys,theta

def calc_param_aux(rand_x,rand_y,theta,mode):
    global length
    if mode=='yes':
        length += 1
    x = int(rand_x + length*math.cos(theta))
    y = int(rand_y + length*math.sin(theta))
    xs,ys = drawDDA(x,y,rand_x,rand_y)
    return xs,ys,theta



def random_walk(xs,ys,dt,time):
    prob = random()
    '''if prob>0.6:
        xs,ys,_ = growth(xs,ys,'yes')
    else:
        xs,ys,_ = growth(xs,ys,'no')
    xs,ys = death(xs,ys,time)
    #lotto = randint(0,1)'''
    lotto = 0
    print(xs[-1]-xs[0])
    a = (ys[-1]-ys[0])/(xs[-1]-xs[0])
    b = (ys[0]-a*xs[0])*np.ones((len(xs)))
    print("a= ",a,"b= ",b)
    dts = dt * np.ones((len(xs)))
    if lotto == 0:#front
        ynew += a*dts + b
        xnew += dts 
    elif lotto == 1:#back
        ynew += -a*dts - b
        xnew -= dts 
    time += 1
    return xnew,ynew,time

def random_spin(xs,ys,length):
    tzoker = (math.pi/18)*random()
    new_x,new_y = np.zeros((len(xs))),np.zeros((len(ys)))
    new_x[-1] = length*math.cos(tzoker)
    new_y[-1] = length*math.sin(tzoker)
    new_x[0] = xs[0]
    new_y[0] = ys[0]
    xs,ys = drawDDA(new_x[0],new_y[0],new_x[-1],new_y[-1])
    return xs,ys

def growth(x_s,y_s,mode):
    x_s,y_s,theta1 = calc_param_aux(x_s[-1],y_s[-1],theta,mode)
    return x_s,y_s,theta1

def death(xs,ys,time):
    lotto = random()
    if lotto > 0.8/(time/1000): 
        xs = []
        ys = []
        print("i died\n")
        return xs,ys
    return xs,ys

    

def animate(i):
    global time
    x_s,y_s,time = random_walk(xs,ys,dt,time)
    #x__s,y__s = random_spin(x_s,y_s,length)
    line.set_xdata(x_s)
    line.set_ydata(y_s)
    return line,

def init():
    line.set_data([],[])
    return line,

dt = 30
time = 1
num = 1 
length = 30
MIN_X = 0
MIN_Y = 0 
MAX_X = 100
MAX_Y = 100
xs,ys,theta = calc_param(0,100,0,100,num,length)
fig = plt.figure()
ax = fig.add_subplot(1,1,1)
plt.ylim(-300,300)
plt.xlim(-300,300)
line, = ax.plot([],[],lw=2)

anim = animation.FuncAnimation(fig, animate, init_func=init, frames=200, interval=100, blit=True)
plt.show()
