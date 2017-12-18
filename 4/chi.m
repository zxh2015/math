function [f] = chi(New_data)
% clc;clear all;close all;
% load New_data.mat;
for i=1:9445;
%     tic;
    y          = New_data(:,i);
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
%     toc;
 
    %diff(i,:) = y_pos_sum-y_neg_sum;
end
% x=[1:9445];
% P   = 1-chi2cdf(f,2);
% rs = find(P<=0.005);
% figure(1)
% plot(1:length(P),P, '+b', 'Markersize', 10, 'Linewidth', 3);
% % figure(2)
% % plot(1:length(rs_1),rs_1, '+b', 'Markersize', 10, 'Linewidth', 3);
% 
% 
% sound(sin(2*pi*25*(1:4000)/100));
% % toc;











