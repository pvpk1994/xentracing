import numpy as np
import matplotlib.pyplot as plt
import sys
#check whether plotly can be used to change the xticks, it only supports real date for now

def gantt(intervals):
    # draw the intervals out in gantt chart format
    counter = 0
    df = []
    names = []
    for n, times in intervals.items():
        names.append(n)
        for t in times:
            plt.barh(counter, t[1]-t[0], height = 0.2, left = t[0])
        counter += 1
            
    plt.xlim(0,1)
    plt.ylim(-1,2)
    plt.yticks([-1,0,1,2],["",names[0], names[1], ""])
    #plt.yticks()
    #plt.show()



if __name__=="__main__":
    file_name = sys.argv[1]
    names = set()
    time_intervals = {} # a dict, key is the machine's name, value is a list of tuples (start, interval)
    with open(file_name,"r") as f:
        line = f.readline()
        while line:
            ele = line.split()
            if ele[0] not in names:
                names.add(ele[0])
                time_intervals[ele[0]] = []
            time_intervals[ele[0]].append((float(ele[1]), float(ele[2])))
            line = f.readline()
        gantt(time_intervals)
        #save the file to correspoding png file
        fig_name = file_name.replace('.txt', '.png')
        plt.savefig(fig_name)
