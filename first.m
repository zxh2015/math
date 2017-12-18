clc,clear all; close all;
dbstop if error;
tic;
[data1 data2]=xlsread('genotype.xlsx');
[m n]=size(data2);
Num_data=zeros(size(data2));
for i=2:m
    for j=1:n
        switch data2{i,j}
            case 'AA'
                Num_data(i,j)=1;
            case 'TT'
                Num_data(i,j)=2;
            case 'CC'
                Num_data(i,j)=3;
            case 'GG'
                Num_data(i,j)=4;
            case 'TA'
                Num_data(i,j)=5;
            case 'CA'
                Num_data(i,j)=6;
            case 'CT'
                Num_data(i,j)=7;
            case 'GA'
                Num_data(i,j)=8;
            case 'GT'
                Num_data(i,j)=9;
            case 'GC'
                Num_data(i,j)=10;
            case 'AT'
                Num_data(i,j)=5;
            case 'AC'
                Num_data(i,j)=6;
            case 'TC'
                Num_data(i,j)=7;
            case 'AG'
                Num_data(i,j)=8;
            case 'TG'
                Num_data(i,j)=9;
            case 'CG'
                Num_data(i,j)=10;
                
        end
    end
end

Num_data    = Num_data(2:1001,:);
xlswrite('Num_data.xlsx',Num_data);

for i=1:9445;
%     tic;
    y          = Num_data(:,i);
    m          = length(y);
    sizeOut=10;
    yNew       = zeros(sizeOut * m, 1);
    iOne       = (0 : (m - 1)) * sizeOut +  y';
    yNew(iOne) = 1;
    yNew        = reshape(yNew, sizeOut, []);   
end
toc;
xlswrite(' yNew .xlsx', yNew);
sound(sin(2*pi*25*(1:4000)/100));








