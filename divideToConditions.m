% Identifies each file as to which experimental design did he participate in
% Returns lists of filenames according for each group

file_list=dir;
tmp=size(file_list);
num_of_files=tmp(1,1); 
ReactivationInt1(tmp)=struct();
ReactivationOnly1(tmp)=struct();
InterferenceOnly1(tmp)=struct();
testRetest1(tmp)=struct();
excluded(tmp)=struct(); %due to too few lines in the file
r=1;
int=1;
ro=1;
tere=1;
x=1;

for i=1:num_of_files
    if ~file_list(i).isdir & contains(file_list(i).name,'.csv')
        M=readmatrix(file_list(i).name);
        tmp=size(M);
        if tmp(1,1)==22 || tmp(1,1)==23
            ReactivationInt1(1,r).files=file_list(i).name;
            r=r+1;
        elseif tmp(1,1)==17 || tmp(1,1)==18
            %this might be any of the 2 control groups
            if M(8,8)==41324
                % this is a reactivation only subject
                ReactivationOnly1(1,ro).files=file_list(i).name;
                ro=ro+1;
            else
                InterferenceOnly1(1,int).files=file_list(i).name;
                int=int+1;
            end
        elseif tmp(1,1)==12
            testRetest1(1,tere).files=file_list(i).name;
            tere=tere+1;
        else
            excluded(1,x).files=file_list(i).name;
            x=x+1;
        end
    end
end
        
        
clear file_list;
clear i;
clear M;
clear tmp;
clear x;

ReactivationInt=ReactivationInt1(1:r-1);
ReactivationOnly=ReactivationOnly1(1:ro-1);
InterferenceOnly=InterferenceOnly1(1:int-1);
TestRetest=testRetest1(1:tere-1);
clear r;
clear ro;
clear int;
clear tere;
clear ReactivationInt1;
clear ReactivationOnly1;
clear InterferenceOnly1;
clear testRetest1;