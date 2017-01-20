%%%%%%%Colorwheel behavioral study script%%%%%%%%%%
clear all
close all

subNo= input('Subject ID: ');
sessionNo=input('Session:  ');
checked=input(sprintf('participant number is %d and session %d',subNo,sessionNo));

% create directories.
rootdir         = pwd;
logdir          = fullfile(rootdir,'Log');
cwdir           = fullfile(rootdir,'ColorwheelTask');
chdir           = fullfile(rootdir,'ChoiceTask');

if ~exist(logdir,'dir')
    mkdir(rootdir,'Log');
end

colordir=fullfile(logdir,'Colorwheel');
if ~exist(colordir,'dir')
    mkdir(logdir,'Colorwheel');
end
subdir = fullfile(colordir,sprintf('Colorwheel_sub_%d_session_%d',subNo,sessionNo));

if ~exist(subdir,'dir')
    mkdir(colordir,sprintf('Colorwheel_sub_%d_session_%d',subNo,sessionNo));
else
    randAttach = round(rand*10000);
    mkdir(colordir,sprintf('Colorwheel_sub_%d_%d_session_%d',subNo,randAttach,sessionNo));
end

cd(cwdir)

disp('TASK 1: Colorwheel');          % display which task starts.
WaitSecs(2)

BeautifulColorwheel(subNo,1,subdir,sessionNo) %practice=1
BeautifulColorwheel(subNo,0,subdir,sessionNo) %practice=0

%%% choice task
RestrictKeysForKbCheck(32);
disp('Press space to start the choice task');
KbWait();
disp('TASK 2: Choices');
RestrictKeysForKbCheck([]);

choiceDir = fullfile(logdir,'ChoiceTask');
if ~exist(choiceDir,'dir');
    mkdir(choiceDir);
end
subdirCh = fullfile(choiceDir,sprintf('Choices_sub_%d_session_%d',subNo,sessionNo));

if ~exist(subdirCh,'dir')
    mkdir(choiceDir,sprintf('Choices_sub_%d_session_%d',subNo,sessionNo));
else
    randAttach = round(rand*10000);
    mkdir(choiceDir,sprintf('Choices_sub_%d_%d_session_%d',subNo,randAttach,sessionNo));
end
cd(chdir)
BeautifulChoices(subNo,1,subdirCh,sessionNo);
BeautifulChoices(subNo,0,subdirCh,sessionNo);
cd(rootdir)


