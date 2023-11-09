(* ::Package:: *)

(* ::Section:: *)
(*1.1.:*)


(* ::Input:: *)
(*Get["C:\\Users\\Marko\\Documents\\Faks\\Faks\\Napredna Ra\[CHacek]unalni\[SHacek]ka Orodja\\Rac_Pi.m"]*)
(*Ra\[CHacek]= Ra\[CHacek]un[69420];*)


(* ::Input:: *)
(*Ra\[CHacek]Pi = Ra\[CHacek][[1]]*)
(*KoZun = Ra\[CHacek][[2]];*)
(*KoNot = Ra\[CHacek][[3]];*)


(* ::Input:: *)
(*p1 = ListPlot[KoNot, PlotStyle->Red];*)
(*p2 = ListPlot[KoZun, PlotStyle->Blue];*)
(*p3 = ParametricPlot[{Cos[t],Sin[t]},{t,0,2Pi},PlotStyle->{Green,Thick}];*)
(*Show[p1,p2,p3,AspectRatio->1,PlotRange->All]*)


(* ::Section:: *)
(*1.2.:*)


(* ::Input:: *)
(*f[t_] = Sin[t]t^2 E^-t*)


(* ::Input:: *)
(*Plot[f[t],{t,0,4},PlotRange->All]*)


(* ::Input:: *)
(*Clear[n,m]*)
(*m= Table[Normal[Series[f[t],{t,2,n}]],{n,1,10}];*)
(**)
(*Plot[m,{t,0,4},PlotRange->All]*)


(* ::Input:: *)
(*Manipulate[Plot[{m[[n]],f[t]},{t,0,4},PlotRange->{{0,4},{-.5,1}},Filling->{1->{2}},FillingStyle->Yellow],{n,1,10,1}]*)
