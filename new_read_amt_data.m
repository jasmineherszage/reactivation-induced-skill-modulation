function [AMTdata,NonCompleted]=new_read_amt_data()
    % Reads all data files and creates a matrix containing pre-processed 
    % data from the online motor sequence learning task, using the 41324 sequence
    % Use this version to get data for the InterferenceReactivation group in Experiment #1
    % Run this file from a folder containing all the data files (no divided to subfolders)

    
    load('filesByGroups.mat');
    numSubjects=size(ReactivationInt,2);
    NonCompleted=NaN; %in case there aren't any
    
    AMTdata(numSubjects)=struct();
    j=1;
    for i=1:numSubjects
        sbjFile=[ReactivationInt(i).files];
        X=readmatrix(sbjFile,'OutputType','string');

        sizeTMP=size(X);
        if (sizeTMP(1,1)<22)
            %shouldn't happen since these files are excluded in
            %divideToCondition.m but anyway...
            NonCompleted{j,1}=sbjFile;
            j=j+1;
        else            

            AMTdata(i).name=X(1,11);
            AMTdata(i).os=X(1,16);
            AMTdata(i).Gender=ReactivationInt(i).Gender;
            AMTdata(i).Age=ReactivationInt(i).age;
            AMTdata(i).Hand=ReactivationInt(i).Hand;
            AMTdata(i).Consent=ReactivationInt(i).Consent;

            AMTdata(i).trial1=strip(strip(erase(erase(X(1,1),'"'),','),']'),'[');
            AMTdata(i).trial2=strip(strip(erase(erase(X(2,1),'"'),','),']'),'[');
            AMTdata(i).trial3=strip(strip(erase(erase(X(3,1),'"'),','),']'),'[');
            AMTdata(i).trial4=strip(strip(erase(erase(X(4,1),'"'),','),']'),'[');
            AMTdata(i).trial5=strip(strip(erase(erase(X(5,1),'"'),','),']'),'[');
            AMTdata(i).trial6=strip(strip(erase(erase(X(6,1),'"'),','),']'),'[');
            AMTdata(i).trial7=strip(strip(erase(erase(X(7,1),'"'),','),']'),'[');
            AMTdata(i).trial8=strip(strip(erase(erase(X(8,1),'"'),','),']'),'[');
            AMTdata(i).trial9=strip(strip(erase(erase(X(9,1),'"'),','),']'),'[');
            AMTdata(i).trial10=strip(strip(erase(erase(X(10,1),'"'),','),']'),'[');
            AMTdata(i).trial11=strip(strip(erase(erase(X(11,1),'"'),','),']'),'[');
            AMTdata(i).trial12=strip(strip(erase(erase(X(12,1),'"'),','),']'),'[');
            AMTdata(i).trial13=strip(strip(erase(erase(X(13,1),'"'),','),']'),'[');
            AMTdata(i).trial14=strip(strip(erase(erase(X(14,1),'"'),','),']'),'[');
            AMTdata(i).trial15=strip(strip(erase(erase(X(15,1),'"'),','),']'),'[');
            AMTdata(i).trial16=strip(strip(erase(erase(X(16,1),'"'),','),']'),'[');
            AMTdata(i).trial17=strip(strip(erase(erase(X(17,1),'"'),','),']'),'[');
            AMTdata(i).trial18=strip(strip(erase(erase(X(18,1),'"'),','),']'),'[');
            AMTdata(i).trial19=strip(strip(erase(erase(X(19,1),'"'),','),']'),'[');
            AMTdata(i).trial20=strip(strip(erase(erase(X(20,1),'"'),','),']'),'[');
            AMTdata(i).trial21=strip(strip(erase(erase(X(21,1),'"'),','),']'),'[');
            AMTdata(i).trial22=strip(strip(erase(erase(X(22,1),'"'),','),']'),'[');

            numCorrect=zeros(1,22);
            accuracy=zeros(1,22);
            
            tmp2=AnalyzeSequences(cellstr(AMTdata(i).trial1),'41324');
            numCorrect(1,1)=tmp2(1,1);
            accuracy(1,1)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata(i).trial2),'41324');
            numCorrect(1,2)=tmp2(1,1);
            accuracy(1,2)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata(i).trial3),'41324');
            numCorrect(1,3)=tmp2(1,1);
            accuracy(1,3)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata(i).trial4),'41324');
            numCorrect(1,4)=tmp2(1,1);
            accuracy(1,4)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata(i).trial5),'41324');
            numCorrect(1,5)=tmp2(1,1);
            accuracy(1,5)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata(i).trial6),'41324');
            numCorrect(1,6)=tmp2(1,1);
            accuracy(1,6)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata(i).trial7),'42314');
            numCorrect(1,7)=tmp2(1,1);
            accuracy(1,7)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata(i).trial8),'41324');
            numCorrect(1,8)=tmp2(1,1);
            accuracy(1,8)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata(i).trial9),'42314');
            numCorrect(1,9)=tmp2(1,1);
            accuracy(1,9)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata(i).trial10),'41324');
            numCorrect(1,10)=tmp2(1,1);
            accuracy(1,10)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata(i).trial11),'42314');
            numCorrect(1,11)=tmp2(1,1);
            accuracy(1,11)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata(i).trial12),'41324');
            numCorrect(1,12)=tmp2(1,1);
            accuracy(1,12)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata(i).trial13),'42314');
            numCorrect(1,13)=tmp2(1,1);
            accuracy(1,13)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata(i).trial14),'41324');
            numCorrect(1,14)=tmp2(1,1);
            accuracy(1,14)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata(i).trial15),'42314');
            numCorrect(1,15)=tmp2(1,1);
            accuracy(1,15)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata(i).trial16),'41324');
            numCorrect(1,16)=tmp2(1,1);
            accuracy(1,16)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata(i).trial17),'41324');
            numCorrect(1,17)=tmp2(1,1);
            accuracy(1,17)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata(i).trial18),'41324');
            numCorrect(1,18)=tmp2(1,1);
            accuracy(1,18)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata(i).trial19),'41324');
            numCorrect(1,19)=tmp2(1,1);
            accuracy(1,19)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata(i).trial20),'41324');
            numCorrect(1,20)=tmp2(1,1);
            accuracy(1,20)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata(i).trial21),'41324');
            numCorrect(1,21)=tmp2(1,1);
            accuracy(1,21)=tmp2(1,2);
            tmp2=AnalyzeSequences(cellstr(AMTdata(i).trial22),'41324');
            numCorrect(1,22)=tmp2(1,1);
            accuracy(1,22)=tmp2(1,2);

            AMTdata(i).CorrectSeq=numCorrect;
            AMTdata(i).Accuracy=accuracy;
            
            time_cell{1,1}=readTimes(X(1,2),strlength(AMTdata(i).trial1));
            time_cell{2,1}=readTimes(X(2,2),strlength(AMTdata(i).trial2));
            time_cell{3,1}=readTimes(X(3,2),strlength(AMTdata(i).trial3));
            time_cell{4,1}=readTimes(X(4,2),strlength(AMTdata(i).trial4));
            time_cell{5,1}=readTimes(X(5,2),strlength(AMTdata(i).trial5));
            time_cell{6,1}=readTimes(X(6,2),strlength(AMTdata(i).trial6));
            time_cell{7,1}=readTimes(X(7,2),strlength(AMTdata(i).trial7));
            time_cell{8,1}=readTimes(X(8,2),strlength(AMTdata(i).trial8));
            time_cell{9,1}=readTimes(X(9,2),strlength(AMTdata(i).trial9));
            time_cell{10,1}=readTimes(X(10,2),strlength(AMTdata(i).trial10));
            time_cell{11,1}=readTimes(X(11,2),strlength(AMTdata(i).trial11));
            time_cell{12,1}=readTimes(X(12,2),strlength(AMTdata(i).trial12));
            time_cell{13,1}=readTimes(X(13,2),strlength(AMTdata(i).trial13));
            time_cell{14,1}=readTimes(X(14,2),strlength(AMTdata(i).trial14));
            time_cell{15,1}=readTimes(X(15,2),strlength(AMTdata(i).trial15));
            time_cell{16,1}=readTimes(X(16,2),strlength(AMTdata(i).trial16));
            time_cell{17,1}=readTimes(X(17,2),strlength(AMTdata(i).trial17));
            time_cell{18,1}=readTimes(X(18,2),strlength(AMTdata(i).trial18));
            time_cell{19,1}=readTimes(X(19,2),strlength(AMTdata(i).trial19));
            time_cell{20,1}=readTimes(X(20,2),strlength(AMTdata(i).trial20));
            time_cell{21,1}=readTimes(X(21,2),strlength(AMTdata(i).trial21));
            time_cell{22,1}=readTimes(X(22,2),strlength(AMTdata(i).trial22));
            
            AMTdata(i).times=time_cell;
            
            speed_cell{1,1}=tappingSpeed_amt(AMTdata(i).trial1,time_cell{1,1},'41324');
            speed_cell{2,1}=tappingSpeed_amt(AMTdata(i).trial2,time_cell{2,1},'41324');
            speed_cell{3,1}=tappingSpeed_amt(AMTdata(i).trial3,time_cell{3,1},'41324');
            speed_cell{4,1}=tappingSpeed_amt(AMTdata(i).trial4,time_cell{4,1},'41324');
            speed_cell{5,1}=tappingSpeed_amt(AMTdata(i).trial5,time_cell{5,1},'41324');
            speed_cell{6,1}=tappingSpeed_amt(AMTdata(i).trial6,time_cell{6,1},'41324');
            speed_cell{7,1}=tappingSpeed_amt(AMTdata(i).trial7,time_cell{7,1},'42314');
            speed_cell{8,1}=tappingSpeed_amt(AMTdata(i).trial8,time_cell{8,1},'41324');
            speed_cell{9,1}=tappingSpeed_amt(AMTdata(i).trial9,time_cell{9,1},'42314');
            speed_cell{10,1}=tappingSpeed_amt(AMTdata(i).trial10,time_cell{10,1},'41324');
            speed_cell{11,1}=tappingSpeed_amt(AMTdata(i).trial11,time_cell{11,1},'42314');
            speed_cell{12,1}=tappingSpeed_amt(AMTdata(i).trial12,time_cell{12,1},'41324');
            speed_cell{13,1}=tappingSpeed_amt(AMTdata(i).trial13,time_cell{13,1},'42314');
            speed_cell{14,1}=tappingSpeed_amt(AMTdata(i).trial14,time_cell{14,1},'41324');
            speed_cell{15,1}=tappingSpeed_amt(AMTdata(i).trial15,time_cell{15,1},'42314');
            speed_cell{16,1}=tappingSpeed_amt(AMTdata(i).trial16,time_cell{16,1},'41324');
            speed_cell{17,1}=tappingSpeed_amt(AMTdata(i).trial17,time_cell{17,1},'41324');
            speed_cell{18,1}=tappingSpeed_amt(AMTdata(i).trial18,time_cell{18,1},'41324');
            speed_cell{19,1}=tappingSpeed_amt(AMTdata(i).trial19,time_cell{19,1},'41324');
            speed_cell{20,1}=tappingSpeed_amt(AMTdata(i).trial20,time_cell{20,1},'41324');
            speed_cell{21,1}=tappingSpeed_amt(AMTdata(i).trial21,time_cell{21,1},'41324');
            speed_cell{22,1}=tappingSpeed_amt(AMTdata(i).trial22,time_cell{22,1},'41324');
                           
            AMTdata(i).speed=speed_cell;
        end
    end
    
    %delete empty rows
    c=1;
    while c<length(AMTdata)+1
        if (isempty(AMTdata(c).name))
            AMTdata(c)=[];
            %no need to add 1 to c since the same line is now the next
        else
            c=c+1;
        end
    end
    
end