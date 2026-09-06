poke(24412,255)d={}pal({10,11,12,-15},1)l={{{1,2,3},{2},{1,3}},{{1,2},{1,2},{1}},{{1,3},{1},{3}}}for e=0,63do d[e]={}for n=0,63do if n~=0do if e~=0do d[e][n]=l[d[e-1][n]][d[e][n-1]][rnd(#l[d[e-1][n]][d[e][n-1]])\1+1]else d[e][n]=l[2][d[e][n-1]][rnd(#l[2][d[e][n-1]])\1+1]end else d[e][0]=rnd(3)\1+1end end end h={}m={"🐱","😐","웃"}i=63f=63t=0e=75o=100s=0n=1a=0r=true::e::cls()if btn(3)do f=min(f+1,315)elseif btn(2)do f=max(f-1,0)end if btn(0)do i=max(i-1,0)elseif btn(1)do i=min(i+1,315)end v=i\5c=f\5if btnp(4)and d[c][v]==3do d[c][v]=1e=min(e+10,75)?"⁷i6v2e2d1c1c1"
o+=.1end if btnp(5)and s==0do?"⁷i6v2e3d3c2b1"
s=10for e in all(h)do if e do if abs(e[2]-i)<10and abs(e[3]-f)<10and e[5]==0do e[4]-=n e[5]=10if e[4]<=0do a+=e[1]*10+rnd(20)\1o+=e[1]*10if a>=n*100do?"⁷i3s8v2eafb"
n+=1a=0end del(h,e)end end end end end t+=1if t%19==0do e=max(e-1,0)if e==0do o-=1end end if t%1800==0do r=not r if r do pal({10,11,12,-15},1)else pal({4,3,1,-15},1)end end if t%60==0do if r do if rnd(max(15-n,0))\1==0do h[#h+1]={rnd(3)\1+n,rnd(300)+10,rnd(300)+10,rnd(n*2)\1+n,0,rnd(2)\1+1}end else if rnd(max(10-n,0))\1==0do h[#h+1]={rnd(5)\1+n,rnd(300)+10,rnd(300)+10,rnd(n*3)\1+n,0,rnd(2)\1+1}end end end if t%30==0and rnd(5)\1==0do h[#h+1]={0,rnd(300)+10,rnd(300)+10,rnd(3+n/2)\1,0,rnd(2)\1+1}end g=i-63p=f-63camera(g,p)u=max(g\5,0)b=min((g+128)\5,63)w=max(p\5,0)y=min((p+128)\5,63)for e=w,y do for n=u,b do rectfill(n*5,e*5,(n+1)*5,(e+1)*5,d[e][n])end end rect(v*5,c*5,v*5+4,c*5+4,7)if s~=0do s-=1circfill(i,f,7,8)end for e in all(h)do if e[1]==0do if rnd(2)\1==0do e[3]=min(max(e[3]+rnd(4)-2,0),315)e[2]=min(max(e[2]+rnd(4)-2,0),315)end if e[5]==0do?"★",e[2]-3,e[3]-3,9
else e[5]-=1?"★",e[2]-3,e[3]-3,e[5]%2+8
end else x=atan2(i-e[2],f-e[3])e[3]+=sin(x)e[2]+=cos(x)if abs(e[2]-i)<10and abs(e[3]-f)<10and e[5]==0do o-=e[1]?"⁷i6v3c1"
end if e[5]==0do?m[e[6]],e[2]-3,e[3]-3,9
else e[5]-=1?m[e[6]],e[2]-3,e[3]-3,e[5]%2+8
end end end if o<=0do goto n end?"웃",i-3,f-2,0
?"dmg: "..n..", time: "..t\30 .."\nhp: "..o\1 .."\nwtr: "..e.."/75\nxp: "..a.."/"..n*100,i-61,f+40,4
flip()goto e::n::cls()camera()?"u died!\nxp: "..n*100-100+a..", time: "..t/30 .."\nthx for playing",0,0,7
