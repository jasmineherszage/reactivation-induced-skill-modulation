function [AMTdata_ReactOnly,NonCompleted]=new_read_amt_data_reactOnly()
    % Reads all data files and creates a matrix containing pre-processed 
    % data from the online motor sequence learning task, using the 41324 sequence
    % Use this version to get data for the Reactivations group in Experiment #2
    % Run this file from a folder containing all the data files (no divided to subfolders)

    load('filesByGroups.mat');
    numSubjects=size(ReactivationOnly,2);
    NonCompleted=NaN; %in case there aren't any
    
    AMTdata_ReactOnly(numSubjects)=struct();
    j=1;
    for i=1:numSubjects
        sbjFile=[ReactivationOnly(i).files];
        X=readmatrix(sbjFile,'OutputType','string');

        sizeTMP=size(X);
        if (sizeTMP(1,1)<17)
            NonCompleted{j,1}=X(1,11);
            j=j+1;
        else            
            AMTdata_ReactOnly(i).name=X(1,11);
            AMTdata_ReactOnly(i).os=X(1,16);
            AMTdata_ReactOnly(i).Gender=ReactivationOnly(i).Gender;
            AMTdata_ReactOnly(i).Age=ReactivationOnly(i).age;
            AMTdata_ReactOnly(i).Hand=ReactivationOnly(i).Hand;
            AMTdata_ReactOnly(i).Consent=ReactivationOnly(i).Consent;
            
            AMTdata_ReactOnly(i).trial1=strip(strip(erase(erase(X(1,1),'"'),','),']'),'[');
            AMTdata_ReactOnly(i).trial2=strip(strip(erase(erase(X(2,1),'"'),','),']'),'[');
            AMTdata_ReactOnly(i).trial3=strip(strip(erase(erase(X(3,1),'"'),','),']'),'[');
            AMTdata_ReactOnly(i).trial4=strip(strip(erase(erase(X(4,1),'"'),','),']'),'[');
            AMTdata_ReactOnly(i).trial5=strip(strip(erase(erase(X(5,1),'"'),','),']'),'[');
            AMTdata_ReactOnly(i).trial6=strip(strip(erase(erase(X(6,1),'"'),','),']'),'[');
            AMTdata_ReactOnly(i).trial7=strip(strip(erase(erase(X(7,1),'"'),','),']'),'[');
            AMTdata_ReactOnly(i).trial8=strip(strip(erase(erase(X(8,1),'"'),','),']'),'[');
            AMTdata_ReactOnly(i).trial9=strip(strip(erase(erase(X(9,1),'"'),','),']'),'[');
            AMTdata_ReactOnly(i).trial10=strip(strip(erase(erase(X(10,1),'"'),','),']'),'[');
            AMTdata_ReactOnly(i).trial11=strip(strip(erase(erase(X(11,1),'"'),','),']'),'[');
            AMTdata_ReactOnly(i).trial12=strip(strip(erase(erase(X(12,1),'"'),','),']'),'[');
            AMTdata_ReactOnly(i).trial13=strip(strip(erase(erase(X(13,1),'"'),','),']'),'[');
            AMTdata_ReactOnly(i).trial14=strip(strip(erase(erase(X(14,1),'"'),','),']'),'[');
            AMTdata_ReactOnly(i).trial15=strip(strip(erase(erase(X(15,1),'"'),','),']'),'[');
            AMTdata_ReactOnly(i).trial16=strip(strip(erase(erase(X(16,1),'"'),','),']'),'[');
            AMTdata_ReactOnly(i).trial17=strip(strip(erase(erase(X(17,1),'"'),','),']'),'[');
           
            numCorrect=zeros(1,17);
            accuracy=zeros(1,17);
            
            tmp2=AnalyzeSequences(cellstr(AMTdata_ReactOnly(i).trial1),'41324');
            numCorrect(1,1)=tmp2(1,1);
            accuracy(1,1)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata_ReactOnly(i).trial2),'41324');
            numCorrect(1,2)=tmp2(1,1);
            accuracy(1,2)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata_ReactOnly(i).trial3),'41324');
            numCorrect(1,3)=tmp2(1,1);
            accuracy(1,3)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata_ReactOnly(i).trial4),'41324');
            numCorrect(1,4)=tmp2(1,1);
            accuracy(1,4)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata_ReactOnly(i).trial5),'41324');
            numCorrect(1,5)=tmp2(1,1);
            accuracy(1,5)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata_ReactOnly(i).trial6),'41324');
            numCorrect(1,6)=tmp2(1,1);
            accuracy(1,6)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata_ReactOnly(i).trial7),'41324');
            numCorrect(1,7)=tmp2(1,1);
            accuracy(1,7)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata_ReactOnly(i).trial8),'41324');
            numCorrect(1,8)=tmp2(1,1);
            accuracy(1,8)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata_ReactOnly(i).trial9),'41324');
            numCorrect(1,9)=tmp2(1,1);
            accuracy(1,9)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata_ReactOnly(i).trial10),'41324');
            numCorrect(1,10)=tmp2(1,1);
            accuracy(1,10)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata_ReactOnly(i).trial11),'41324');
            numCorrect(1,11)=tmp2(1,1);
            accuracy(1,11)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata_ReactOnly(i).trial12),'41324');
            numCorrect(1,12)=tmp2(1,1);
            accuracy(1,12)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata_ReactOnly(i).trial13),'41324');
            numCorrect(1,13)=tmp2(1,1);
            accuracy(1,13)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata_ReactOnly(i).trial14),'41324');
            numCorrect(1,14)=tmp2(1,1);
            accuracy(1,14)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata_ReactOnly(i).trial15),'41324');
            numCorrect(1,15)=tmp2(1,1);
            accuracy(1,15)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata_ReactOnly(i).trial16),'41324');
            numCorrect(1,16)=tmp2(1,1);
            accuracy(1,16)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata_ReactOnly(i).trial17),'41324');
            numCorrect(1,17)=tmp2(1,1);
            accuracy(1,17)=tmp2(1,2);
            
            AMTdata_ReactOnly(i).CorrectSeq=numCorrect;
            AMTdata_ReactOnly(i).Accuracy=accuracy;
            
            time_cell{1,1}=readTimes(X(1,2),strlength(AMTdata_ReactOnly(i).trial1));
            time_cell{2,1}=readTimes(X(2,2),strlength(AMTdata_ReactOnly(i).trial2));
            time_cell{3,1}=readTimes(X(3,2),strlength(AMTdata_ReactOnly(i).trial3));
            time_cell{4,1}=readTimes(X(4,2),strlength(AMTdata_ReactOnly(i).trial4));
            time_cell{5,1}=readTimes(X(5,2),strlength(AMTdata_ReactOnly(i).trial5));
            time_cell{6,1}=readTimes(X(6,2),strlength(AMTdata_ReactOnly(i).trial6));
            time_cell{7,1}=readTimes(X(7,2),strlength(AMTdata_ReactOnly(i).trial7));
            time_cell{8,1}=readTimes(X(8,2),strlength(AMTdata_ReactOnly(i).trial8));
            time_cell{9,1}=readTimes(X(9,2),strlength(AMTdata_ReactOnly(i).trial9));
            time_cell{10,1}=readTimes(X(10,2),strlength(AMTdata_ReactOnly(i).trial10));
            time_cell{11,1}=readTimes(X(11,2),strlength(AMTdata_ReactOnly(i).trial11));
            time_cell{12,1}=readTimes(X(12,2),strlength(AMTdata_ReactOnly(i).trial12));
            time_cell{13,1}=readTimes(X(13,2),strlength(AMTdata_ReactOnly(i).trial13));
            time_cell{14,1}=readTimes(X(14,2),strlength(AMTdata_ReactOnly(i).trial14));
            time_cell{15,1}=readTimes(X(15,2),strlength(AMTdata_ReactOnly(i).trial15));
            time_cell{16,1}=readTimes(X(16,2),strlength(AMTdata_ReactOnly(i).trial16));
            time_cell{17,1}=readTimes(X(17,2),strlength(AMTdata_ReactOnly(i).trial17));
            
            AMTdata_ReactOnly(i).times=time_cell;
            
            speed_cell{1,1}=tappingSpeed_amt(AMTdata_ReactOnly(i).trial1,time_cell{1,1},'41324');
            speed_cell{2,1}=tappingSpeed_amt(AMTdata_ReactOnly(i).trial2,time_cell{2,1},'41324');
            speed_cell{3,1}=tappingSpeed_amt(AMTdata_ReactOnly(i).trial3,time_cell{3,1},'41324');
            speed_cell{4,1}=tappingSpeed_amt(AMTdata_ReactOnly(i).trial4,time_cell{4,1},'41324');
            speed_cell{5,1}=tappingSpeed_amt(AMTdata_ReactOnly(i).trial5,time_cell{5,1},'41324');
            speed_cell{6,1}=tappingSpeed_amt(AMTdata_ReactOnly(i).trial6,time_cell{6,1},'41324');
            speed_cell{7,1}=tappingSpeed_amt(AMTdata_ReactOnly(i).trial7,time_cell{7,1},'41324');
            speed_cell{8,1}=tappingSpeed_amt(AMTdata_ReactOnly(i).trial8,time_cell{8,1},'41324');
            speed_cell{9,1}=tappingSpeed_amt(AMTdata_ReactOnly(i).trial9,time_cell{9,1},'41324');
            speed_cell{10,1}=tappingSpeed_amt(AMTdata_ReactOnly(i).trial10,time_cell{10,1},'41324');
            speed_cell{11,1}=tappingSpeed_amt(AMTdata_ReactOnly(i).trial11,time_cell{11,1},'41324');
            speed_cell{12,1}=tappingSpeed_amt(AMTdata_ReactOnly(i).trial12,time_cell{12,1},'41324');
            speed_cell{13,1}=tappingSpeed_amt(AMTdata_ReactOnly(i).trial13,time_cell{13,1},'41324');
            speed_cell{14,1}=tappingSpeed_amt(AMTdata_ReactOnly(i).trial14,time_cell{14,1},'41324');
            speed_cell{15,1}=tappingSpeed_amt(AMTdata_ReactOnly(i).trial15,time_cell{15,1},'41324');
            speed_cell{16,1}=tappingSpeed_amt(AMTdata_ReactOnly(i).trial16,time_cell{16,1},'41324');
            speed_cell{17,1}=tappingSpeed_amt(AMTdata_ReactOnly(i).trial17,time_cell{17,1},'41324');
            
            AMTdata_ReactOnly(i).speed=speed_cell;
        end
    end
    
    c=1;
    while c<length(AMTdata_ReactOnly)+1
        if (isempty(AMTdata_ReactOnly(c).name))
            AMTdata_ReactOnly(c)=[];
            %no need to add 1 to c since the same line is now the next
        else
            c=c+1;
        end
    end
 
end