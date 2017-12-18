clc;clear all; close all;
dbstop if error
multi_phenos    = importdata('multi_phenos.txt');
Num_data        = xlsread('Num_data');
for i = 1:length(multi_phenos(1,:))
    data_label     = [multi_phenos(:,i) Num_data];
    data_phenos    = sortrows(data_label,1);
    New_data       = data_phenos(:,2:9446);
    [f ]             = chi(New_data);
    x=[1:9445];
    %      P   = 1-chi2cdf(f,2);
    % rs = find(P<=0.005);
    figure(i);
    plot(1:length(f),f, '+b', 'Markersize', 10, 'Linewidth', 3);
    xlabel('Î»µã');
    ylabel('¿¨·½');
    print(gcf,'-djpeg',[num2str(i),'.jpeg']);
    
    rs(i)  =length( find(f>=9.21));
    k{1,i}=   find(f>=9.21);
end

sound(sin(2*pi*25*(1:4000)/100));