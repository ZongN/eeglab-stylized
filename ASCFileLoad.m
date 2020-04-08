% 2019.11.11 ZongEn
global patientBirth
global patientName
global snapDate

% Auto get the .asc file
fileInf =  dir('..\*.asc');
filePath = strcat (fileInf.folder,"\",fileInf.name);

% Load 
fid = fopen(filePath,'r','n','UTF-8');

% Skip unused row
for i=1:9
    line = fgetl(fid);
    if i == 2
        patientInf = strsplit(line);
        patientBirth = patientInf(1,6);
        patientName = patientInf(1,5); 
    end
    if i == 3
        patientInf = strsplit(line);
        snapDate = patientInf(1,4);
    end
end

% Column name
clumnsname = fgetl(fid);
disp(clumnsname);
Re_matrix = strsplit(clumnsname,',');

% Adjust column names format
match = ['"',"-RF"];
Re_matrix = erase(Re_matrix,match);

% Read row data
rowdata = fscanf(fid,'%f',[length(Re_matrix),inf]);
rowdata = rowdata';

% Save to data
ASC_data = array2table(rowdata,'VariableNames',Re_matrix);

fclose(fid);

clearvars -except ASC_data patientBirth patientName snapDate

