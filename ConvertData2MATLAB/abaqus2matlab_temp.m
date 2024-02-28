clear;
close all;

% for i = 1:40

    fold_path = 'C:\temp\Curve_Cylinder\CurveCheck\2mm\2mm-Case\Coarse-Ori-Bilinear\frames\';
    file_name = [fold_path ,'temperature*.txt'];
    fstruct = dir(file_name);
    total_files = size(fstruct,1);
    save_path = fold_path;
    if ~exist(save_path,'dir')
        mkdir(save_path);
    end
    %% load temperature
    for ifiles = 1:total_files
        temperature_file = fopen([fold_path,'/temperature',int2str(ifiles),'.txt'],'r');
        formatSpec = '%f';
        That = fscanf(temperature_file,formatSpec);
        fclose(temperature_file);

        save([save_path,['/That',int2str(ifiles)]],'That'); 
    end
% end

















































