#!/bin/env python3
import matplotlib.pyplot as plt
import numpy as np
import sys

def plot(filename):
    plt.title('Histogram Grades')
    data = []
    with open(filename, 'r') as f:
        for l in f:
            data.append(float(l.strip().replace(',','.')))

    print(data)
    plt.hist(data, rwidth=.8, bins=np.arange(min(data), max(data)+2) - 0.5)

    plt.xticks(np.arange(min(data), max(data)+1, 1.0))
    plt.ylabel('Count')
    plt.title('Histogram')
    plt.show()

    # quantiles = np.quantile(data, np.array([0.00, 0.25, 0.50, 0.75, 1.00]))
    quantiles = np.quantile(data, np.array([0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]))
    plt.figure()
    plt.vlines(quantiles, [0] * quantiles.size, [1] * quantiles.size, color='b', ls=':', lw=0.5, zorder=0)
    plt.boxplot(data, vert=False, manage_ticks=True)
    plt.title('Boxplot')
    plt.show()

if __name__=="__main__":
    plot(sys.argv[1])
