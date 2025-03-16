# Axes3D is needed for plotting 3D plots
from mpl_toolkits.mplot3d import Axes3D

# For interactive matplotlib sessions, turn on the matplotlib inline mode
#%matplotlib inline
get_iphython().run_line_magic("matplotlib", "inline")

mpl.rcParams.update({'font.size': 12})
mpl.rc('xtick', labelsize=12) 
mpl.rc('ytick', labelsize=12) 

# Dummy data
x = [1, 2, 3, 4, 5] # X-coordinates
y = [1, 2, 3, 4, 5] # Y-coordinates
z = [4, 10, 20, 5, 3] # Z-ccordinates

# Defining figure
fig = plt.figure(figsize = (8, 6), dpi = 90)

# Making 3D Plot using plot3D()
ax = plt.axes(projection = '3d')
ax.plot3D(x, y, z)

# Setting Axis labels
ax.set_xlabel('X-Axis')
ax.set_ylabel('Y-Axis')
ax.set_zlabel('Z-Axis')

# Showing the plot
plt.show()