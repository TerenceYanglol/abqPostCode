from abaqus import *
from abaqusConstants import *
from odbAccess import *
import os
import numpy as np


setPath = r'C:\temp\Curve_Cylinder\CurveCheck\2mm\2mm-Case\Coarse-Ori-Bilinear\frames'
os.chdir(setPath)

folder_path = r'C:\temp\Curve_Cylinder'
file_name = r'\Job-02mm-CoraseOri-Bilinear.odb'
file_path = folder_path + file_name
my_odb = openOdb(file_path)

# extract nodes and elements
nodes, elements_tet, elements_hex = [],[],[]
instance_name =  "PART-2MM-COARSEMESH-BILINEAR-1"
instance = my_odb.rootAssembly.instances[instance_name]

f = open('elements.txt', "w")
for element in instance.elements:
        np.savetxt(f,[element.connectivity], fmt="%.d",delimiter=" ") 
f.close()

for node in instance.nodes:
    nodes.append(node.coordinates)

# extract values and surfaces
surf = [instance.surfaces['SURFBC'],instance.surfaces['SURFTOP']]
surf_elements = []

# boundary elements
f = open('Boundary.txt', "w")
for sufaces in surf:
    for element in sufaces.elements:
        np.savetxt(f, [element.connectivity], delimiter=" ", fmt="%.d") # point coordinates
f.close()

f = open('nodes.txt', "w")
np.savetxt(f, nodes, delimiter=" ", fmt="%.6E") # point coordinates
f.write('\n')
f.close()

f = open('BoundaryIndex.txt', "w")
for sufaces in surf:
    for face in sufaces.faces:
        f.write(face.name + '\n') # point coordinates
f.close()

