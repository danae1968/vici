%%%%%%%Colorwheel behavioral study script%%%%%%%%%%
clear all
close all

subNo= input('Subject ID: ');
checked=input(sprintf('participant number is %d',subNo));

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
subdir = fullfile(colordir,sprintf('Colorwheel_sub_%d',subNo));

if ~exist(subdir,'dir')
    mkdir(colordir,sprintf('Colorwheel_sub_%d',subNo));
else
    randAttach = round(rand*10000);
    mkdir(colordir,sprintf('Colorwheel_sub_%d_%d',subNo,randAttach));
end

cd(cwdir)

disp('TASK 1: Colorwheel');          % display which task starts.
WaitSecs(2)

BeautifulColorwheel(subNo,1,subdir) %practice=1
BeautifulColorwheel(subNo,0,subdir) %practice=0

%%% choice task
disp('TASK 2: Choices');
WaitSecs(2);


choiceDir = fullfile(logdir,'ChoiceTask');
if ~exist(choiceDir,'dir');
    mkdir(choiceDir);
end
subdirCh = fullfile(choiceDir,sprintf('Choices_sub_%d',subNo));

if ~exist(subdirCh,'dir')
    mkdir(choiceDir,sprintf('Choices_sub_%d',subNo));
else
    randAttach = round(rand*10000);
    mkdir(choiceDir,sprintf('Choices_sub_%d_%d',subNo,randAttach));
end
cd(chdir)
BeautifulChoices(subNo,1,subdirCh);
[~,choiceSZ,choiceCondition,bonus]=BeautifulChoices(subNo,0,subdirCh);
cd(cwdir)

BeautifulColorwheel(subNo,2,subdir,choiceSZ,choiceCondition,bonus)

