% Upload all the data and activate all relevant functions to get the final 
% statistic metrices for each experimental group, excluding irrelevant data according to 
% the exclusion criteria mentioned in the publication


[Reactivation_int,bad]=new_read_amt_data;
[Int_only,bad]=new_read_amt_data_intOnly;
[React_only,bad]=new_read_amt_data_reactOnly;
Reactiv_int_stats=amt_get_stats(Reactivation_int);
react_only_stats=amt_get_stats(React_only);
int_only_stats=amt_get_stats(Int_only);
[test_retest,bad]=new_read_amt_data_testRetest;
test_retest_stats=amt_get_stats(test_retest);