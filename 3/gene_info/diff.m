clc,clear all; close all;
dbstop if error;
tic;
[Num_data]=xlsread('Num_data.xlsx');

%%

for i=1:9445;
%     tic;
    y          = Num_data(:,i);
    m          = length(y);
    sizeOut=10;
    yNew       = zeros(sizeOut * m, 1);
    iOne       = (0 : (m - 1)) * sizeOut +  y';
    yNew(iOne) = 1;
    yNew        = reshape(yNew, sizeOut, []);
    
    y_pos       =yNew(:,1:500)';
    y_neg       =yNew(:,501:1000)';
    y_pos_sum   = sum(y_pos);
    y_neg_sum   = sum(y_neg);
    y_sum       = sum(yNew');
    index  = find(y_sum~= 0 );
    
    pos = y_pos_sum(index);
    neg = y_neg_sum(index);
    sum_r = y_sum(index);   
    f(i,:) =sum(((pos-sum_r*0.5).^2)./(sum_r*0.5) + ((neg-sum_r*0.5).^2)./(sum_r*0.5));
 
    diff(i,:) = y_pos_sum-y_neg_sum;
end
;











