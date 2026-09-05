a={}pal({10,11,12,-15},1)for d=0,63do a[d]={}for e=0,63do a[d][e]=rnd(3)\1+1end end e={}h={"🐱","😐","웃"}n=64o=64t=0d=75i=100l=0f=1r=0s=true::e::cls()if btn(3)and o<=315do o+=1elseif btn(2)and o>=0do o-=1end if btn(0)and n>=0do n-=1elseif btn(1)and n<=315do n+=1end g=n\5c=o\5if btnp(4)and a[c][g]==3do a[c][g]=1d=min(d+10,75)?"⁷i6v2e2d1c1c1"
end if btnp(5)and l==0do?"⁷i6v2e3d3c2b1"
l=10for d=1,#e do if e[d]do if abs(e[d][2]-n)<10and abs(e[d][3]-o)<10and e[d][5]==0do e[d][4]-=f e[d][5]=10if e[d][4]<=0do r+=e[d][1]*10+rnd(20)\1i=min(i+e[d][1]*10,95+f*5)if r>=f*100do?"⁷i3s8v2eafb"
f+=1r=0end deli(e,d)end end end end end t+=1if t%19==0do d=max(d-1,0)if d==0do i-=1end end if t%1800==0do s=not s if s do pal({10,11,12,-15},1)else pal({4,3,1,-15},1)end end if t%30==0and rnd(5)\1==0do e[#e+1]={0,rnd(300)+10,rnd(300)+10,rnd(3+f/2)\1,0,0}elseif t%60==0do if s do if rnd(15)\1==0do e[#e+1]={rnd(f+1)\1,rnd(300)+10,rnd(300)+10,rnd(5)\1,0,rnd(2)\1+1}end else if rnd(10)\1==0do e[#e+1]={rnd(f+2)\1,rnd(300)+10,rnd(300)+10,rnd(5)\1,0,rnd(2)\1+1}end end end v=n-62b=o-63camera(v,b)u=max(v\5,0)m=min((v+128)\5,63)w=max(b\5,0)y=min((b+128)\5,63)for d=w,y do for e=u,m do rectfill(e*5,d*5,(e+1)*5,(d+1)*5,a[d][e])end end rect(g*5,c*5,g*5+4,c*5+4,7)if l~=0do l-=1circfill(n,o,7,8)end for d=1,#e do if e[d][1]==0do if rnd(2)\1==1do e[d][3]+=rnd(4)-2e[d][2]+=rnd(4)-2e[d][3]=min(max(e[d][3],0),315)e[d][2]=min(max(e[d][2],0),315)end if e[d][5]==0do?"★",e[d][2],e[d][3],9
else e[d][5]-=1?"★",e[d][2],e[d][3],e[d][5]%2+8
end else if rnd(2)\1==1do p=atan2(n-e[d][2],o-e[d][3])e[d][3]=min(max(e[d][3]+sin(p)*1.5,0),315)e[d][2]=min(max(e[d][2]+cos(p)*1.5,0),315)if abs(e[d][2]-n)<10and abs(e[d][3]-o)<10and e[d][5]==0do i-=e[d][1]end end if e[d][5]==0do?h[e[d][6]],e[d][2],e[d][3],9
else e[d][5]-=1?h[e[d][6]],e[d][2],e[d][3],e[d][5]%2+8
end end end if i==0do print"⁷s8bagfedc"goto d end?"웃",n-3,o-2,0
?"dmg: "..f..", time: "..t\30%120 .."\nhp: "..i.."/"..95+f*5 .."\nwater: "..d.."/75\nexp: "..r.."/"..f*100,n-61,o+40,4
flip()goto e::d::cls()camera()?"you died!\nreached level: "..f.." ("..f*100-100+r..")\nthanks for playing!\n-rewind",5,5,7
flip()goto d
