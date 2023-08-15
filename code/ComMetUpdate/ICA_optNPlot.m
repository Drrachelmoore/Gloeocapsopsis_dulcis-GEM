% This script plots the stability of all bootstrapped independent 
% components to identify the optimum N for the dataset
% %..Author: 
%   Chaitra Sarathy, 31 Aug 2020 (initial commit of ComMet)
% Adapted from: 
    % Kairov U, Cantini L, Greco A, Molkenov A, Czerwinska U, Barillot E, et al.
        % Determining the optimal number of independent components for reproducible
        % transcriptomic data analysis. BMC Genomics. 2017;18(1).
        % doi:10.1186/s12864-017-4112-9.
    % Kairov U, Zinovyev A, Molkenov A. BIODICA GitHub page
    % (https://github.com/LabBandSB/BIODICA/); 2017. 
%2023-01-11 Updated by Rachel A Moore for G. dulcis model
figure
mat = dir('C:\\Users\\16309\\MATLAB\\Projects\\GAAB1\\R*.mat'); 
for q = 1:length(mat) 
    cont = load(mat(q).name);
    numComps(q) = sort(str2double(extractBetween(mat(q).name, 'nComps_', '.mat')));
    %{q,:} gives the qth row of matrix score
    [Iq, A, W, S] = icassoResult(cont.sR);
    score1{q,:} = Iq;
    plot(1:numel(score1{q}), score1{q}, 'Color',[0.5 0.5 0.5]);
    hold on
end
[~, ids] = sort(numComps, 'ascend');
score_sorted = score1(ids);
nums = numComps;
[MSTDT, line1, line2, mx] = findNumFeatures(score_sorted);
%figure; 
plot([0 max(nums)],[line1(1) line1(1)+max(nums)*line1(2)],'r--','LineWidth',3); hold on;
plot([0 mx],[line2(1) line2(1)+mx*line2(2)],'b--','LineWidth',3);
xline(MSTDT,'--','LineWidth',1)
xlabel('Component rank'); ylabel('Component stability'); set(gca,'FontSize',16);
ylim([0 1]);
text(max(nums)*0.7, 0.9,sprintf('Optimal N =%i',MSTDT),'FontSize',20);