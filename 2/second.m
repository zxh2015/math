clc,clear all; close all;
dbstop if error;

[Num_data]=xlsread('Num_data.xlsx');

 tic;
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
    
end
toc;
x=[1:9445];
xlswrite('f.xlsx', f);
% P   = 1-chi2cdf(f,2);
rs      = find(f >= 5.99);
rs_1    = find(f >= 9.21);
rs_2    = find(f >= 13.82);
figure(1)
plot(1:length(rs),rs, '+b', 'Markersize', 10, 'Linewidth', 3);
xlabel('致病位点');
ylabel('卡方');
print(gcf,'-djpeg',[num2str(1),'.jpeg']);
figure(2)
plot(1:length(rs_1),rs_1, '+b', 'Markersize', 10, 'Linewidth', 3);
xlabel('致病位点');
ylabel('卡方');
print(gcf,'-djpeg',[num2str(2),'.jpeg']);
figure(3)
plot(1:length(rs_2),rs_2, '+b', 'Markersize', 10, 'Linewidth', 3);
xlabel('致病位点');
ylabel('卡方');
print(gcf,'-djpeg',[num2str(3),'.jpeg']);
figure(4)
plot(1:length(f),f, '+b', 'Markersize', 10, 'Linewidth', 3);
xlabel('所有位点');
ylabel('卡方');
print(gcf,'-djpeg',[num2str(4),'.jpeg']);


sound(sin(2*pi*25*(1:4000)/100));
% toc;
% xlswrite('index.xlsx',index);











