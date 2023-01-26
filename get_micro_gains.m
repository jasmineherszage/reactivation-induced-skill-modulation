function microGains=get_micro_gains(speedCell)
% Input: an n by 1 cell array with each cell conataining an array of
% speed of for correct sequence.

online_gains=zeros(length(speedCell),1);
offline_gains=zeros(length(speedCell)-1,1);

for i=1:length(speedCell)-1
    if isempty(speedCell{i,1})
        online_gains(i,1)=NaN;
        offline_gains(i,1)=NaN;
    elseif isempty(speedCell{i+1,1})
        online_gains(i,1)=speedCell{i,1}(end,1)-speedCell{i,1}(1,1);
        offline_gains(i,1)=NaN;
    else
        online_gains(i,1)=speedCell{i,1}(end,1)-speedCell{i,1}(1,1);
        offline_gains(i,1)=speedCell{i+1,1}(1,1)-speedCell{i,1}(end,1);
    end
end

%last trial
online_gains(end,1)=speedCell{end,1}(end,1)-speedCell{end,1}(1,1);

microGains.online=online_gains;
microGains.offline=offline_gains;

end