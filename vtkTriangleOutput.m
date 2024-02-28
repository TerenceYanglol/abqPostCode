function vtkTriangleOutput(Coor,eleNode,fieldValue,filename)
    eleNode = eleNode-1;
    nNode = size(Coor,1);
    nElement = size(eleNode,1);
    eleWrite = [3*ones(nElement,1),eleNode];
    nNE = 4*nElement;
    eleType = 5*ones(nElement,1);
    
    fid = fopen(filename, 'w'); 
    % VTK files contain five major parts
    % VTK DataFile Version
    fprintf(fid, '# vtk DataFile Version 2.0\n');
    % Title
    fprintf(fid, 'VTK from Matlab Triangle \n');
    % File type
    fprintf(fid, 'ASCII\n');
    % Grid
    fprintf(fid, 'DATASET UNSTRUCTURED_GRID\n\n');
    % Points
    fprintf(fid,'POINTS %d float\n',nNode); %number of points
    fprintf(fid,'%.6f %.6f %.6f \n',Coor'); %point coordinates
    fprintf(fid, '\n');
    % Cells
    fprintf(fid,'CELLS %d %d\n',nElement,nNE); %number of elements and number of integer to write
    fprintf(fid,'%d %d %d %d \n',eleWrite'); %number of nodes per element and the nodes on the elements
    fprintf(fid, '\n');
    % Cell types
    fprintf(fid,'CELL_TYPES %d\n',nElement); %number of elements
    fprintf(fid,'%d  \n',eleType');
    fprintf(fid, '\n');
    
    %Fields
    %Fields on nodes
    fprintf(fid,'POINT_DATA %d \n',nNode); %number of nodes
    %Scalar field
    fprintf(fid,'SCALARS Temperature float 1\nLOOKUP_TABLE default\n');
    fprintf(fid,'%.6f \n',fieldValue');
    
    fclose(fid);

end
