o={}pal({10,11,12,-15},1)for e=0,63do o[e]={}for n=0,63do o[e][n]=rnd(3)\1+1end end n={}b={"🐱","😐","웃"}f=64i=64t=0e=75h=100r=0d=1a=0l=true::n::cls()if btn(3)and i<=315do i+=1elseif btn(2)and i>=0do i-=1end if btn(0)and f>=0do f-=1elseif btn(1)and f<=315do f+=1end s=f\5g=i\5if btnp(4)and o[g][s]==3do o[g][s]=1e=min(e+10,75)?"⁷i6v2e2d1c1c1"
end if btnp(5)and r==0do?"⁷i6v2e3d3c2b1"
r=10for e=1,#n do if n[e]do if abs(n[e][2]-f)<10and abs(n[e][3]-i)<10and n[e][5]==0do n[e][4]-=d n[e][5]=10if n[e][4]<=0do a+=n[e][1]*10+rnd(20)\1h=min(h+n[e][1]*10,95+d*5)if a>=d*100do?"⁷i3s8v2eafb"
d+=1a=0end deli(n,e)end end end end end t+=1if t%19==0do e=max(e-1,0)if e==0do h-=1end end if t%1800==0do l=not l if l do pal({10,11,12,-15},1)else pal({4,3,1,-15},1)end end if t%60==0do if l do if rnd(15)\1==0do n[#n+1]={rnd(d+1)\1,rnd(300)+10,rnd(300)+10,rnd(5+d)\1,0,rnd(2)\1+1}end else if rnd(10)\1==0do n[#n+1]={rnd(d+2)\1,rnd(300)+10,rnd(300)+10,rnd(5+d)\1,0,rnd(2)\1+1}end end end if t%30==0and rnd(5)\1==0do n[#n+1]={0,rnd(300)+10,rnd(300)+10,rnd(3+d/2)\1,0,0}end c=f-62v=i-63camera(c,v)u=max(c\5,0)m=min((c+128)\5,63)w=max(v\5,0)y=min((v+128)\5,63)for e=w,y do for n=u,m do rectfill(n*5,e*5,(n+1)*5,(e+1)*5,o[e][n])end end rect(s*5,g*5,s*5+4,g*5+4,7)if r~=0do r-=1circfill(f,i,7,8)end for e=1,#n do if n[e][1]==0do if rnd(2)\1==1do n[e][3]+=rnd(4)-2n[e][2]+=rnd(4)-2n[e][3]=min(max(n[e][3],0),315)n[e][2]=min(max(n[e][2],0),315)end if n[e][5]==0do?"★",n[e][2],n[e][3],9
else n[e][5]-=1?"★",n[e][2],n[e][3],n[e][5]%2+8
end else if rnd(2)\1==1do p=atan2(f-n[e][2],i-n[e][3])n[e][3]=min(max(n[e][3]+sin(p)*1.5,0),315)n[e][2]=min(max(n[e][2]+cos(p)*1.5,0),315)if abs(n[e][2]-f)<10and abs(n[e][3]-i)<10and n[e][5]==0do h-=n[e][1]end end if n[e][5]==0do?b[n[e][6]],n[e][2],n[e][3],9
else n[e][5]-=1?b[n[e][6]],n[e][2],n[e][3],n[e][5]%2+8
end end end if h==0do print"⁷s8bagfedc"goto e end?"웃",f-3,i-2,0
?"dmg: "..d..", time: "..t\30%120 .."\nhp: "..h.."/"..95+d*5 .."\nwater: "..e.."/75\nexp: "..a.."/"..d*100,f-61,i+40,4
flip()goto n::e::cls()camera()?"you died!\nreached level: "..d.." ("..d*100-100+a..")\nthanks for playing!\n-rewind",5,5,7
flip()goto e
