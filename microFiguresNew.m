% Plot micro learning figures
%   a line plot showing total micro learning in black, online micro learning
%   in blue, and offline micro learning in red.

figure
% Group: Reactivation + Interference
numSBJ=size(Reactiv_int_stats.microOnline,1);
total_learning_RI=zeros(numSBJ,1);
microOffline_RI=zeros(numSBJ,1);
microOnline_RI=zeros(numSBJ,1);

for i=1:numSBJ
    total_learning_RI(i)=nansum(Reactiv_int_stats.microOnline(i,1:5))+nansum(Reactiv_int_stats.microOffline(i,1:5));
    microOffline_RI(i)=nansum(Reactiv_int_stats.microOffline(i,1:5));
    microOnline_RI(i)=nansum(Reactiv_int_stats.microOnline(i,1:5));
end
MICRO_Matrix_RI=[total_learning_RI, microOffline_RI, microOnline_RI];

eT=nanstd(Reactiv_int_stats.microOffline(:,1:5)+Reactiv_int_stats.microOnline(:,1:5))/sqrt(numSBJ);
yT=nanmean(Reactiv_int_stats.microOffline(:,1:5))+nanmean(Reactiv_int_stats.microOnline(:,1:5));
eOf=nanstd(Reactiv_int_stats.microOffline(:,1:5))/sqrt(numSBJ);
eOn=nanstd(Reactiv_int_stats.microOnline(:,1:5))/sqrt(numSBJ);
x = linspace(1, 5, 5);
boundedline(x,yT,eT,'k',x,nanmean(Reactiv_int_stats.microOffline(:,1:5)),eOf,'r',x,nanmean(Reactiv_int_stats.microOnline(:,1:5)),eOn,'b')
%title('Reactivation | No Interference')
hold on

% Group: Reactivation + NoInterference (called here int only)
numSBJ=size(int_only_stats.microOnline,1);
total_learning_IO=zeros(numSBJ,1);
microOffline_IO=zeros(numSBJ,1);
microOnline_IO=zeros(numSBJ,1);

for i=1:numSBJ
    total_learning_IO(i)=nansum(int_only_stats.microOnline(i,1:5))+nansum(int_only_stats.microOffline(i,1:5));
    microOffline_IO(i)=nansum(int_only_stats.microOffline(i,1:5));
    microOnline_IO(i)=nansum(int_only_stats.microOnline(i,1:5));
end
MICRO_Matrix_IO=[total_learning_IO, microOffline_IO, microOnline_IO];


eT=nanstd(int_only_stats.microOffline(:,1:5)+int_only_stats.microOnline(:,1:5))/sqrt(numSBJ);
yT=nanmean(int_only_stats.microOffline(:,1:5))+nanmean(int_only_stats.microOnline(:,1:5));
eOf=nanstd(int_only_stats.microOffline(:,1:5))/sqrt(numSBJ);
eOn=nanstd(int_only_stats.microOnline(:,1:5))/sqrt(numSBJ);
x = linspace(1, 5, 5);

%title('Reactivation & interference')
boundedline(x,yT,eT,'--k',x,nanmean(int_only_stats.microOffline(:,1:5)),eOf,'--r',x,nanmean(int_only_stats.microOnline(:,1:5)),eOn,'--b')
title(['Experiment 1 - Test'])
hold off


figure
boundedline(x,yT,eT,'--k',x,nanmean(int_only_stats.microOffline(:,11:17)),eOf,'--r',x,nanmean(int_only_stats.microOnline(:,11:17)),eOn,'--b')
hold on
boundedline(x,yT,eT,'k',x,nanmean(Reactiv_int_stats.microOffline(:,16:22)),eOf,'r',x,nanmean(Reactiv_int_stats.microOnline(:,16:22)),eOn,'b')
%title('Reactivation | No Interference')
title('Experiment 1 - Retest')
hold off


%%
% Group: Reactivation Only
numSBJ=size(react_only_stats.microOnline,1);
total_learning_RO=zeros(numSBJ,1);
microOffline_RO=zeros(numSBJ,1);
microOnline_RO=zeros(numSBJ,1);

for i=1:numSBJ
    total_learning_RO(i)=nansum(react_only_stats.microOnline(i,1:5))+nansum(react_only_stats.microOffline(i,1:5));
    microOffline_RO(i)=nansum(react_only_stats.microOffline(i,1:5));
    microOnline_RO(i)=nansum(react_only_stats.microOnline(i,1:5));
end
MICRO_Matrix_RO=[total_learning_RO, microOffline_RO, microOnline_RO];


eT=nanstd(react_only_stats.microOffline(:,1:5)+react_only_stats.microOnline(:,1:5))/sqrt(numSBJ);
yT=nanmean(react_only_stats.microOffline(:,1:5))+nanmean(react_only_stats.microOnline(:,1:5));
eOf=nanstd(react_only_stats.microOffline(:,1:5))/sqrt(numSBJ);
eOn=nanstd(react_only_stats.microOnline(:,1:5))/sqrt(numSBJ);
x = linspace(1, 5, 5);
subplot(2,2,3)
boundedline(x,yT,eT,'k',x,nanmean(react_only_stats.microOffline(:,1:5)),eOf,'r',x,nanmean(react_only_stats.microOnline(:,1:5)),eOn,'b')
title('Reactivation')



% Group: No Reactivation (called here test-retest)
numSBJ=size(test_retest_stats.microOnline,1);
total_learning_NR=zeros(numSBJ,1);
microOffline_NR=zeros(numSBJ,1);
microOnline_NR=zeros(numSBJ,1);

for i=1:numSBJ
    total_learning_NR(i)=nansum(test_retest_stats.microOnline(i,1:5))+nansum(test_retest_stats.microOffline(i,1:5));
    microOffline_NR(i)=nansum(test_retest_stats.microOffline(i,1:5));
    microOnline_NR(i)=nansum(test_retest_stats.microOnline(i,1:5));
end
MICRO_Matrix_NR=[total_learning_NR, microOffline_NR, microOnline_NR];

eT=nanstd(test_retest_stats.microOffline(:,1:5)+test_retest_stats.microOnline(:,1:5))/sqrt(numSBJ);
yT=nanmean(test_retest_stats.microOffline(:,1:5))+nanmean(test_retest_stats.microOnline(:,1:5));
eOf=nanstd(test_retest_stats.microOffline(:,1:5))/sqrt(numSBJ);
eOn=nanstd(test_retest_stats.microOnline(:,1:5))/sqrt(numSBJ);
x = linspace(1, 5, 5);
subplot(2,2,4)
boundedline(x,yT,eT,'k',x,nanmean(test_retest_stats.microOffline(:,1:5)),eOf,'r',x,nanmean(test_retest_stats.microOnline(:,1:5)),eOn,'b')
title('No Reactivation')
