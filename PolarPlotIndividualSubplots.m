%% Now plot ALL mean accuracies in a polar plot
clear all
close all
clc
%% Vars & Constants
observer = 'AD'
cardinalLocations = [0, 0.5*pi, pi, 1.5*pi,0];
TemporalLocationRad = cardinalLocations(1,1); %This is the temporal location (in rad)
UVMLocationRad = cardinalLocations(1,2);%This is the UVM location (in rad)
NasalLocationRad = cardinalLocations(1,3);%This is the nasal location (in rad)
LVMLocationRad = cardinalLocations(1,4);%This is the LVM location (in rad)
specifiedRhoLim = [.5 1];%These are the specified min and max axes limits we want to impose on our polar plots
desiredLinewidth = 2.2; %This is the linewidth for the figure
hair = .054; %adds hair for fig
smallerHair = .02;
%% THIS IS WHERE USER INPUTS ACCURACY VALUES 

validLocsAll1 = [1	0.952380952	0.976190476	0.928571429]
neutralLocsAll1 = [0.904761905	0.880952381	0.951219512	0.87804878]


vTemporalAcc1 = validLocsAll1(1,2);            %%%%%%%%%%%%%% CHANGE THIS!
vUVMacc1 = validLocsAll1(1,1);       %%%%%%%%%%%%%% CHANGE THIS!
vNasalAcc1 = validLocsAll1(1,4);          %%%%%%%%%%%%%% CHANGE THIS!
vLVMAcc1 = validLocsAll1(1,3);        %%%%%%%%%%%%%% CHANGE THIS!

nTemporalAcc1 = neutralLocsAll1(1,2);  %%%%%%%%%%%%%% CHANGE THIS!
nUVMacc1 = neutralLocsAll1(1,1);        %%%%%%%%%%%%%% CHANGE THIS!
nNasalAcc1 = neutralLocsAll1(1,4);     %%%%%%%%%%%%%% CHANGE THIS!
nLVMAcc1 =  neutralLocsAll1(1,3);      %%%%%%%%%%%%%% CHANGE THIS!


validLocsAll2 = [0.606060606 0.893939394 0.772727273 0.939393939]
neutralLocsAll2 = [0.590909091 0.878787879 0.651515152 0.909090909]

vTemporalAcc2 = validLocsAll2(1,2);            %%%%%%%%%%%%%% CHANGE THIS!
vUVMacc2 = validLocsAll2(1,1);       %%%%%%%%%%%%%% CHANGE THIS!
vNasalAcc2 = validLocsAll2(1,4);          %%%%%%%%%%%%%% CHANGE THIS!
vLVMAcc2 = validLocsAll2(1,3);        %%%%%%%%%%%%%% CHANGE THIS!

nTemporalAcc2 = neutralLocsAll2(1,2);  %%%%%%%%%%%%%% CHANGE THIS!
nUVMacc2 = neutralLocsAll2(1,1);        %%%%%%%%%%%%%% CHANGE THIS!
nNasalAcc2 = neutralLocsAll2(1,4);     %%%%%%%%%%%%%% CHANGE THIS!
nLVMAcc2 =  neutralLocsAll2(1,3); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SUBPLOT 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
polarPlotFigure = figure; %opens new fig 'polarPlotFigure'
subplot(1,2,1)
%Theta contains location around the circle. AKA the angle. In radians. 
%Rho contains the legnth of the radii 
thetaV = [cardinalLocations]; %The cardinal locations we want, in radians. Use deg2rad to convert degree angles to radians. Or just do it yourself. 
rhoV = [vTemporalAcc1,vUVMacc1,vNasalAcc1,vLVMAcc1, vTemporalAcc1]; %Starting from the right horizontal location (RHM) and moving counterclockwise. So, input order should be [RHM, UVM,LHM,LVM,RHM] 
validHandle = polarplot(thetaV,rhoV);%get a handle on that thing!
validHandle.LineWidth = desiredLinewidth; %set desired linewidth
rlim([specifiedRhoLim]);
hold on %hold on to that

