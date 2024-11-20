%_____________________________________________________________________________________________%
%  source code:  MTV-SCA: Multi-trial Vector-based Sine Cosine Algorithm                      %
%                                                                                             %
%  Developed in: MATLAB R2018a                                                                %
% --------------------------------------------------------------------------------------------%
%  Main paper:   MTV-SCA: Multi-trial Vector-based Sine Cosine Algorithm                      %
%                Mohammad H Nadimi-Shahraki, Shokooh Taghian, Danial Javaheri,                %
%                Ali Safaa Sadiq, Nima Khodadadi, Seyedali Mirjalili                          %
%                                                                                             %
%  Emails:       nadimi@ieee.org, shokooh.taghian94@gmail.com, javaheri@korea.ac.kr           %
%                ali.sadiq@ntu.ac.uk, nima.khodadadi@miami.edu, ali.mirjalili@torrens.edu.au  %
%_____________________________________________________________________________________________%

% You can simply define your cost in a seperate file and load its handle to fobj 
% The initial parameters that you need are:
%__________________________________________
% fobj = @YourCostFunction
% dim = number of your variables
% Max_iteration = maximum number of generations
% N = number of search agents
% lb=[lb1,lb2,...,lbn] where lbn is the lower bound of variable n
% ub=[ub1,ub2,...,ubn] where ubn is the upper bound of variable n
% If all the variables have equal lower bound you can just
% define lb and ub as two single number numbers

% To run MTVSCA: [Fbest,Lbest,Convergence_curve] = MTVSCA(dim,N,Max_FES,lb,ub,fobj)
%__________________________________________

close all
clear
clc

Algorithm_Name = 'MTVSCA';

N = 100; % Population size
Function_name = 'F1'; % Name of the test function that can be from F1 to F23 
Max_FES = 500; % Maximum numbef of function evaluations

% Load details of the selected benchmark function
[lb,ub,dim,fobj] = Get_Functions_details(Function_name);

[Fbest,Lbest,Convergence_curve] = MTVSCA(dim,N,Max_FES,lb,ub,fobj);
display(['The best solution obtained by MTVSCA is : ', num2str(Lbest)]);
display(['The best optimal value of the objective funciton found by MTVSCA is : ', num2str(Fbest)]);

figure('Position',[500 500 660 290])
%Draw search space
subplot(1,2,1);
func_plot(Function_name);
title('Parameter space')
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])

%Draw objective space
subplot(1,2,2);
semilogy(Convergence_curve,'Color','r')
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');

axis tight
grid on
box on
legend('MTVSCA')


