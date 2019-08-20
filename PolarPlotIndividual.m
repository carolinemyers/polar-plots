%% Now plot ALL mean accuracies in a polar plot
clear all
close all
clc
%% Vars & Constants
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
vTemporalAcc = 1            %%%%%%%%%%%%%% CHANGE THIS!
vUVMacc = 0.645833333       %%%%%%%%%%%%%% CHANGE THIS!
vNasalAcc = 1               %%%%%%%%%%%%%% CHANGE THIS!
vLVMAcc = 0.770833333       %%%%%%%%%%%%%% CHANGE THIS!

nTemporalAcc = 0.895833333  %%%%%%%%%%%%%% CHANGE THIS!
nUVMacc = 0.479166667       %%%%%%%%%%%%%% CHANGE THIS!
nNasalAcc = 0.9375          %%%%%%%%%%%%%% CHANGE THIS!
nLVMAcc =  0.708333333      %%%%%%%%%%%%%% CHANGE THIS!



polarPlotFigure = figure; %opens new fig 'polarPlotFigure'
%Theta contains location around the circle. AKA the angle. In radians. 
%Rho contains the legnth of the radii 
thetaV = [cardinalLocations]; %The cardinal locations we want, in radians. Use deg2rad to convert degree angles to radians. Or just do it yourself. 
rhoV = [vTemporalAcc,vUVMacc,vNasalAcc,vLVMAcc, vTemporalAcc]; %Starting from the right horizontal location (RHM) and moving counterclockwise. So, input order should be [RHM, UVM,LHM,LVM,RHM] 
validHandle = polarplot(thetaV,rhoV);%get a handle on that thing!
validHandle.LineWidth = desiredLinewidth; %set desired linewidth
rlim([specifiedRhoLim]);
hold on %hold on to that

thetaN = [cardinalLocations];%The cardinal locations for neutral trials (should match input for valid trials here)
rhoN = [nTemporalAcc,nUVMacc,nNasalAcc,nLVMAcc, nTemporalAcc]; %The radii (accuracies) for neutral trials. Remember to start with RHM and progress counterclockwise
neutralHandleAll = polarplot(thetaN,rhoN);%get a handle on that thing!
neutralHandleAll.LineWidth = desiredLinewidth; %set desired linewidth
rlim([specifiedRhoLim]);
title('Accuracy at 8 cpd: observer KL');%add observer initials here
leg = legend('Valid','Neutral');
%%%%%%%%add text
validHandleAll = gca; %gets current axes
setText(TemporalLocationRad,vTemporalAcc); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
setText(UVMLocationRad,vUVMacc); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
setText(NasalLocationRad,vNasalAcc); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
setText(LVMLocationRad,vLVMAcc); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
%validHandleAll.RLim = [specifiedRhoLim]; %uses setText fxn, which places a text box containing the accuracy value at each cardinal location

neutralHandleAll = gca;%gets current axes
setText(TemporalLocationRad,nTemporalAcc); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
setText(UVMLocationRad,nUVMacc); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
setText(NasalLocationRad,nNasalAcc); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
setText(LVMLocationRad,nLVMAcc); %uses setText fxn, which places a text box containing the accuracy value at each cardinal location
%neutralHandleAll.RLim = [specifiedRhoLim];

% add group n
%annotation(gcf,'textbox',[nLocAll],'String',['n = ',num2str(height(allCleanedData))],'FitBoxToText','on','LineStyle','none','FontSize',14,'FontName','Arial','FontAngle','italic');
%hold off %hold off on that
%shg %show me the money