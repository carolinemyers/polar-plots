%%  00a Hello
%%% Create a polar plot for one observer: DPF (but works with other
%%% experiments too)
%Written by Caroline Myers (contact: cfm304@nyu.edu) 
%New York University
%Carrasco Lab
%September 2019. 
%Version history: D2

%This program was written by Caroline Myers. The point of this script is to visualize accuracy in a 2-AFC
%discrimination task at four cardinal locations across two attentional
%conditions (valid/neutral exo cuing)

%Assumptions: This script assumes that the 'SetText' function (Myers, 2019,
%NYU) resides within the same folder as this script. This program also
%assumes manual user input (as stated below.)

%Inputs: 
% vUVMacc: accuracy at northern location for VALID trials (change this in section 1)
% vTemporalAcc: accuracy at eastern location for VALID trials (change this in section 1)
% vLVMAcc: accuracy at southern location for VALID trials (change this in section 1)
% vNasalAcc: accuracy at western location for VALID trials (change this in section 1)

% nUVMacc: accuracy at northern location for NEUTRAL trials (change this in section 1)
% nTemporalAcc: accuracy at eastern location for NEUTRAL trials (change this in section 1)
% nLVMAcc: accuracy at southern location for NEUTRAL trials (change this in section 1)
% nNasalAcc: accuracy at western location for NEUTRAL trials (change this in section 1)

%Title: In addition to inputting accuracies per location/condition, the
%user must also change the title of the output figure to reflect the nature
%of the experimental data. (change this in code section 2)

% Outputs: Polar plot visualizing accuracy at 4 cardinal locations (N, E, S,
% W) for valid and neutral trials, labeled with accuracy at each loc
%% 00b Init
clear all
close all
clc
%% 00c Vars & Constants
cardinalLocations = [0, 0.5*pi, pi, 1.5*pi,0];
TemporalLocationRad = cardinalLocations(1,1); %This is the temporal location (in rad)
UVMLocationRad = cardinalLocations(1,2);%This is the UVM location (in rad)
NasalLocationRad = cardinalLocations(1,3);%This is the nasal location (in rad)
LVMLocationRad = cardinalLocations(1,4);%This is the LVM location (in rad)
specifiedRhoLim = [.5 1];%These are the specified min and max axes limits we want to impose on our polar plots
desiredLinewidth = 2.2; %This is the linewidth for the figure
hair = .054; %adds hair for fig
smallerHair = .02;
%% 01 THIS IS WHERE USER INPUTS ACCURACY VALUES 
vUVMacc = 0.645833333       %%%%%%%%%%%%%% CHANGE THIS! This is the accuracy at the northern location (UVM) for VALID trials
vTemporalAcc = 1            %%%%%%%%%%%%%% CHANGE THIS! This is the accuracy at the eastern (temporal) location for VALID trials
vLVMAcc = 0.770833333       %%%%%%%%%%%%%% CHANGE THIS! This is the accuracy at the southern location (LVM) for VALID trials
vNasalAcc = 1               %%%%%%%%%%%%%% CHANGE THIS! This is the accuracy at the western (nasal) location for VALID trials

nUVMacc = 0.479166667       %%%%%%%%%%%%%% CHANGE THIS! This is the accuracy at the northern location (UVM) for NEUTRAL trials
nTemporalAcc = 0.895833333  %%%%%%%%%%%%%% CHANGE THIS! This is the accuracy at the eastern (temporal) location for NEUTRAL trials
nLVMAcc =  0.708333333      %%%%%%%%%%%%%% CHANGE THIS! This is the accuracy at the southern location (LVM) for NEUTRAL trials
nNasalAcc = 0.9375          %%%%%%%%%%%%%% CHANGE THIS! This is the accuracy at the western (nasal) location for NEUTRAL trials

%% 02 Make the plot
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
title('Accuracy at 8 cpd: observer KL');%add observer initials here: CHANGE ME!!! 
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
