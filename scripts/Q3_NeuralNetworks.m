%% Neural Netoworks. Code Stolen from Matlab since they own the wine_data and use it to exmplain NN.

clc
clear all
close all

%add data directory to path
if contains(pwd, 'NotPatRecCW2')
    dataPath = strcat( extractBefore(pwd, 'NotPatRecCW2'), 'NotPatRecCW2/data');
    addpath(char(dataPath));
else
    dataPath = ''; %dataPath is empty vector
    fprintf('Move to NotPatRecCW2 directory\n');
end

%load norm data
load wine_separatedData.mat

%% Vary hidden layer size

% 
% training_cl = zeros(3,length(training_classes));
% for i = 1:length(training_classes)
%     training_cl(training_classes(i),i) = 1;
% end
% 
% maxNum = 60;
% 
% for p = 1:30
%     for k = 1:maxNum
%         
%         net = patternnet(k);
%         net = train(net,training_raw',training_cl);
%         % view(net)
%         y = net(testing_raw');
%         
%         for i = 1:length(testing_raw)
%             [~, NeurClass(i)] = max(y(:,i));
%         end
%         
%         acc(p,k) = (length(testing_raw)-nnz(NeurClass - testing_classes))*100/length(testing_raw);
%         
%         clear net y NeurClass
%     end
% end
% plot(1:maxNum,mean(acc),'linewidth',4)
% grid on
% grid minor
% set(gca,'fontsize',15,'linewidth',1.5)
% xlabel('Hidden Layer Size','fontsize',30,'interpreter','latex')
% ylabel('Accuracy [\%]','fontsize',30,'interpreter','latex')
% title('Effect of Hidden Layer Size on Performance','fontsize',30,'interpreter','latex')

%% Vary number of hidden layers

training_cl = zeros(3,length(training_classes));
for i = 1:length(training_classes)
    training_cl(training_classes(i),i) = 1;
end

hidSize = 20;
maxHid = 20;

for p = 1:5
  for s = 1:hidSize  
    for k = 1:maxHid
        
        
        net = patternnet(s*ones(1,k));
        net.divideParam.trainRatio = 100/100;     
        net.divideParam.valRatio = 0/100;      
        net.divideParam.testRatio = 0/100; 
        net = train(net,training_raw',training_cl);
        % view(net)
        y = net(testing_raw');
        
        for i = 1:length(testing_raw)
            [~, NeurClass(i)] = max(y(:,i));
        end
        
        acc(s,k,p) = (length(testing_raw)-nnz(NeurClass - testing_classes))*100/length(testing_raw);
        
        clear net y NeurClass
    end
  end
end


% plot(1:maxHid,mean(acc),'linewidth',4)
% grid on
% grid minor
% set(gca,'fontsize',15,'linewidth',1.5)
% shading interp
% xlabel('Number of Hidden Layers','fontsize',30,'interpreter','latex')
% %ylabel('Hidden Layers Size','fontsize',30,'interpreter','latex')
% ylabel('Accuracy [\%]','fontsize',30,'interpreter','latex')
% title('Effect of Number and Size of Hidden Layer on Performance','fontsize',30,'interpreter','latex')
% % 
surf(1:maxHid,1:hidSize,mean(acc,3))
grid on
grid minor x
set(gca,'fontsize',15,'linewidth',1.5)
shading interp
xlabel('Number of Hidden Layers','fontsize',30,'interpreter','latex')
ylabel('Hidden Layers Size','fontsize',30,'interpreter','latex')
zlabel('Accuracy [\%]','fontsize',30,'interpreter','latex')
title('Effect of Number and Size of Hidden Layer on Performance','fontsize',30,'interpreter','latex')

18 - 6 (6-2)/(18-8) = 4/10 = 0.4
8 - 2 2-8*0.4 = 2-3.2 = -1.2
