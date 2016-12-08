function [data,varargout] = BeautifulChoices(varargin)
% Colorhwheel
%
% This function presents the Discounting choice task - here: part 2 of the
% QuantifyingCC study, part 1 is the DMS
% The aim of the choice task is to determine the Subjective Value (SV) that participants ascribe to the 2 processes that they experienced during the phase 1 of DMS task:
% During the DMS task participants saw different trials:

%       i) IGNORE/NEGLECT (indicated by the letter 'I' in the centre): pps should ignore the new stimuli
%           and still remember the colors/locations presented during ENCODING.
%       ii) UPDATE (indicated by the letter 'U'): pps should overwrite/forget the colors/locations of the ENCDOING,
%           but ONLY remember the latest colors/locations presented during interference phase.
% Here we offer them two different versions of choices, in each of which
% there is an easy and hard version of the task
% Version 1: Task vs No task  (easy offer: task)
% In this version participants choose between repeating all levels of the DMS task
% and not repeating the task at all
% Version 2: Update vs Ignore (easy offer: Update, hypothesized)
% In this version participants choose between Ignore and Update of the same level 
% By calculating the Indifference Point between easy and hard offer, we
% estimate the subjective value of each task.
% 
% This file calls the following (sub)functions:
%   getInfoChoice
%   defChoicesFIxed
%   getInstructionsChoice
%   showChoiceTrialFixed

try
    %%%%%% Depending on input arguments gets subject info from main script
    %%%%%% or asks for it directly
    switch nargin
        case 0 %if no input asks for subNo and practice and provides file names
            [subNo,dataFilename,dataFilenamePrelim,practice]=getInfoChoice; 
        case 3 % if subNo, practice status, directory provided in main script
            subNo=varargin{1};
            practice=varargin{2};
            choicedir=varargin{3};
             [subNo,dataFilename,dataFilenamePrelim,practice]=getInfoChoice(subNo,practice); 
    end
    %% set experiment parameters
    %task version 1: No Redo; Version2: Direct comparison
    pms.practice=practice;
    pms.step=0.2;
    pms.min=[0.1 0.2]; %smallest offer 0.1, then 0.2 then increases by step
    pms.max1=2.2; %max amount offered for v1
    pms.max2=4;%max amount offered for v2
    pms.reps=3;%repetitions
    pms.hardOffer=2; %offer for hard task that remains fixed
    pms.easyOffer1=pms.min(2):pms.step:pms.max1; pms.easyOffer1=[pms.min(1) round(pms.easyOffer1*10)/10]; %fix bug and pairs for easy task
    pms.easyOffer2=pms.min(2):pms.step:pms.max2; pms.easyOffer2=[pms.min(1) round(pms.easyOffer2*10)/10];   %fix bug
    pms.numPairs1=length(pms.easyOffer1);%number of pairs
    pms.numPairs2=length(pms.easyOffer2);
    pms.typeTask1 = 1:8; %1:4, Ignore all set sizes, 5:8 Update all set sizes
    pms.typeTask2=1:4; %direct comparison has no condition so only 4
    pms.Conditions = {0,2}; %UPDATE IGNORE
    pms.numChoices1 = length(pms.typeTask1)*length(pms.easyOffer1)*pms.reps; %number of choices per version
    pms.numChoices2 = length(pms.typeTask2)*length(pms.easyOffer2)*pms.reps;
    pms.numChoices=pms.numChoices1+pms.numChoices2; %total number of choices

    %%practice
    pms.repsPrac=1; %repetitions for practice if we want to vary the offers
   % pms.stepPrac=0.8; % if we want to have varying offers 
