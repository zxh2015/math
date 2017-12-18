clear; close all; clc;
dbstop error;
warning off;

% restoredefaultpath;
% cd ..
% path(path, genpath(pwd));
% tic;
%% 求出方差较大的基因
[diff]      = xlsread('diff.xlsx');
% [f]      = xlsread('f.xlsx');
% var_f       = var(f);
var_diff    = var(diff')';
% [rs_1]    = xlsread('rs73.xlsx');
% [rs_1]    = xlsread('rs35.xlsx');
[rs_1]    = xlsread('rs9.xlsx');
N=300;
NameFile = strcat({'gene_'},num2str((1:N)','%-d'));
for i=1:N
  eval(['importdata ' NameFile{i} '.dat ']);
  rs{:,i}    = ans;
  rsindex(i,:)    = length(rs{:,i});
end
for i=1:300
gene_var(i,:) =var( var_diff(1:rsindex(i),:));
end
figure(1)
plot(1:300,gene_var, '+b', 'Markersize', 10, 'Linewidth', 3);
xlabel('基因数');
ylabel('方差');
% gene_neg = find(gene_var>=1800);
gene_neg = find(gene_var>=1800);
num_gene_neg = length(gene_neg);
% toc;
plot(1:300,gene_var, '+b', 'Markersize', 10, 'Linewidth', 3);
xlabel('基因');
ylabel('卡方');

%% 找到含有致病位点的基因
x=1:N;
gene_label = [x' rsindex];
% gene_com    = gene_label(1,2);
gene_com    = 0;
 j=1;
    for i=1:300
        if gene_com     <= rs_1(j)
            gene_com    = gene_com+gene_label(i,2);
        else
             gene_neg_index(j,:) = gene_label(i,1);
             j=j+1;
        end
      
    end
%% 找出致病基因
gene_varneg  = gene_neg;
gene_rsneg   = gene_neg_index;
k=1;
for i= 1:length(gene_varneg);
    c = gene_varneg(i);
    for j = 1:length(gene_rsneg)
        if c == gene_rsneg(j)
            gene_fin_neg(k) = c; 
            k=k+1;
        end
    end
end
index =find(gene_fin_neg~=0);
gene__neg = gene_fin_neg(index);
neggene   = [index' gene__neg'];
xlswrite('neggene.xlsx',neggene);


    
    
    
     












