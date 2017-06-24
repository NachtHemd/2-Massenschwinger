d1=0.5;
d2=0.5;
m1=4;
m2=1;
c1=120;
c2=120;
t=20;
g=9.81;
x10 = 0;
x20 = 0;
F= 100;
omega= 9.2;

sim('cd2moscillator', t);

weg1 = x1.signals.values;
weg2 = x2.signals.values;
time = x1.time;
kraft = force.signals.values;
%plot(x.time,x.signals.values)
%xlabel('zeit')
%ylabel('auslenkung')
figh = figure;
for i=1:length(weg1)
    if ~ishghandle(figh)
        break
    end
hold off
plot([-7,7],[10,-20],'.','LineWidth',2)
hold on
line([-5,5],[0,0],'LineWidth',2) %blaue 0 linie
line([-0.5,-0.5],[0,-3-weg1(i)],'Color','y','LineWidth',2) %feder1
line([0.5,0.5],[0,-3-weg1(i)],'Color','g','LineWidth',2)  %dämpfer1
rectangle('Position',[-1 -4.5-weg1(i) 2 1.5],'Edgecolor','b','Facecolor','b','LineWidth',2)%masse1
line([-0.5,-0.5],[-4.5-weg1(i), -7.5-weg1(i)-weg2(i)],'Color','y','LineWidth',2)%feder2
line([0.5,0.5],[-4.5-weg1(i), -7.5-weg1(i)-weg2(i)],'Color','g','LineWidth',2)%dämpfer2
rectangle('Position',[-1 -9-weg1(i)-weg2(i) 2 1.5],'Edgecolor','r','Facecolor','r','LineWidth',2)%masse2
line([0,0],[-7.5-weg1(i)-weg2(i)-0.75, -7.5-weg1(i)-weg2(i)-0.75-(1.5*asinh(kraft(i)/15))],'Color','m','LineWidth',4)
force = strcat(int2str(kraft(i)),' N')
if i == 1
    pause(3);
else
pause(time(i)-time(i-1));
end
end