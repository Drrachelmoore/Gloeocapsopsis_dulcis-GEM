% This script finds the optimum 'N' (or number of independent components
% necessary for decomposition) for the dataset using a bootstrapping
% approach
%2023-01-11 Updated by Rachel A Moore for G. dulcis model
% load PCs from both simulations

%set decimal precision and filter reactions with low loadings
%%pcs_all =  [round(rotatedComp_rearr_un, 3), round(rotatedComp_rearr_con, 3)];
pcs_all_rem = filterLowLoadingsReactions(pcs_all)'; % generated by running ComMet.mlx

% Reduce dimension from 1033 ordinal signals to 'numComps' (lastEig) in each iteration. 
% Resample 100 (M) times using random initial conditions and bootstrapping
% (use FastICA parameters: kurtosis as non-linearity,
% symmetric estimation approach)

%numIter = 100;
%numComps = [2:1:90, 95, 100];
numIter = 100;
numComps = [2:1:85];

for uu = 1:length(numComps)
    failed = 'true';
    while strcmp(failed, 'true')
        try
            tic;
            boot_ica = icassoEst('both', pcs_all_rem, numIter, 'g', 'pow3', 'approach', 'symm', 'lastEig', numComps(uu));
            end_time_boot = toc; 
            failed = 'false';
            break;
        end
    end    
    sR = icassoExp(boot_ica);
    end_time_sR = toc;
    save(['Results_nComps_',num2str(numComps(uu)),'.mat'],'boot_ica','sR',...
        'end_time_boot','end_time_sR');
    clear('boot_ica','sR','end_time_boot','end_time_sR');
end