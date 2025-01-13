function p=oosetfemops(p)
gr=p.pdeo.grid;
[p.mat.K,M,~]=p.pdeo.fem.assema(p.pdeo.grid,1,1,1); % FEM/mass matrices
p.mat.M=kron([[1,0];[0,1]],M);
% mass matrix adaption for the problem, as it is a system
bcu=gr.robinBC(1,1);gr.makeBoundaryMatrix(bcu); % bottom, right, top, left
[Qu,Gu,~,~]=p.pdeo.fem.assemb(gr); % the BC matrices 
bcv=gr.robinBC(1,0.9);gr.makeBoundaryMatrix(bcv); % bottom, right, top, left
[Qv,Gv,~,~]=p.pdeo.fem.assemb(gr); % the BC matrices 

p.mat.Qu=Qu; p.mat.Gu=Gu; % BC matrices for u 
p.mat.Qv=Qv; p.mat.Gv=Gv; % BC matrices for v 
end 
