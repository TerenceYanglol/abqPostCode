from abaqus import *
from abaqusConstants import *
from odbAccess import *
import os
import numpy as np


set_path = r'C:\Study\2_Curve_Boundary\Figure4\flux_That'
os.chdir(set_path)

folder_path = r'C:\temp\Curve_Cylinder'
file_name = r'\Job-02mm-CoarseNewInt.odb'
file_path = folder_path + file_name
my_odb = openOdb(file_path)

step_name = 'heat-1'
j = 0
time_step = []
for i_Frame in my_odb.steps[step_name].frames:
    temp = []
    time_step.append(i_Frame.frameValue)
    field_values = i_Frame.fieldOutputs['NT11'].values
    for field_value in field_values:
        temp.append(field_value.data)
    j = j+1

    name = 'temperature'+ str(j) + '.txt'
    f = open(name, "w")
    np.savetxt(f, temp, delimiter=" ", fmt="%.6E") # point coordinates
    f.write('\n')
    f.close()

time_name = 't_vec' + '.txt'
f = open(time_name, "w")
np.savetxt(f, time_step, delimiter=" ", fmt="%.6E") # point coordinates
f.write('\n')
f.close()

my_odb.close()
    
    