thetaN = [cardinalLocations];%The cardinal locations for neutral trials (should match input for valid trials here)
rhoN = [nTemporalAcc1,nUVMacc1,nNasalAcc1,nLVMAcc1, nTemporalAcc1]; %The radii (accuracies) for neutral trials. Remember to start with RHM and progress counterclockwise
neutralHandleAll = polarplot(thetaN,rhoN);%get a handle on that thing!
neutralHandleAll.LineWidth = desiredLinewidth; %set desired linewidth
rlim([specifiedRhoLim]);
title('Accuracy at 4 cpd: observer AD' );%add observer initials here
leg = legend('Valid','Neutral');
%%%%%%%%add text
validHandleAll = gca; %gets current axes
setText(TemporalLocationRad,vTemporalAcc1); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
setText(UVMLocationRad,vUVMacc1); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
setText(NasalLocationRad,vNasalAcc1); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
setText(LVMLocationRad,vLVMAcc1); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
%validHandleAll.RLim = [specifiedRhoLim]; %uses setText fxn, which places a text box containing the accuracy value at each cardinal location

neutralHandleAll = gca;%gets current axes
setText(TemporalLocationRad,nTemporalAcc1); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
setText(UVMLocationRad,nUVMacc1); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
setText(NasalLocationRad,nNasalAcc1); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
setText(LVMLocationRad,nLVMAcc1); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
%neutralHandleAll.RLim = [specifiedRhoLim];

% add group n
%annotation(gcf,'textbox',[nLocAll],'String',['n = ',num2str(height(allCleanedData))],'FitBoxToText','on','LineStyle','none','FontSize',14,'FontName','Arial','FontAngle','italic');
%hold off %hold off on that
%shg %show me the money

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SUBPLOT 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(1,2,2);

%Theta contains location around the circle. AKA the angle. In radians. 
%Rho contains the legnth of the radii 
thetaV = [cardinalLocations]; %The cardinal locations we want, in radians. Use deg2rad to convert degree angles to radians. Or just do it yourself. 
rhoV = [vTemporalAcc2,vUVMacc2,vNasalAcc2,vLVMAcc2, vTemporalAcc2]; %Starting from the right horizontal location (RHM) and moving counterclockwise. So, input order should be [RHM, UVM,LHM,LVM,RHM] 
validHandle = polarplot(thetaV,rhoV);%get a handle on that thing!
validHandle.LineWidth = desiredLinewidth; %set desired linewidth
rlim([specifiedRhoLim]);
hold on %hold on to that

thetaN = [cardinalLocations];%The cardinal locations for neutral trials (should match input for valid trials here)
rhoN = [nTemporalAcc2,nUVMacc2,nNasalAcc2,nLVMAcc2, nTemporalAcc2]; %The radii (accuracies) for neutral trials. Remember to start with RHM and progress counterclockwise
neutralHandleAll = polarplot(thetaN,rhoN);%get a handle on that thing!
neutralHandleAll.LineWidth = desiredLinewidth; %set desired linewidth
rlim([specifiedRhoLim]);
title('Accuracy at 6 cpd: observer AD' );%add observer initials here
leg = legend('Valid','Neutral');
%%%%%%%%add text
validHandleAll = gca; %gets current axes
setText(TemporalLocationRad,vTemporalAcc2 + .04); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
setText(UVMLocationRad,vUVMacc2 + .02); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
setText(NasalLocationRad,vNasalAcc2); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
setText(LVMLocationRad,vLVMAcc2); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
%validHandleAll.RLim = [specifiedRhoLim]; %uses setText fxn, which places a text box containing the accuracy value at each cardinal location

neutralHandleAll = gca;%gets current axes
setText(TemporalLocationRad,nTemporalAcc2 - .04); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
setText(UVMLocationRad,nUVMacc2 - .04); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
setText(NasalLocationRad,nNasalAcc2 + .05); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
setText(LVMLocationRad,nLVMAcc2); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
%neutralHandleAll.RLim = [specifiedRhoLim];

% add group n
%annotation(gcf,'textbox',[nLocAll],'String',['n = ',num2str(height(allCleanedData))],'FitBoxToText','on','LineStyle','none','FontSize',14,'FontName','Arial','FontAngle','italic');
%hold off %hold off on that
%shg %show me the money
