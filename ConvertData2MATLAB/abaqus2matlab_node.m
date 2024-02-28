clear;
close all;
fold_path = 'C:\temp\Curve_Cylinder\CurveCheck\2mm\2mm-Case\Coarse-Ori-Bilinear\frames\';
%% read nodes and elements from txt file
type_of_element = 'C3D10';

switch type_of_element

    case 'C3D4'
        elements_file = fopen([fold_path,'elements.txt'],'r');
        formatSpec = '%d %d %d %d'; % set the data reading format, int decimal
        sizeA = [4 Inf];
        elements = fscanf(elements_file,formatSpec,sizeA);
        fclose(elements_file);
        elements = elements';
        
        nodes_file = fopen([fold_path,'nodes.txt'],'r');
        formatSpec = '%f %f %f %f'; % set the data reading format, float number
        sizeA = [3 Inf];
        nodes = fscanf(nodes_file,formatSpec,sizeA);
        fclose(nodes_file);
        nodes = nodes';
        
        load([fold_path,'t_vec.txt']);
        %% read boundary elements from txt file
        boundary_file = fopen([fold_path,'Boundary.txt'],'r');
        formatSpec = '%d %d %d %d';
        sizeA = [4 Inf];
        boundary_elements = fscanf(boundary_file,formatSpec,sizeA);
        fclose(boundary_file);
        boundary_elements = boundary_elements';
        
        boundary_index_file = fopen([fold_path,'BoundaryIndex.txt'],'r');
        formatSpec = '%s';
        sizeA = [5 Inf];
        boundary_index = fscanf(boundary_file,formatSpec,sizeA);
        fclose(boundary_file);
        boundary_index = boundary_index';
        number_index = zeros(size(boundary_index,1),1);
        for i = 1:size(boundary_index,1)
            number_index(i) = str2double(boundary_index(i,5));
        end
        
        
        %% boundary surfaces
        boundary_face = zeros(size(number_index,1),3);
        for i = 1:size(number_index,1)
            if number_index(i) ==1
               boundary_face(i,:) = [boundary_elements(i,1),boundary_elements(i,2),boundary_elements(i,3)];
            elseif number_index(i) ==2
                boundary_face(i,:) = [boundary_elements(i,1),boundary_elements(i,4),boundary_elements(i,2)];
            elseif number_index(i) ==3
                boundary_face(i,:) = [boundary_elements(i,2),boundary_elements(i,4),boundary_elements(i,3)];
            elseif number_index(i) ==4
                boundary_face(i,:) = [boundary_elements(i,3),boundary_elements(i,4),boundary_elements(i,1)];
            end
        end

    case 'C3D10'
        elements_file = fopen([fold_path,'elements.txt'],'r');
        formatSpec = '%d %d %d %d %d %d %d %d %d %d'; % set the data reading format, int decimal
        sizeA = [10 Inf];
        elements = fscanf(elements_file,formatSpec,sizeA);
        fclose(elements_file);
        elements = elements';
        
        nodes_file = fopen([fold_path,'nodes.txt'],'r');
        formatSpec = '%f %f %f'; % set the data reading format, float number
        sizeA = [3 Inf];
        nodes = fscanf(nodes_file,formatSpec,sizeA);
        fclose(nodes_file);
        nodes = nodes';
        
        load([fold_path,'t_vec.txt']);
        %% read boundary elements from txt file
        boundary_file = fopen([fold_path,'Boundary.txt'],'r');
        formatSpec = '%d %d %d %d %d %d %d %d %d %d';
        sizeA = [10 Inf];
        boundary_elements = fscanf(boundary_file,formatSpec,sizeA);
        fclose(boundary_file);
        boundary_elements = boundary_elements';
        
        boundary_index_file = fopen([fold_path,'BoundaryIndex.txt'],'r');
        formatSpec = '%s';
        sizeA = [5 Inf];
        boundary_index = fscanf(boundary_file,formatSpec,sizeA);
        fclose(boundary_file);
        boundary_index = boundary_index';
        number_index = zeros(size(boundary_index,1),1);
        for i = 1:size(boundary_index,1)
            number_index(i) = str2double(boundary_index(i,5));
        end
        
        
        %% boundary surfaces
        boundary_face = zeros(size(number_index,1),6);
        for i = 1:size(number_index,1)
            if number_index(i) ==1
               boundary_face(i,:) = [boundary_elements(i,1),boundary_elements(i,5),boundary_elements(i,2),boundary_elements(i,6),boundary_elements(i,3),boundary_elements(i,7)];
            elseif number_index(i) ==2
                boundary_face(i,:) = [boundary_elements(i,1),boundary_elements(i,8),boundary_elements(i,4),boundary_elements(i,9),boundary_elements(i,2),boundary_elements(i,5)];
            elseif number_index(i) ==3
                boundary_face(i,:) = [boundary_elements(i,2),boundary_elements(i,9),boundary_elements(i,4),boundary_elements(i,10),boundary_elements(i,3),boundary_elements(i,6)];
            elseif number_index(i) ==4
                boundary_face(i,:) = [boundary_elements(i,3),boundary_elements(i,10),boundary_elements(i,4),boundary_elements(i,8),boundary_elements(i,1),boundary_elements(i,7)];
            end
        end

    otherwise
        disp('not included')
end


%% save file
save([fold_path,'elements'],'elements');
save([fold_path,'nodes'],'nodes');
save([fold_path,'boundary_face'],'boundary_face');
save([fold_path,'t_vec'],'t_vec');
















































