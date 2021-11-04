%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATLAB CODES ACCOMPANYING QUAN ET AL. (2021) PAPER
% CODES CALCULATE POROSITY ON PROCESSED X-RAY CT IMAGES
% 
% STEP6: PLOT DIRECTIONAL POROSITY
% REFER TO README.MD FOR INSTRUCTION
%
% CITE AND CREDIT:
% SUN ET AL. (2021). POWDER TECHNOLOGY, 388:496-504.
% HTTPS://DOI.ORG/10.1016/J.POWTEC.2021.05.006
% 
% TESTED ON MATLAB VERSION 2018(a) OR NEWER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear; close all;

%% user input

% read and prepare the data 

n = 5;% kernel size (L_e by voxel), must be identical with Step 3!!

% read the 3D binary matrix

% type = 'Loose'; for example 1
type = 'Steel'; % for example 2

%%
load([type '_' num2str(n) '_Dimensional_porosity.mat']);
%% Prepare variables
lenz = length(convex_por_z);
lenx = length(convex_por_x);
leny = length(convex_por_y);
z = [1:lenz];
x = [1:lenx];
y = [1:leny];

%% Plot directional porosity

% x-axis direction
h=figure
hold on

% scatter(x,porosity_x,12,'k','.')
plot(x,convex_por_x,'LineWidth' ,2)

set(gca, 'FontSize',16)
lgd=legend('X-direction');
lgd.FontSize=16;
lgd.Location='northeast'
box on

ax = gca;
ax.YLabel.String = 'Porosity';
ax.XLabel.String = 'Position (\it\mu\itm)';
ax.LineWidth=1
set(h,'Units','Inches');
xlim([0 lenx(end)])
ylim([0 1])



% y-axis direction
h=figure
hold on

% scatter(x,porosity_x,12,'k','.')
plot(y,convex_por_y,'LineWidth' ,2)

set(gca, 'FontSize',16)
lgd=legend('Y-direction');
lgd.FontSize=16;
lgd.Location='northeast'

box on

ax = gca;
ax.YLabel.String = 'Porosity';
ax.XLabel.String = 'Position (\it\mu\itm)';
ax.LineWidth=2
set(h,'Units','Inches');
xlim([0 leny(end)])
ylim([0 1])


% z-axis direction
h=figure
hold on

% scatter(x,porosity_x,12,'k','.')
plot(z,convex_por_z,'LineWidth' ,2)

set(gca, 'FontSize',16)
lgd=legend('Z-direction');
lgd.FontSize=16;
lgd.Location='northeast'
box on

ax = gca;
ax.YLabel.String = 'Porosity';
ax.XLabel.String = 'Position (\it\mu\itm)';
ax.LineWidth=2
set(h,'Units','Inches');
xlim([0 lenz(end)])
ylim([0 1])

