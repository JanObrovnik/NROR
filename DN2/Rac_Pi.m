(* ::Package:: *)

Ra\[CHacek]un[\[CapitalSHacek]tTo\[CHacek]k_]:=
Module[{A,i,AManj,AVe\[CHacek],PiRa\[CHacek]},
A = RandomReal[{-1,1},{\[CapitalSHacek]tTo\[CHacek]k,2}];
AManj = {}; AVe\[CHacek]={};

For[i=1,i<=Length[A],i++,{
If[Sqrt[A[[i]][[1]]^2+A[[i]][[2]]^2] >= 1,
AVe\[CHacek] = Append[AVe\[CHacek],A[[i]]],
AManj = Append[AManj,A[[i]]]]}];

PiRa\[CHacek] = N [4*Length[AManj]/(Length[AVe\[CHacek]]+Length[AManj])];
Return[{PiRa\[CHacek],AVe\[CHacek],AManj}]]
