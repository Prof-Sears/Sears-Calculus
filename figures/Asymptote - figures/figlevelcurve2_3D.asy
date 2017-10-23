import graph3;

//ASY file for figlevelcurve23D.asy in Chapter 12

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(3,-4,.3);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={-5,5};
real[] myychoice={-5,5};
real[] myzchoice={-.7,.7};
defaultpen(0.5mm);
pair xbounds=(-6,6);
pair ybounds=(-6,6);
pair zbounds=(-0.9,0.9);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw surface z=(x+y)/(1+x^2+y^2)
triple f(pair t) {
  return (t.x,t.y,(t.x+t.y)/(1+(t.x)^2+(t.y)^2));
}
surface s=surface(f,(-6,-6),(6,6),16,16,Spline);
pen p=rgb(0,0,.7);
draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//Draw level curves for surface x^2/9+y^2/4+z^2=1 at c=0.2,0.4,0.6
real[] A={0.2,0.4,0.6};
for (int i=0; i<3; ++i)
{
  triple g(real t) {
	return (1/(2*A[i])+(cos(t))*sqrt(-1+(1/(2*A[i]^2))),1/(2*A[i])+(sin(t))*sqrt(-1+(1/(2*A[i]^2))),A[i]);}
	path3 mypath=graph(g,0,2*pi,operator ..); draw(mypath,blue);
	//Negative values too
	triple g(real t) {
	return (1/(-2*A[i])+(cos(t))*sqrt(-1+(1/(2*A[i]^2))),1/(-2*A[i])+(sin(t))*sqrt(-1+(1/(2*A[i]^2))),-A[i]);}
	path3 mypath=graph(g,0,2*pi,operator ..); draw(mypath,blue);
}

draw((-5,5,0)--(5,-5,0),blue);

//triple g(real t) {
//return (1/(2*0.6)+(cos(t))*sqrt(-1+(1/(2*0.6^2))),1/(2*0.6)+(sin(t))*sqrt(-1+(1/(2*0.6^2))),0.6);}
//path3 mypath=graph(g,0,2*pi,operator ..); draw(mypath,blue);







// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//Draw the parabola z=y^2 for t from -2 to 2
//triple g(real t) {return (0,t,t^2);}
//path3 mypath=graph(g,-2,2,operator ..); draw(mypath,blue);


//Draw the surface z=1/(1+x^2+y^2)
//triple f(pair t) {
//  return (t.x,t.y,1/(1+(t.x)^2+(t.y)^2));
//}
//surface s=surface(f,(-2,-2),(2,2),8,8,Spline);
//pen p=rgb(0,0,.7);
//draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);


//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-2,2,operator ..);

//pen p=rgb(0,0,1);
//draw(s,paleblue+opacity(.5),meshpen=p,render(merge=true));

//draw(s,paleblue);
//draw(s,lightblue,meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+blue);