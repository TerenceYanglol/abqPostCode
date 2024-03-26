function vtkUnstrOutput(Coor,eleNodeTri,eleNodeQuad,fieldValue,filename)
% vtkUnstrOutput, output unstructure mesh to vtk file.
%   vtkUnstrOutput(Coor,eleNodeTri,eleNodeQuad,fieldValue,filename)
%   coordinates, triangle elements, quadrilateral elements, nodal value, file name
    
    eleNodeTri = eleNodeTri-1; % element node index start from 0
    eleNodeQuad = eleNodeQuad-1; % element node index start from 0
    nNode = size(Coor,1);
    
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
    % number of elements and number of integer to write
    nElementTri = size(eleNodeTri,1);
    nElementQuad = size(eleNodeQuad,1);
    nElement = nElementTri + nElementQuad;
    nNE = nElementTri*4+nElementQuad*5; % number of integer to write
    fprintf(fid,'CELLS %d %d\n',nElement,nNE); %number of elements and number of integer to write
    % Checking triangles
    if isempty(eleNodeTri) == 0
        nTriElement = size(eleNodeTri,1);
        eleWriteTri = [3*ones(nTriElement,1),eleNodeTri];
        eleTypeTri = 5*ones(nTriElement,1);
        fprintf(fid,'%d %d %d %d \n',eleWriteTri');
    end
    % Checking quadrilaterals
    if isempty(eleNodeQuad) == 0
        nQuadElement = size(eleNodeQuad,1);% number of elements 
        eleWriteQuad = [4*ones(nQuadElement,1),eleNodeQuad];
        eleTypeQuad = 9*ones(nQuadElement,1);
        fprintf(fid,'%d %d %d %d %d\n',eleWriteQuad');
    end
    fprintf(fid, '\n');

    fprintf(fid,'CELL_TYPES %d\n',nElement); %number of elements
    % Cell types
    if isempty(eleNodeTri) == 0        
        fprintf(fid,'%d  \n',eleTypeTri');
    end
    if isempty(eleNodeQuad) == 0
        fprintf(fid,'%d  \n',eleTypeQuad');
    end
    fprintf(fid, '\n');
    
    %Fields
    %Fields on nodes
    fprintf(fid,'POINT_DATA %d \n',nNode); %number of nodes
    %Scalar field
    fprintf(fid,'SCALARS Temperature float 1\nLOOKUP_TABLE default\n');
    fprintf(fid,'%.6f \n',fieldValue');
    
    fclose(fid);
end




