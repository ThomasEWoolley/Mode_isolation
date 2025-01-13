%% Code for cleaning folders and memory
close all;clc;keep pphome;
Fname=['Bifs'];

if exist(Fname, 'dir')
    rmdir([Fname,'*'],'s')
end


p=[]; p=stanparam(p); % Setting up basic p structure
p.plot.auxdict={'L','$c_1$','$c_{-1}$','$c_{2}$','$c_{3}$','$\max u_1$','$\min u_1$'}; % Parameter names (not needed, but nice)
% par=           [ 1 3 4.55]; % Parameters used in functions and Jacobian
par=           [ 0.1 0.1 0.2 0.3 0.1]; % Parameters used in functions and Jacobian
p.fuha.outfu=@outfn; % Output function to be plotted, names are in above.
p.nc.ilam=1; % Parameter number to continue over
p.plot.bpcmp=6; % Which component of output function to plot.
p.plot.pcmp=1; % Component for plotting
huclean(p); % Set up figures in nice way

p.sw.sfem=-1; % Use OOPDE settings. Otherwise 0/1 for full/preassembled FEM settings
p.nc.neq=2; % Number of equations

p.fuha.sG=@sG; % Functions to be solved
p.sw.jac=0; % Use numeric Jacobian.

p.dim=1; % Spatial dimensions

p.pdeo=stanpdeo1D(1/2,0.001); % PDE setup

p.np=p.pdeo.grid.nPoints; p.nu=2*p.np; p.sol.xi=1/(p.nu);


p.fuha.cfu=@cf; % Semi-implicit part (in functions and Jacobian)
p.sw.verb=0; % Verbosity of calculation

p.sw.bifcheck=2; % Calculate bifurcations using eigenvalues, 0 turn off, 1 use LU decomposition
p.sw.spcalc=1; % Calculate eigenvalues (0/1 Eigenvalue computations off/on)
p.nc.neig=min(20,p.np); % Number of eigenvalues to calculate
p.nc.tol=1e-11; % Tolerance for finding branch

p.sol.ds=0.001; % Arclength step
p.nc.dsmin=1e-7; % Arclength minimum steplength
p.nc.dsmax=0.002; % Arclength max steplength
p.nc.dlammax=0.01; % Maximum step in the parameter
p.nc.lammax=2; % Max parameter value
p.nc.lammin=par(1); % Min parameter value
p.file.smod=10; % Output every n steps

p.plot.pstyle=1; %0 only plot the FEM mesh; 1 mesh-plot; 2 density-plot
p.sw.para=1; % Continuation variable 1: automatic switching via ? <> p.nc.lamdtol (0: natural parameter.; 2: arclength).

p.nc.mu1=0.5; % Threshold for bifcheck=2
p.nc.mu2=1e-5; % Threshold for bifcheck=2
p.nc.bisecmax=100;
p.nc.dsminbis=1e-12;

