%已知P1,P2两点.P1,P2分别发出一连串射线组成一个曲面.求这两个曲面的交线.

%暂时不支持反向出界(见48行与61行)(挑战杯前晚注)
function curve=Ls22curve(L1,L2)
N1=size(L1,1); ii=1;
N2=size(L2,1); jj=1;

curve=zeros(500,3); 

%初始化:求第一个交点
while 1
    if ii>N1 || jj>N2; curve=[];return; end;
    [flag,P]=f(L2(jj,:),L2(jj+1,:),L1(ii,:));
    if flag<0
        ii=ii+1;
    elseif flag>0
        if jj+1==N2
            if ii==1
                curve=[]; return;
            else
                break;
            end
        else
            jj=jj+1;
        end
    else
        break;
    end
end

if ii==1%L1第1个可插入L2的jj到jj+1个之间
    curve(1,:)=P;kk=2;jj=jj+1;
else %L2的第1个可插入L1的第ii-1到ii个之间
    jj=1;ii=ii-1; kk=1;
end
host=2;

%求剩下的交点
loop=1;temp=1;
while ii<=N1 && ii>0 && jj<=N2 && jj>0;
    loop=loop+1; if loop>200, break; end
    if host==1
        if jj+1>N2,break; end
        [flag,P]=f(L2(jj,:),L2(jj+1,:),L1(ii,:));
        if flag==0
            curve(kk,:)=P; kk=kk+1;
            jj=jj+1; host=2;
        else %若flag<0 说明L2反向拐弯了, 或者L1反向出界
            jj=jj+1; ii=ii-1; host=2;
            if flag<0|| loop==temp+1
                 jj=jj-2;
            end
            temp=loop;
        end    
    else %host==2
        if ii+1>N1,break; end
        [flag,P]=f(L1(ii,:),L1(ii+1,:),L2(jj,:));
        if flag==0
            curve(kk,:)=P;kk=kk+1;
            ii=ii+1;host=1;
        else% flag<0 说明L1反向拐弯了, 或者L2反向出界
            ii=ii+1; jj=jj-1; host=1;
            if flag<0|| loop==temp+1
                 ii=ii-2;
            end
            temp=loop;
        end
    end
end

curve(kk:end,:)=[];
end

%分别给定同一点的两条射线L1,L2(组成一个三角平面).
%和另一点的一条射线L,L交L1,L2组成的平面与P
%分3种情况讨论
%1.P落在L1之前(flag=-1)
%2.P落在L2之后(flag=1)
%3.P落在L1,L2之间(flag=0)

function [flag,P]=f(L1,L2,L)
%1.计算交点
Plane=L22Plane(L1,L2); n=Plane(4:6);
P=LPlane2P(L,Plane);
%2.判断区域
V=P-L1(1:3);
if dot(cross(V,L1(4:6)),n)>0 %情况1
    flag=-1;
elseif dot(cross(V,L2(4:6)),n)<0 %情况2
    flag=1;
else %情况3
    flag=0;
end

end