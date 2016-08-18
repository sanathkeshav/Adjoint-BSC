%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Hicks-Henne Bump function Parameterization                   %
%                   16 Aug 2016                                      %
%             3D Wing parameterization                               %
%                                                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;
clc;
format long;
load airfoils/oneraup.txt
load airfoils/oneradown.txt
ubase = oneraup(:,2);
xu = oneraup(:,1);
lbase = oneradown(:,2);
xl = oneradown(:,1);

panels = 11;
hh = 5;
t_b = 4;
ypanelpos = zeros(panels,1);
xpanelpos = zeros(panels,1);
chordlen = zeros(panels,1);
ubasepanel = zeros(panels,size(ubase,1));
lbasepanel = zeros(panels,size(lbase,1));
unewpanel = zeros(panels,size(ubase,1));
lnewpanel = zeros(panels,size(lbase,1));
xubasepanel = zeros(panels,size(ubase,1));
xlbasepanel = zeros(panels,size(lbase,1));
xunewpanel = zeros(panels,size(ubase,1));
xlnewpanel = zeros(panels,size(lbase,1));

span = 1196.3;
tspan = 2734.5;
xspan = 1578.7;
sweep = 26.7;
leangle = 60;
teangle = 74.219120;
sweep = sweep*pi/180;
leangle = leangle*pi/180;
teangle = teangle*pi/180;
ypanelpos = 0:span/(panels-1):span;
dpa = zeros(panels,hh);
dpb = zeros(panels,hh);

for i = 1:panels
    h = 1/(hh+1);
    bump_pos = 0+h:h:1-h;
    xpanelpos(i) = (tspan-ypanelpos(i))/tan(0.5*pi-sweep);
    chordlen(i) = ((tspan-ypanelpos(i))/tan(leangle)) - ((tspan-ypanelpos(i))/tan(teangle));
    ubasepanel(i,:) = chordlen(i).*ubase;
    lbasepanel(i,:) = chordlen(i).*lbase;
    bump_pos = chordlen(i).*bump_pos;
    xubasepanel(i,:) = chordlen(i).*xu;
    xlbasepanel(i,:) = chordlen(i).*xl;
    bump_pos = bump_pos - (tspan-ypanelpos(i))/tan(leangle);
    xubasepanel(i,:) = xubasepanel(i,:) - (tspan-ypanelpos(i))/tan(leangle);
    xlbasepanel(i,:) = xlbasepanel(i,:) - (tspan-ypanelpos(i))/tan(leangle);
    
%     hold on;
%     for j = 1:size(ubase,1)
%        scatter3(xubasepanel(i,j),ubasepanel(i,j),ypanelpos(i),'r.');
%     end
%     for j = 1:size(lbase,1)
%        scatter3(xlbasepanel(i,j),lbasepanel(i,j),ypanelpos(i),'r.');
%     end
%     axis equal tight;
    
     

end



