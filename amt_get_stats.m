function stats=amt_get_stats(dataM)
    % Creates a struct including analyzed data
    % This function fits data from any of the experimental groups, creating a uniform sturct

    % Input: dataM as a data matrix that can be built using the "new_read_amt_data_" functions (different version for each experimental group)
    
    
    numOfSubjects=size(dataM,2);
    numOfTrials=length(dataM(1).CorrectSeq);
    corrSeqMat=zeros(numOfSubjects,numOfTrials);
    count=1;

    for i=1:numOfSubjects
        corrSeqMat(i,:)=dataM(i).CorrectSeq; 
        %change end-6 into n-4 if that's a 5 trials test (in the following
        %line)

        if((isempty(dataM(i).trial1)) || (length(find(dataM(i).CorrectSeq(1,2:5)<2))>0) || (length(find(dataM(i).CorrectSeq(1,end-6:end)<2))>0) || contains(dataM(i).Hand,'Left'))
            % exclusion criteria: 1st trial empty or trials 2:5 or test
            % trials with less than 2 correct sequences
            nameVec{count,1}=dataM(i).name;
            excluded_subjects(count,1)=i;
            count=count+1;
        else
            microOnline(i,:)=get_micro_gains(dataM(i).speed).online;
            microOffline(i,:)=get_micro_gains(dataM(i).speed).offline;
        end
    end
    stats.average=mean(corrSeqMat);
    stats.stdev=std(corrSeqMat);
    
    cleanMat=zeros(numOfSubjects-count+1,numOfTrials);
    test_slope=zeros(numOfSubjects-count+1,1);
    x=linspace(1,5,5);
    
    stats.bad_implementers=nameVec;
    stats.bad_by_numbers=excluded_subjects;
    
    k=1;f=1;didntConsent=0;femaleCount=0;
    while k<numOfSubjects+1
        % Users who reported to have their left hand as their dominant hand 
        % are already included in excluded_subjects
        if (~isempty(find(excluded_subjects==k)))
            k=k+1;
        elseif ~dataM(k).Consent
            didntConsent=didntConsent+1;
            k=k+1;
        else
            cleanMat(f,:)=dataM(k).CorrectSeq;
            cleanAccur(f,:)=dataM(k).Accuracy;
            cleanOnline(f,:)=microOnline(k,:);
            cleanOffline(f,:)=microOffline(k,:);
            p=polyfit(x,dataM(k).CorrectSeq(1,end-4:end),1);
            test_slope(f,1)=p(1);
            y=extractBefore(char(dataM(k).Age),'y');
            m=extractBetween(char(dataM(k).Age),'y ','mo');
            age(f,1)=NaN;
            if ~isempty(y)
                age(f,1)=str2double(y);
            end
            if ~isempty(m) && ~isnan(age(f,1))
                age(f,1)=age(f,1)+str2double(m)/12;
            end
            if contains(char(dataM(k).Gender),'F')
                femaleCount=femaleCount+1;
            end
            f=f+1; k=k+1;
        end
    end
    
    stats.clean_average=mean(cleanMat);
    stats.clean_stdev=std(cleanMat);
    stats.clean_accuracyAVG=mean(cleanAccur);
    stats.clean_accuracySTD=std(cleanAccur);
    stats.fullCleanData=cleanMat;
    stats.microOnline=cleanOnline;
    stats.microOffline=cleanOffline;
    stats.clean_slope=test_slope;
    stats.ages_clean=age;
    stats.female_count=femaleCount;
    stats.DidntConsent=didntConsent;
    
end