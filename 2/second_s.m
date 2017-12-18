clc;clear all; close all;
dbstop if error;
[f]=xlsread('f.xlsx');
% [rs]=xlsread('rs.xlsx');
[rs]=xlsread('rs73.xlsx');
x=ones(1,9445);
f=[f x'];
f(rs,2)=-1;
indexpos= find(f(:,2)==1);
posset=f(indexpos,1:2);
negset=f(rs,1:2);
train_set = [posset(1:400,1);negset(1:45,1)];
train_set_labels = [posset(1:400,2);negset(1:45,2)];
test_set = [posset(401:length(posset)  ,1);negset(46:length(negset)  ,1)];
test_set_labels = [posset(401:length(posset),2);negset(46:length(negset)  ,2)];
[mtrain,ntrain] = size(train_set);
[mtest,ntest] = size(test_set);
test_dataset = [train_set;test_set];
%%
[dataset_scale,ps] = mapminmax(test_dataset',0,1);
dataset_scale = dataset_scale';
train_set = dataset_scale(1:mtrain,:);
test_set = dataset_scale( (mtrain+1):(mtrain+mtest),: );
%% SVM����ѵ��
model = svmtrain(train_set_labels, train_set, '-s 2 -c 1 -g 0.07');
%% SVM����Ԥ��
[predict_label] = svmpredict(test_set_labels, test_set, model);
%% �������
figure;
hold on;
plot(test_set_labels,'o');
plot(predict_label,'r*');
xlabel('���Լ�����','FontSize',12);
ylabel('����ǩ','FontSize',12);
legend('ʵ�ʲ��Լ�����','Ԥ����Լ�����');
title('���Լ���ʵ�ʷ����Ԥ�����ͼ','FontSize',12);
grid on;










