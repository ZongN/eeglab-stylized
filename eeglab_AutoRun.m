% File load
EEG = pop_importdata('dataformat','matlab','nbchan',18,...
                     'data','data.mat',...
                     'srate',256,'pnts',0,'xmin',0,...
                     'chanlocs','Inf18.ced');
EEG = eeg_checkset( EEG );
EEG = eeg_checkset( EEG );
% % Run ICA
fprintf(2,'々々々々々々々々々々々々々々々々々々々 Run ICA 々々々々々々々々々々々々々々々々々々々 \n')
EEG = pop_runica(EEG, 'icatype', 'runica', 'extended',1,'interrupt','on');
EEG = eeg_checkset( EEG );

% Run ADJUST
fprintf(2,'々々々々々々々々々々々々々々々々々々々 Run ADJUST 々々々々々々々々々々々々々々々々々々々 \n')
% Creat a log file
result = { '''report.txt''' };
report = eval( [ '[' result{1} ']' ] );
% Record in log file
[EEG,ADJUST_reject] = interface_ADJ_WithoutInterface (EEG,report);
disp(['々 ADJUST Channel : ' num2str(ADJUST_reject)]) % print to screen
EEG = eeg_checkset( EEG );

% Remove adjusted channels components
EEG = pop_subcomp( EEG, ADJUST_reject, 0);
EEG = eeg_checkset( EEG );

pop_eegplot( EEG, 1, 1, 1);
% Ignore the error after pressing the reject button in the interface

% Change to Biosig dir to install biosig
cd('.\Biosig3.3.0')
biosig_installer
cd('..')
% end and back

% Use the while loop to check if the manual confirmation is complete
WhileKeep = true;
while WhileKeep
    pause(4)
   if(exist('LASTCOM')) 
        % Remove manual reject
        eval(LASTCOM);
        % Export to eegclear.edf
        pop_writeeeg(EEG, 'eegclear.edf', 'TYPE','EDF');
        disp('File export done.')
        WhileKeep = false;
   end
end




