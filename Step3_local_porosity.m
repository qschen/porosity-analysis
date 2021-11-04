%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATLAB CODES ACCOMPANYING QUAN ET AL. (2021) PAPER
% CODES CALCULATE POROSITY ON PROCESSED X-RAY CT IMAGES
% 
% STEP3: CALCULATE LOCAL POROSITY
% REFER TO README.MD FOR INSTRUCTION
%
% CITE AND CREDIT:
% SUN ET AL. (2021). POWDER TECHNOLOGY, 388:496-504.
% HTTPS://DOI.ORG/10.1016/J.POWTEC.2021.05.006
% 
% TESTED ON MATLAB VERSION 2018(a) OR NEWER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear; close all;

addpath(genpath('BW_figures'));
%% user input
% read the 3D binary matrix
% type = 'Loose'; for example 1
type = 'Steel'; % for example 2

% select kernel size (L_e by voxel)
n = 5; % must be an odd numer!

%%
load([type,'_packing.mat']);

% prepare scanning window matrix and output matxix
scan_window = zeros(n,n,n);
sz=size(BW);
window_center = (n+1)/2;
output = zeros(sz(1)-n,sz(2)-n,sz(3)-n);

%% traverse the entire 3D binary matrix


for i = window_center:sz(1)-window_center+1
    for j = window_center:sz(2)-window_center+1
        for k = window_center:sz(3)-window_center+1
            scan_window = BW(i-(window_center-1):i+(window_center-1),j-(window_center-1):j+(window_center-1),k-(window_center-1):k+(window_center-1));
            output(i-(window_center-1),j-(window_center-1),k-(window_center-1))= 1- (nnz(scan_window)/n^3);
            
        end
    end
end

% save the results
save([type,'_porosity_',num2str(n),'.mat'],'output','i','-v7.3');