c1=par(2);
cn1=par(3);
c2=par(4);
c3=par(5);
u=(c1+c2)/cn1*ones(p.np,1); v=c2/(c3*((c1+c2)/cn1)^2)*ones(p.np,1); %ICs
p.u=[u; v; par']; % Complete description

p=oosetfemops(p);
p.nc.nsteps=50;
p=setfn(p,Fname,0.001);
p=cont(p,5000);
%%
fileList = dir(fullfile('./Bifs/', 'bpt*'));
numFiles = numel(fileList);
for i=1:numFiles
p=swibra(Fname,['bpt',num2str(i)],[Fname,'_bp',num2str(i),'_b'],0.001);
p.nc.lammax=10; % Max parameter value
p.nc.dsmax=0.1; % Arclength max steplength
p=cont(p,400);
end

% %%
% p=swibra(Fname,'bpt1',[Fname,'_bp1_b'],0.001);
% p.nc.dsmax=0.1; % Arclength max steplength
% p=cont(p,100);
% % 
% %%
% p=swibra(Fname,'bpt2',[Fname,'_bp2_b'],0.001);
% p.nc.dsmax=0.1; % Arclength max steplength
% p=cont(p,100);
% % 
% %%
% p=swibra(Fname,'bpt3',[Fname,'_bp3_b'],0.001);
% p.nc.dsmax=0.1; % Arclength max steplength
% p=cont(p,200);
% % 
% %%
% p=swibra(Fname,'bpt5',[Fname,'_bp5_b'],0.001);
% p.nc.dsmax=0.1; % Arclength max steplength
% p=cont(p,200);
% 
% %%
% p=swibra(Fname,'bpt6',[Fname,'_bp6_b'],0.001);
% p.nc.dsmax=0.1; % Arclength max steplength
% p=cont(p,200);
% %%
% p=swibra(Fname,'bpt7',[Fname,'_bp7_b'],0.001);
% p.nc.dsmax=0.1; % Arclength max steplength
% p=cont(p,400);
% 
% %%
% p=swibra(Fname,'bpt9',[Fname,'_bp9_b'],0.001);
% p.nc.dsmax=0.1; % Arclength max steplength
% p=cont(p,400);
% 
% %%
% p=swibra(Fname,'bpt10',[Fname,'_bp10_b'],0.001);
% p.nc.dsmax=0.1; % Arclength max steplength
% p=cont(p,400);
% 
% %%
% p=swibra(Fname,'bpt11',[Fname,'_bp11_b'],0.001);
% p.nc.dsmax=0.1; % Arclength max steplength
% p=cont(p,400);
% 
% %%
% p=swibra(Fname,'bpt13',[Fname,'_bp13_b'],0.001);
% p.nc.dsmax=0.1; % Arclength max steplength
% p=cont(p,400);
% 
% %%
% p=swibra(Fname,'bpt14',[Fname,'_bp14_b'],0.001);
% p.nc.dsmax=0.1; % Arclength max steplength
% p=cont(p,400);
% 
% %%
% p=swibra(Fname,'bpt15',[Fname,'_bp15_b'],0.001);
% p.nc.dsmax=0.1; % Arclength max steplength
% p=cont(p,400);
% 
% %%
% p=swibra(Fname,'bpt23',[Fname,'_bp23_b'],0.001);
% p.nc.dsmax=0.1; % Arclength max steplength
% p=cont(p,400);

% 
% %%
% p=swibra(Fname,'bpt5',[Fname,'_bp5_b'],0.001);
% p.nc.dsmax=0.1; % Arclength max steplength
% p=cont(p,200);
% 
% %%
% p=swibra(Fname,'bpt7',[Fname,'_bp7_b'],0.001);
% p.nc.dsmax=0.1; % Arclength max steplength
% p=cont(p,200);
% %%
% p=swibra(Fname,'bpt8',[Fname,'_bp7_b'],0.001);
% p.nc.dsmax=0.1; % Arclength max steplength
% p=cont(p,200);

function r=sG(p,u) % pde for Schnak
par=u(p.nu+1:end); %{'a', 'b','d'}
u=u(1:p.nu);n=p.np;u1=u(1:n); u2=u(n+1:2*n); % Seperate parameters and variables
L=par(1);
c1=par(2);
cn1=par(3);
c2=par(4);
c3=par(5);

f1=c1-cn1*u1+c3*u1.^2.*u2;
f2=c2-c3*u1.^2.*u2;
f=[f1;f2]; % Nonlinear kinetics

gr=p.pdeo.grid; fem=p.pdeo.fem; % Grid components
K=p.mat.K; N=spd(zeros(n,1));

Qu=p.mat.Qu; Qv=p.mat.Qv; bcu=p.mat.Gu; bcv=p.mat.Gv;
r=[1e-4*K/L^2 N; N 1e-2*K/L^2]*[u1;u2]-p.mat.M*f; % putting the equation together
end

function A=spd(v)
n=length(v);
A=spdiags(v,0,n,n);
end


function out=outfn(p,u)
% output to bifurcation diagram function
% u=u(1:p.nu);n=p.np;u1=u(1:n); u2=u(n+1:2*n); % Seperate parameters and variables
out=[u(p.nu+1:end); % parameters
    max(u(1:p.np));
    min(u(1:p.np))];
end