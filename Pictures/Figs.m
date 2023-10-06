%% data read
clc
Df = xlsread('../CompleteData.xlsx',1);
%% preprocess
Frequency = Df(1:end,2:76);
Frequency(1,:)=(Frequency(1,:)+1)*8;
log_Frequency=abs(normalize(log(Frequency(2:end,:)),'zscore'));
norm_log_Frequency=(log_Frequency-min(log_Frequency()))./(max(log_Frequency)-min(log_Frequency));

%% plot
figure(1);
plot(Frequency(1,:),Frequency(43,:),'-','LineWidth',1.5,'Color','b');
xlim([0 400]);
xticks([0:40:400]);

% log normalized frequency
figure(2);
plot(Frequency(1,:),norm_log_Frequency(43,:),'-','LineWidth',1.5,'Color','b');
xlim([0 400]);
xticks([0:40:400]);
%% color map
load('test33.mat');
load('FOPcolormap.mat');
sample=squeeze(arr(2,:,:));
imagesc(sample);
colormap(FOPcolormap); 
% colormap(bone); 
% colorbar
% set(gca,'XTick',[], 'YTick', [])
axis off
% xticks([0:5:75]);
% yticks([0:5:75]);
% ax = gca;
% tick_scale_factor = 8;
% ax.XTickLabel = ax.XTick * tick_scale_factor;
% ax.YTickLabel = ax.YTick * tick_scale_factor;
% ax.ZTickLabel = ax.ZTick * tick_scale_factor;

%% Confusion matrix
confusion_data= xlsread('confusion.xlsx',1);
CM=confusionmat(confusion_data(:,2),confusion_data(:,3));
classLabels=categorical({'Fault 1','Fault 2','Fault 3','Fault 4'});
% heatmap(classLabels,classLabels,CM);
heatmap(CM);

%% Loss and Accuracy
ACC_Loss= xlsread('Acc&Loss.xlsx',1);
LOSS = ACC_Loss(:,2);
ACC = ACC_Loss(:,3);
T = 0:1:size(ACC,1)-1;
xlim([1 size(ACC,1)])

yyaxis left
plot(T,ACC,'-','LineWidth',3.5);
% title('\itAccuracy and Loss during training stage','FontSize',30, 'FontName', 'Times New Roman')
xlabel('\itNumber of Epochs','FontSize',30, 'FontName', 'Times New Roman')
ylabel('\itAccuracy','FontSize',30, 'FontName', 'Times New Roman')
ylim([0 1.1])
set(gca, 'YTick',0:0.25:1, 'FontSize',30, 'FontName', 'Times New Roman');
yyaxis right
plot(T,LOSS,'-','LineWidth',3.5);
ylabel('\itLoss','FontSize',30, 'FontName', 'Times New Roman')
set(gca, 'YTick',0:0.5:1.5, 'FontSize',30, 'FontName', 'Times New Roman');
ylim([0 1.51])
x0=10;
y0=10;
width=1375;
height=465;
set(gcf,'position',[x0,y0,width,height])
