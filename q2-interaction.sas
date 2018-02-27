options ls=80;
data a;
input x1-x3 y @@;
x4=x1*x2;
x5=x1*x3;
x6=x2*x3;
datalines;
1	1	1	13876
1	3	0	11608
1	3	1	18701
1	2	0	11283
1	3	0	11767
2	2	1	20872
2	2	0	11772
2	1	0	10535
2	3	0	12195
3	2	0	12313
3	1	1	14975
3	2	1	21371
3	3	1	19800
4	1	0	11417
4	3	1	20263
4	3	0	13231
4	2	0	12884
5	2	0	13245
5	3	0	13677
5	1	1	15965
6	1	0	12336
6	3	1	21352
6	2	0	13839
6	2	1	22884
7	1	1	16978
8	2	0	14803
8	1	1	17404
8	3	1	22184
8	1	0	13548
10	1	0	14467
10	2	0	15942
10	3	1	23174
10	2	1	23780
11	2	1	25410
11	1	0	14861
12	2	0	16882
12	3	1	24170
13	1	0	15990
13	2	1	26330
14	2	0	17949
15	3	1	25685
16	2	1	27837
16	2	0	18838
16	1	0	17483
17	2	0	19207
20	1	0	19346


;
/*
proc princomp;
var x1-x4; */
/*
proc corr;
var x1-x4;

*/
proc reg data=a;
model y=x1-x6 /selection=stepwise;
model y=x1-x6/dw;
output out=new r=res p=pred;
run;
proc princomp;
var x1- x6;
run;
proc corr;
var x1 - x6;
run;
;
proc plot;
  plot res*pred='P' / vpos=35 hpos=80;
  plot res*x='X'/ vpos=35 hpos=80;
run;
proc univariate;
var res;
qqplot res;
run;