%     pms.easyOffer1Prac=pms.min:pms.stepPrac:pms.max1;
%     pms.easyOffer2Prac=pms.min:pms.stepPrac:pms.max2;
    pms.easyOffer1Prac=2; %easy offer for practice is always to avoid biasing them
    pms.easyOffer2Prac=2;
    pms.numPairs1Prac=length(pms.easyOffer1Prac); %number of pairs for practice per version
    pms.numPairs2Prac=length(pms.easyOffer2Prac);    
    pms.numChoices1Prac = length(pms.typeTask1)*length(pms.easyOffer1Prac)*pms.repsPrac;
    pms.numChoices2Prac = length(pms.typeTask2)*length(pms.easyOffer2Prac)*pms.repsPrac;
    pms.numChoicesPrac=pms.numChoices1Prac+pms.numChoices2Prac;
    
    pms.setSize=1:4;
    pms.numBlocks=3;%number of blocks
    pms.numBlocksPrac=1;
    pms.numPerBlock =pms.numChoices/pms.numBlocks; %trials per block
    
    % allowable response characters
    pms.allowedResps.left = ',1';
    pms.allowedResps.right = '.2';
    % timings
    pms.fixation = 1; %fixation before task
    pms.maxRT =6; % max RT
    pms.iti = 0.5; %between trials
    pms.jitter = 0; % should trial duration be jittered (no: 0, yes: 1)
    
    %text14
    pms.background=[200,200,200]; %background color
    pms.textColor=[0 0 0];
    pms.wrapAt=100; 
    pms.spacing=3;
    pms.subNo=subNo;
    %if directory for saving output file exists, save there, otherwise save
    %in current folder
    if exist('choicedir','var')
          pms.choicedir=choicedir;
    else
        pms.choicedir=pwd;
    end
    %% display and screen
    % display parameters
    
    % bit Added to address problem with high precision timestamping related
    % to graphics card problems
    % Screen settings
    Screen('Preference','SkipSyncTests', 1);
    Screen('Preference', 'VBLTimestampingMode', -1);
    Screen('Preference','TextAlphaBlending',0);
    Screen('Preference', 'VisualDebugLevel',0);
    % initialize the random number generator
    randSeed = sum(100*clock);
    delete(instrfind);
    %RandStream.setGlobalStream(RandStream('mt19937ar','seed',randSeed));
    
    HideCursor;
    ListenChar(2);%2: enable listening; but keypress to matlab windows suppressed.
    Priority(1);  % level 0, 1, 2: 1 means high priority of this matlab thread
    
    % open an onscreen window
    [wPtr,rect]=Screen('Openwindow',max(Screen('Screens')),pms.background);
    %[wPtr,rect]=Screen('Openwindow',[0 0 800 600]); %for debug
    %[pms.wid, pms.wRect] = Screen('OpenWindow',mon,[pms.bkgd*ones(1,3), 255],[0 0 800 600],[],[],[]); %debug
    Screen('BlendFunction',wPtr,GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);
    %% get trialstructure depending on pms
   
      [data] = defChoicesFixed(pms);
    
  %% prepare data for easy export later
    
    % log general subject and session info
    dataHeader=struct();
    dataHeader.header ='Colorhweel_Choices';
    dataHeader.randSeed = randSeed;
    dataHeader.sessionTime = fix(clock);
    dataHeader.subjectID = subNo;
    dataHeader.dataName = dataFilename;
    dataHeader.dataFilenamePrelim = dataFilenamePrelim;
    dataHeader.logdir = cd; %adapt logdir
    
    %% Define Text
    Screen('TextSize',wPtr,16);
    Screen('TextStyle',wPtr,1);
    Screen('TextFont',wPtr,'Helvetica');
    
    %% Experiment starts with instructions
    %%%%%%% get instructions
    % show instructions
% 
  %for now
    if     practice==1
           getInstructionsChoice(1,pms,wPtr);
    elseif practice==0
           getInstructionsChoice(4,pms,wPtr);
    end

    
    %% Experiment starts with trials
    % baseline for event onset timestamps
    
    % stimOnset = Screen(wPtr,'Flip'); CHECK onsets
    % onset = stimOnset-exptOnset;
    % run begins
    
    WaitSecs(1); % initial interval (blank screen)
    pms.exptOnset = GetSecs;
    %%%%%%
    % show the offers and collect a response (1 = easy, 2 = hard, 9 = too slow)
    [data] = showChoiceTrialFixed(pms, data, wPtr, rect, dataHeader); %adapt MF

    %% Save the data
     save(fullfile(pms.choicedir,dataFilename));
    %% Close-out tasks
        
   if practice==1
       getInstructionsChoice(3,pms,wPtr)        
   
   elseif practice==0
       %%redo
    [choiceSZ, choiceCondition,bonus]=Redo(pms,data);
    varargout{1}=choiceSZ;
    varargout{2}=choiceCondition;
    varargout{3}=bonus;
    getInstructionsChoice(5,pms,wPtr)     
        % save data
     save(fullfile(pms.choicedir,dataFilename),'data','dataHeader','pms','bonus');
%     cd('M:\.matlab\GitHub\QuantifyingCC')
%     BeautifulColorwheel(pms.subNo, pms.choiceSZ,pms.choiceCondition)
   end
    
    clear Screen
    Screen('CloseAll');
    ShowCursor; % display mouse cursor again
    ListenChar(0); % allow keystrokes to Matlab
    Priority(0); % return Matlab's priority level to normal
    Screen('Preference','TextAlphaBlending',0);
catch ME
    disp(getReport(ME));
    keyboard   
    
%     close-out tasks
    Screen('CloseAll'); % close screen
    ShowCursor; % display mouse cursor again
    ListenChar(0); % allow keystrokes to Matlab
    Priority(0); % return Matlab's priority level to normal
    Screen('Preference','TextAlphaBlending',0);
    
end %try-catch loop
end % main function



