unit Unit2;

interface

uses Windows, Messages, SysUtils, Dialogs;

 procedure FigureMaker1;
 procedure FigureMaker2;
 procedure FigureCreate; ////Подпрогорамма создания фигуры vf=1,2
 procedure SM1sistem;
 procedure SM2sistem;
 procedure BlockSmTslTst(bm,bsl,bst:Boolean);
 procedure FigureDelete1;
 procedure SDelete1;
 procedure SistemK;
 function rule100_SB(gg:Integer; vv:Boolean):Integer;
 function RB22_VN_and_shlopivanie38:Boolean;
 function RB22_VR_and_shlopivanie410:Boolean;
 function Nakl_SB22_VN:Boolean;
 function Nakl_SB22_VR:Boolean;


Var f, fk, f2, s, bud, bod: Integer;
    vf, sk, op, li: array of Integer; //vf-тип фигуры, s-№ступени в фигуре
    ly: array of Real;
    tsn,tsl,tsp,tss,tsk,tst,ks: array of array of Integer;
    sm,pt,cp: array of array of real;
    mxj, mnj, pm: Real;
    

implementation
uses Unit1, Unit3;

procedure FigureMaker1;  //ПРОГРАММА СОЗДАНИЯ ФИГУР№1!!!!!!!!!!!!!!!!!!!!!!!1
Var fn,Nbc: Integer;
Label VF378, m100sb22, Xrb22,of_vf13,shablon2,bcsb22;
begin
 f:=fk; s:=sk[f]; f2:=0; pm:=0; mxj:=max[tk[j]]; mnj:=min[tk[j]]; Nbc:=0;
 if max[tn[j-1]]>max[tk[j]] then begin
  if f=0 then begin
    FigureCreate; vf[f]:=1; SM1sistem; Exit;
  end else case vf[f] of
   4,10: begin
     FigureCreate; vf[f]:=1; SM1sistem; Exit;
   end;
   1,2,13,98,99: begin
     case vf[f] of
      1: begin tss[f,1]:=tk[j]; BlockSmTslTst(true,false,false); tsk[f,1]:=tk[j]; BlockSmTslTst(false,true,true); end;
      2,13,98: begin
        if (vf[f]=13) and (sk[f]=1) and (f>1) and (vf[f-1]=7) then begin
          tsl[f-1,sk[f-1]]:=tsl[f,s]; tsp[f-1,sk[f-1]]:=tsp[f,s]; tss[f-1,sk[f-1]]:=tss[f,s]; tsk[f-1,sk[f-1]]:=tsk[f,s]; tst[f-1,sk[f-1]]:=tst[f,s];
          FigureDelete1; s:=sk[f]; vf[f]:=8;
        end;
        FigureCreate; vf[f]:=1; SM1sistem;
      end;
      99: begin
        if t[tn[j-1]]=t[tsk[f,s]] then begin FigureCreate; vf[f]:=1; SM1sistem;
        end else begin
          tss[f,s]:=tk[j]; tsk[f,s]:=tk[j]; BlockSmTslTst(true,true,true);
          repeat f:=f-1; s:=sk[f] until vf[f] in [1,3,8];
          if vf[f] in [3,8] then goto VF378
          else if vf[f]=1 then begin tss[f,1]:=tk[j]; BlockSmTslTst(true,false,false); tsk[f,1]:=tk[j]; BlockSmTslTst(false,true,true); end;
        end;
      end;
     end;
     m100sb22:
     f2:=f; f:=f-1; if f=0 then Exit; s:=sk[f];
     while vf[f] in [2,4,10,14,98,99] do begin  //ищем сб2/2
       f:=f-1; if f=0 then Exit; s:=sk[f];
     end;
     if vf[f] in [1,3,8,13] then begin
       if (vf[f]=13) and (sk[f]=1) and (f>1) and (vf[f-1]=7) then begin
          if tsk[f,s]<>tss[f,s] then begin
            if pm=0 then BlockSmTslTst(true,false,false) else begin sm[f,s]:=sm[f,s]+pm-pt[f,s]; pt[f,s]:=pt[f2,sk[f2]]; end;
            tsk[f,s]:=tsk[f2,sk[f2]];
          end;
          tsl[f-1,sk[f-1]]:=tsl[f,s]; tsp[f-1,sk[f-1]]:=tsp[f,s]; tss[f-1,sk[f-1]]:=tss[f,s]; tsk[f-1,sk[f-1]]:=tsk[f,s]; tst[f-1,sk[f-1]]:=tst[f,s];
          FigureDelete1; s:=sk[f]; vf[f]:=8; pm:=0; Nbc:=1; goto Xrb22;
          bcsb22: Nbc:=0;
       end;
       case rule100_SB(0,false) of
        0: begin pm:=0; if sk[f]=1 then vf[f]:=1 else vf[f]:=8; Exit; end;
        1: begin
          if tsk[f,s]=tss[f,s] then begin
            if (tsl[f,s]<>tsp[f,s]) and (t[tst[f,s]]-t[tsl[f,s]]<=0.5*(t[tsk[f2,1]]-t[tsp[f,s]])) then begin tsl[f,s]:=tsp[f,s]; tst[f,s]:=tsk[f,s]; end;
            sm[f,s]:=sm[f,s]+sm[f2,sk[f2]]-pt[f,s]; pm:=sm[f2,sk[f2]];
          end else if ((pm=0) or (tsk[f,s]=tsk[f2,sk[f2]])) then BlockSmTslTst(true,false,false) else sm[f,s]:=sm[f,s]+pm-pt[f,s];
          pt[f,s]:=pt[f2,sk[f2]];
          if min[tsp[f2,sk[f2]]]<min[tsp[f,s]] then tsp[f,s]:=tsp[f2,sk[f2]];   //схема2
          tsk[f,s]:=tsk[f2,sk[f2]]; BlockSmTslTst(false,true,true);
          if rule100_SB(666,false)=666 then begin
            tss[f,s]:=tss[f2,sk[f2]]; tsk[f,s]:=tsk[f2,sk[f2]]; tst[f,s]:=tsk[f2,sk[f2]]; vf[f2]:=99;   //схема3
            if min[tsp[f2,sk[f2]]]<min[tsp[f,s]] then tsp[f,s]:=tsp[f2,sk[f2]];
            if min[tsl[f2,sk[f2]]]<min[tsl[f,s]] then begin tsl[f,s]:=tsl[f2,sk[f2]]; tst[f,s]:=tst[f2,sk[f2]]; end;
          end;
        end;
        2: begin
          vf[f]:=8; s:=s+1; sk[f]:=sk[f]+1;
          SetLength(tsn[f],sk[f]+1); SetLength(tsl[f],sk[f]+1); SetLength(tsp[f],sk[f]+1); SetLength(tss[f],sk[f]+1); SetLength(tsk[f],sk[f]+1);
          SetLength(tst[f],sk[f]+1); SetLength(pt[f],sk[f]+1); SetLength(sm[f],sk[f]+1); SetLength(cp[f],sk[f]+1);
          tsn[f,s]:=tsk[f,s-1]; tsl[f,s]:=tsl[f2,1]; tsp[f,s]:=tsp[f2,1]; tss[f,s]:=tss[f2,1]; tsk[f,s]:=tsk[f2,1]; tst[f,s]:=tst[f2,1];
          f:=f2; s:=sk[f]; FigureDelete1; f2:=0;
        end;
       end;
       case vf[f] of
        1: begin li[f]:=0; ly[f]:=0; goto m100sb22; end;
        3,8: begin pm:=0; goto Xrb22; end;
        13: begin if s>=2 then begin vf[f]:=8; pm:=0; goto Xrb22; end else begin vf[f]:=1; li[f]:=0; ly[f]:=0; goto m100sb22; end; end;
       end;
     end; //конец для vf=1,3,8,13
   end;
   3,7,8: begin
     VF378:      //из vf=99
     if (f=fk) and (tsk[f,s]=0) then begin vf[f]:=8; tss[f,s]:=tk[j]; tsk[f,s]:=tk[j]; tst[f,s]:=tk[j]; SM1sistem;
     end else begin vf[f]:=8; if (t[tn[j-1]]=t[tsk[f,s]]) and (pm=0) then SM2Sistem else BlockSmTslTst(true,false,false); tss[f,s]:=tk[j]; tsk[f,s]:=tk[j]; BlockSmTslTst(false,true,true); end;
     Xrb22:
     if RB22_VN_and_shlopivanie38=true then begin  //проверка РБ2/2 на Х и переход в др шаблон
       if s>2 then begin
         sm[f,s-1]:=sm[f,s-1]+sm[f,s]-pt[f,s-1]; pt[f,s-1]:=pt[f,s]; pm:=sm[f,s];
         SDelete1; goto Xrb22;
       end else if vf[f-1]=7 then begin
         tsp[f-1,sk[f-1]]:=tsp[f,1]; tss[f-1,sk[f-1]]:=tss[f,1]; tsk[f-1,sk[f-1]]:=tsk[f,1]; tsl[f-1,sk[f-1]]:=tsl[f,1]; tst[f-1,sk[f-1]]:=tst[f,1]; 
         if t[tsn[f,s-1]]=t[tsk[f-1,sk[f-1]-1]] then sm[f,s-1]:=sm[f,s-1]+sm[f,s]-pt[f,s-1];
         pt[f,s-1]:=pt[f,s]; pm:=sm[f,s];
         SDelete1;
         FigureDelete1; vf[f]:=8; BlockSmTslTst(false,true,true); goto Xrb22;
       end else begin
         sm[f,s-1]:=sm[f,s-1]+sm[f,s]-pt[f,s-1]; pt[f,s-1]:=pt[f,s]; pm:=sm[f,s];
         SDelete1; vf[f]:=1; li[f]:=0; ly[f]:=0;
         if Nbc=1 then goto bcsb22;
         if mxj>=max[tsn[f,s]] then goto shablon2 else goto m100sb22;
       end;
     end else begin vf[f]:=8; if Nbc=1 then goto bcsb22; Exit; end;
   end//конец vf[f]=3,7,8
  else MessageDlg('Ошибка в ФМё1, не выбрана ни 1 фигура'+inttostr(i),mtWarning,[mbOK],0); end;
 end //конец шаблона max[tn[j-1]]>max[tk[j]]
 else if max[tn[j-1]]<=max[tk[j]] then begin
  shablon2:
   repeat
    if f=0 then break;
    s:=sk[f];
    case vf[f] of
     98: f:=f-1;
     9: begin
       if max[tsl[f,s]]<max[tk[j]] then begin tsl[f,s]:=tk[j]; tsp[f,s]:=tk[j]; end;
       f:=f-1;
     end;
     2,4,10,14: begin
       if mxj>=max[tsp[f,s]] then begin
         if f=fk then begin
           fn:=f;
           repeat f:=f-1; s:=sk[f] until (f=0) or (vf[f] in [1,3,8]);
           if (f>0) and (t[tsk[f,sk[f]]]<t[tsk[fn,sk[fn]]]) then SM2sistem;
           f:=fn; s:=sk[f];
         end ;
         if Nakl_SB22_VR=true then begin //проверка на Х сб2/2 вр
           vf[f]:=14;
           if (sk[f]=1) and (mxj>max[tsp[f,s]]) and (li[f]=0) then li[f]:=t[i];
           fn:=f;
           while f<fk do begin f:=f+1;
             if vf[f]=98 then begin FigureDelete1; fn:=f; end;
           end;
           f:=fn-1;
         end else begin
           vf[f]:=9; s:=s+1; sk[f]:=sk[f]+1;
           SetLength(tsn[f],sk[f]+1); SetLength(tsl[f],sk[f]+1); SetLength(tsp[f],sk[f]+1); SetLength(tss[f],sk[f]+1); SetLength(tsk[f],sk[f]+1);
           SetLength(tst[f],sk[f]+1); SetLength(pt[f],sk[f]+1); SetLength(sm[f],sk[f]+1); SetLength(cp[f],sk[f]+1);
           tsn[f,s]:=tsk[f,s-1]; tsl[f,s]:=tk[j]; tsp[f,s]:=tk[j];
           f:=f-1;
         end;
       end else f:=f-1;
     end;
     3,7,8: goto VF378;
     13: begin
       li[f]:=0; ly[f]:=0;
       if (f=fk) and (t[i]>t[tsk[f,s]]) then begin SM2Sistem;
         if min[tsp[f,s]]>min[tn[j]] then tsp[f,s]:=tn[j];
       end else if (f<fk) and (vf[f+1] in [9,14]) then begin
         if min[tsp[f,s]]>min[tsn[f+1,1]] then tsp[f,s]:=tsn[f+1,1];
       end else if min[tsp[f,s]]>min[tn[j]] then tsp[f,s]:=tn[j];
       if s>1 then begin vf[f]:=8; goto VF378; end else goto of_vf13;
     end;
     1,99: begin
       of_vf13: //из vf=13
       if mxj>=max[tsn[f,s]]  then begin
         tss[f,s]:=tk[j]; if (t[tn[j-1]]=t[tsk[f,s]]) and (pm=0) then SM2Sistem else BlockSmTslTst(true,false,false); tsk[f,s]:=tk[j]; BlockSmTslTst(false,true,true);
         if (f-1>0) and (vf[f-1] in [1,3,7,8,13]) then begin
           if min[tsp[f,s]]<min[tsp[f-1,sk[f-1]]] then tsp[f-1,sk[f-1]]:=tsp[f,s];
         end;
         FigureDelete1;
       end else begin
         case vf[f] of
           13: begin
             if (f>1) and (vf[f-1]=7) then begin
               tsl[f-1,sk[f-1]]:=tsl[f,s]; tsp[f-1,sk[f-1]]:=tsp[f,s]; tss[f-1,sk[f-1]]:=tss[f,s]; tsk[f-1,sk[f-1]]:=tsk[f,s]; tst[f-1,sk[f-1]]:=tst[f,s];
               FigureDelete1; vf[f]:=8; s:=sk[f];
               goto VF378;
             end else begin vf[f]:=1; li[f]:=0; ly[f]:=0;
               tss[f,s]:=tk[j]; BlockSmTslTst(true,false,false); tsk[f,s]:=tk[j]; BlockSmTslTst(false,true,true); goto m100sb22;
             end;
           end;
           99: begin
             tss[f,s]:=tk[j]; tsk[f,s]:=tk[j]; BlockSmTslTst(true,true,true);
             repeat f:=f-1 until (f=0) or (vf[f] in [1,3,8]);
             s:=sk[f];
             if vf[f]=1 then begin li[f]:=0; ly[f]:=0; tss[f,s]:=tk[j]; if (t[tn[j-1]]=t[tsk[f,s]]) and (pm=0) then SM2Sistem else BlockSmTslTst(true,false,false); tsk[f,s]:=tk[j]; BlockSmTslTst(false,true,true); goto m100sb22; end;
             if vf[f] in [3,8] then goto VF378;
           end;
           1: begin li[f]:=0; ly[f]:=0; tss[f,s]:=tk[j]; if (t[tn[j-1]]=t[tsk[f,s]]) and (pm=0) then SM2Sistem else BlockSmTslTst(true,false,false); tsk[f,s]:=tk[j]; BlockSmTslTst(false,true,true); goto m100sb22; end;
         end;
       end;
     end; //конец vf=1 99 и конец поиска фигур
    end;
   until f=0;
 end;
end;

//----------------------------------------------
procedure FigureCreate; ////Подпрогорамма создания фигуры vf=1,2
begin
  f:=f+1; fk:=fk+1;
  SetLength(vf,fk+1);
  SetLength(sk,fk+1); SetLength(op,fk+1); SetLength(li,fk+1); SetLength(ly,fk+1);
  s:=1; sk[f]:=1; op[f]:=0;
  SetLength(tsn,fk+1); SetLength(tsl,fk+1); SetLength(tsp,fk+1); SetLength(tss,fk+1); SetLength(tsk,fk+1);  SetLength(tst,fk+1); SetLength(pt,fk+1); SetLength(sm,fk+1); SetLength(cp,fk+1);
  SetLength(tsn[f],2); SetLength(tsl[f],2); SetLength(tsp[f],2); SetLength(tss[f],2); SetLength(tsk[f],2);  SetLength(tst[f],2); SetLength(pt[f],2); SetLength(sm[f],2); SetLength(cp[f],2);
  tsn[f,1]:=tn[j-1];  tss[f,1]:=tk[j]; tsk[f,1]:=tk[j]; tst[f,1]:=tk[j];
  if ((max[tn[j-1]]>max[tk[j]]) and (max[i-1]<=max[i]) and (min[i-1]=min[i]))
  or ((min[tn[j-1]]<min[tk[j]]) and (max[i-1]=max[i]) and (min[i-1]>=min[i])) then begin tsl[f,1]:=i-1; tsp[f,1]:=i-1;
  end else begin tsl[f,1]:=tn[j]; tsp[f,1]:=tn[j]; end;
end;

procedure SM1sistem;
Var Tf: real;
    n, yn: integer;
begin
 Tf:=1+t[tsk[f,s]]-t[tsn[f,s]]; n:=0;
 if vf[f] in [1,8] then sm[f,s]:=smv[y]/nv[y] else sm[f,s]:=smn[y]/nm[y];
 n:=n+1; yn:=y-n;
 while n+1<Tf do begin  sm[f,s]:=sm[f,s]+(smv[yn]+smn[yn])/(nv[yn]+nm[yn]); n:=n+1; yn:=y-n; end;
 if vf[f] in [1,8] then begin
   if Tf>1 then sm[f,s]:=sm[f,s]+smn[yn]/nm[yn];
 end else if Tf>1 then sm[f,s]:=sm[f,s]+smv[yn]/nv[yn];
 if vf[f] in [1,8] then begin pt[f,s]:=smv[y]/nv[y]; srs:=pt[f,s];
 end else begin pt[f,s]:=smn[y]/nm[y]; srs:=pt[f,s]; end;
 sm[f,s]:=Round(sm[f,s]*100)/100; pt[f,s]:=Round(pt[f,s]*100)/100;
 pm:=sm[f,s];
end;
//--------------------------

procedure SM2sistem;
Var Tf,sh: real;
    n, yn: integer;
begin
 Tf:=1+t[tk[j]]-t[tsk[f,s]]; n:=0;
 if vf[f] in [1,3,8,13,99] then sh:=smv[y]/nv[y] else sh:=smn[y]/nm[y];
 n:=n+1; yn:=y-n;
 while n+1<Tf do begin  sh:=sh+(smv[yn]+smn[yn])/(nv[yn]+nm[yn]); n:=n+1; yn:=y-n; end;
 if vf[f] in [1,3,8,13,99] then begin
   if Tf>1 then sh:=sh+smn[yn]/nm[yn];
 end else if Tf>1 then sh:=sh+smv[yn]/nv[yn];
 sm[f,s]:=sh+sm[f,s]-pt[f,s];
 if vf[f] in [1,3,8,13,99] then begin pt[f,s]:=smv[y]/nv[y]; srs:=pt[f,s]; end else begin pt[f,s]:=smn[y]/nm[y]; srs:=pt[f,s]; end;
 pm:=sh; tsk[f,s]:=tk[j];
 sm[f,s]:=Round(sm[f,s]*100)/100; pt[f,s]:=Round(pt[f,s]*100)/100;
end;
//------------------------

procedure BlockSmTslTst(bm,bsl,bst:Boolean);
begin
 if bm=true then begin
   if vf[f] in [1,3,8,99] then begin
     if t[tsk[f,s]]=t[i] then sm[f,s]:=(sm[f,s]-srs)+smv[y]/nv[y] else sm[f,s]:=sm[f,s]+smv[y]/nv[y];
     srs:=smv[y]/nv[y]; pt[f,s]:=srs;
   end else begin
     if t[tsk[f,s]]=t[i] then sm[f,s]:=(sm[f,s]-srs)+smn[y]/nm[y] else sm[f,s]:=sm[f,s]+smn[y]/nm[y];
     srs:=smn[y]/nm[y]; pt[f,s]:=srs;
   end;
   sm[f,s]:=Round(sm[f,s]*100)/100; pt[f,s]:=Round(pt[f,s]*100)/100;
 end;
 if (bsl=true) and (tsl[f,s]<>tsp[f,s]) then begin
   if ((vf[f] in [1,3,8,13,99]) and ((min[tsl[f,s]]-min[tsp[f,s]])*0.97<=0.11*(1+max[tsn[f,s]]-min[tsl[f,s]])) )
      or ((vf[f] in [2,4,10,14,98]) and ((max[tsp[f,s]]-max[tsl[f,s]])*0.97<=0.11*(1+max[tsl[f,s]]-min[tsn[f,s]])) ) then tst[f,s]:=tsk[f,s];
   if (t[tst[f,s]]-t[tsl[f,s]]<=0.5*(t[tsk[f,s]]-t[tsp[f,s]])) then tsl[f,s]:=tsp[f,s];
   if (tst[f,s]<>tsk[f,s]) and (tst[f,s]>=tsp[f,s]) and (t[tsp[f,s]]-t[tsl[f,s]]<=0.7*(t[tsk[f,s]]-t[tsp[f,s]])) then tsl[f,s]:=tsp[f,s];
   if (tst[f,s]=tsk[f,s]) and (t[tsp[f,s]]-t[tsl[f,s]]<=0.34*(t[tsk[f,s]]-t[tsp[f,s]])) then tsl[f,s]:=tsp[f,s];
 end;
 if bst=true then begin
   if tsl[f,s]=tsp[f,s] then tst[f,s]:=tsk[f,s];
 end;
end;
//----------------------------


procedure FigureDelete1;  ////Подпрограмма удаления фигур
Var ii,nn,um2:Integer;
begin
 SetLength(ks,fk+1); for nn:=1 to fk do begin SetLength(ks[nn],sk[nn]+1); end;  nn:=0;
 if vf[f] in [1,3,7,8,13,99] then begin
   repeat nn:=nn+1 until (f-nn=0) or (vf[f-nn] in [1,3,7,8,13]);
   if (f-nn>0) and (vf[f]<>99) then begin
     if ((vf[f-nn] in [1,3,8,13]) and (tsk[f-nn,sk[f-nn]]<>tss[f-nn,sk[f-nn]]) and (sm[f-nn,sk[f-nn]]>0)) or ((vf[f-nn]=7) and (tsk[f-nn,sk[f-nn]-1]<>tss[f-nn,sk[f-nn]-1])) then begin
       if pm>0 then begin sm[f-nn,sk[f-nn]]:=sm[f-nn,sk[f-nn]]+pm-pt[f-nn,sk[f-nn]]; tsk[f-nn,sk[f-nn]]:=tsk[f,s]; end;
     end else begin sm[f-nn,sk[f-nn]]:=sm[f-nn,sk[f-nn]]+sm[f,s]-pt[f-nn,sk[f-nn]]; pm:=sm[f,s]; tsk[f-nn,sk[f-nn]]:=tsk[f,s]; end;
     pt[f-nn,sk[f-nn]]:=pt[f,s];
   end else begin if (f-nn>0) and (vf[f]=99) and (t[tsl[f-nn,sk[f-nn]]]>t[tsp[f-nn,sk[f-nn]]]) then tsl[f-nn,sk[f-nn]]:=tsp[f-nn,sk[f-nn]]; end;
 end else begin
   repeat nn:=nn+1 until (f-nn=0) or (vf[f-nn] in [2,4,9,10,14]);
   if (f-nn>0) and (vf[f]<>98) then begin
     if ((vf[f-nn] in [2,4,10,14]) and (tsk[f-nn,sk[f-nn]]<>tss[f-nn,sk[f-nn]]) and (sm[f-nn,sk[f-nn]]>0)) or ((vf[f-nn]=9) and (tsk[f-nn,sk[f-nn]-1]<>tss[f-nn,sk[f-nn]-1])) then begin
       if pm>0 then begin sm[f-nn,sk[f-nn]]:=sm[f-nn,sk[f-nn]]+pm-pt[f-nn,sk[f-nn]]; tsk[f-nn,sk[f-nn]]:=tsk[f,s]; end;
     end else begin sm[f-nn,sk[f-nn]]:=sm[f-nn,sk[f-nn]]+sm[f,s]-pt[f-nn,sk[f-nn]]; pm:=sm[f,s]; tsk[f-nn,sk[f-nn]]:=tsk[f,s]; end;
     pt[f-nn,sk[f-nn]]:=pt[f,s];
   end else begin if (f-nn>0) and (vf[f]=98) and (t[tsl[f-nn,sk[f-nn]]]>t[tsp[f-nn,sk[f-nn]]]) then tsl[f-nn,sk[f-nn]]:=tsp[f-nn,sk[f-nn]]; end;
 end;
 if f=fp then begin
   if vf[fp] in [1,3,7,8,13,99] then um2:=um2n else um2:=um2v;
   if (f>1) and (((vf[f] in [3,7,8,13]) and (vf[f-1]=7)) or ((vf[f] in [4,9,10,14]) and (vf[f-1]=9)))  then begin
     if 1+t[tsk[f-1,sk[f-1]]]-t[tsn[f-1,sk[f-1]]]<=um2 then begin
       fp:=fp-1; sp:=sk[fp]-1;
       if vf[f4]<>9 then begin tpvr:=0; f4:=0; end;
       if vf[f3]<>7 then begin tpvn:=0; f3:=0; end;
       if (vf[f5]<>7) and (vf[f5]<>9) then begin f5:=0; tsv:=trv; end;
     end else begin fp:=0; sp:=0; end;
   end else begin fp:=0; sp:=0; end;
 end;
 if f=f3 then begin f3:=0; tpvn:=0; end; if f=f4 then begin f4:=0; tpvr:=0; end;   if f=f5 then f5:=0;
 if f<f3 then f3:=f3-1; if f<f4 then f4:=f4-1; if f<f5 then f5:=f5-1; if f<fp then fp:=fp-1;
 if f<fk then begin
   for nn:=f to fk-1 do begin
     if sk[nn]<sk[nn+1] then begin
       SetLength(tsn[nn],Length(tsn[nn+1])); SetLength(tsl[nn],Length(tsl[nn+1])); SetLength(tsp[nn],Length(tsp[nn+1]));
       SetLength(tss[nn],Length(tss[nn+1])); SetLength(tsk[nn],Length(tsk[nn+1])); SetLength(tst[nn],Length(tst[nn+1]));
       SetLength(ks[nn],Length(ks[nn+1])); SetLength(pt[nn],Length(pt[nn+1])); SetLength(sm[nn],Length(sm[nn+1])); SetLength(cp[nn],Length(cp[nn+1]));
     end;
     for ii:=1 to sk[nn+1] do begin
       tsn[nn,ii]:=tsn[nn+1,ii];  tsl[nn,ii]:=tsl[nn+1,ii]; tsp[nn,ii]:=tsp[nn+1,ii]; tsk[nn,ii]:=tsk[nn+1,ii];
       tss[nn,ii]:=tss[nn+1,ii]; tst[nn,ii]:=tst[nn+1,ii]; ks[nn,ii]:=ks[nn+1,ii]; pt[nn,ii]:=pt[nn+1,ii]; sm[nn,ii]:=sm[nn+1,ii]; cp[nn,ii]:=cp[nn+1,ii];
     end;
     vf[nn]:=vf[nn+1]; op[nn]:=op[nn+1]; li[nn]:=li[nn+1]; ly[nn]:=ly[nn+1];
     if sk[nn]>sk[nn+1] then begin
       SetLength(tsn[nn],Length(tsn[nn+1])); SetLength(tsl[nn],Length(tsl[nn+1])); SetLength(tsp[nn],Length(tsp[nn+1]));
       SetLength(tss[nn],Length(tss[nn+1])); SetLength(tsk[nn],Length(tsk[nn+1])); SetLength(tst[nn],Length(tst[nn+1]));
       SetLength(ks[nn],Length(ks[nn+1])); SetLength(pt[nn],Length(pt[nn+1])); SetLength(sm[nn],Length(sm[nn+1])); SetLength(cp[nn],Length(cp[nn+1]));
     end;
     sk[nn]:=sk[nn+1];
   end;
 end;
 SetLength(vf,Length(vf)-1); SetLength(sk,Length(sk)-1); SetLength(op,Length(op)-1); SetLength(li,Length(li)-1); SetLength(ly,Length(ly)-1);
 SetLength(tsn,Length(tsn)-1); SetLength(tsl,Length(tsl)-1); SetLength(tsp,Length(tsp)-1); SetLength(tst,Length(tst)-1);
 SetLength(tss,Length(tss)-1); SetLength(tsk,Length(tsk)-1); SetLength(ks,Length(ks)-1); SetLength(pt,Length(pt)-1); SetLength(sm,Length(sm)-1);
 f:=f-1; fk:=fk-1; s:=sk[f]; if f2>0 then f2:=f2-1;
end;

procedure SDelete1;  ////Подпрограмма удаления ступени
Var ii:Integer;
begin
 if s<sk[f] then begin
   for ii:=s to sk[f]-1 do begin
     tsn[f,ii]:=tsn[f,ii+1]; tsl[f,ii]:=tsl[f,ii+1]; tsp[f,ii]:=tsp[f,ii+1]; tss[f,ii]:=tss[f,ii+1]; tsk[f,ii]:=tsk[f,ii+1];
     tst[f,ii]:=tst[f,ii+1]; ks[f,ii]:=ks[f,ii+1]; pt[f,ii]:=pt[f,ii+1]; sm[f,ii]:=sm[f,ii+1]; cp[f,ii]:=cp[f,ii+1];
   end;
 end;
 SetLength(tsn[f],Length(tsn[f])-1); SetLength(tsl[f],Length(tsl[f])-1); SetLength(tsp[f],Length(tsp[f])-1);
 SetLength(tss[f],Length(tss[f])-1); SetLength(tsk[f],Length(tsk[f])-1); SetLength(tst[f],Length(tst[f])-1);
 SetLength(ks[f],Length(ks[f])-1); SetLength(pt[f],Length(pt[f])-1); SetLength(sm[f],Length(sm[f])-1); SetLength(cp[f],Length(cp[f])-1);
 s:=s-1; sk[f]:=sk[f]-1;
end;

function rule100_SB(gg:Integer; vv:Boolean):Integer; // правило 100% сб2/2
Var sr,Tx,Ty,T1,T2,T3,T4,X1:Real;
    n: Integer;
begin
 n:=0;
 T1:=1+t[tss[f,s]]-t[tsn[f,s]];
 T2:=1+t[tsk[f2,sk[f2]]]-t[tsn[f2,sk[f2]]];
 T3:=1+t[tss[f,s]]-t[tsl[f,s]];
 T4:=(1+t[tsk[f2,sk[f2]]]-t[tsl[f2,sk[f2]]])*1.111;
 sr:=(sm[f,s]+sm[f2,1]-pt[f,s])/(1+t[tsk[f2,1]]-t[tsn[f,s]]);
 cp[f,s]:=sm[f,s]/(1+t[tsk[f,s]]-t[tsn[f,s]]); cp[f2,1]:=sm[f2,1]/(1+t[tsk[f2,1]]-t[tsn[f2,1]]);
 cp[f2,1]:=sm[f2,1]/(1+t[tsk[f2,1]]-t[tsn[f2,1]]);
 {if T1>T2 then T2:=T2*1.111 else T1:=T1*1.111;}
 if gg=666 then begin
   if (T2>=2*T1) then n:=n+1;
   if (T4>=2*T3) or (T4>=T1) then n:=n+1;
   if (T4>=3*T3) and (((vf[f] in [1,3,8,13,99]) and (max[tss[f,s]]<cp[f,s]+0.111*(max[tsn[f2,1]]-min[tsp[f2,1]]))) or ((vf[f] in [2,4,10,14,98]) and  (min[tss[f,s]]>cp[f,s]-0.111*(max[tsp[f2,1]]-min[tsn[f2,1]])))
      or (t[tss[f,s]]<t[tsl[f,s]]) or (t[tsp[f,s]]=t[tsp[f2,1]])) then n:=n+1;
   if (T4<5) or ((T2<1.33*T1) and ( ((vf[f] in [1,3,8,13]) and (max[tss[f,s]]>=cp[f,s])) or ((vf[f] in [2,4,10,14]) and (min[tss[f,s]]<=cp[f,s])) )) then n:=0;
   if n>1 then Result:=666 else Result:=7;
   Exit;
 end;
 if vv=false then begin
   Tx:=(max[tsn[f,s]]-min[tsp[f,s]])*0.11; Ty:=(max[tsk[f2,1]]-min[tsp[f2,1]])*0.11;
   X1:=min[tsp[f,s]]-(max[tsn[f,s]]-min[tsp[f,s]])*0.05; X1:=round(X1);
   if tsk[f,s]=tss[f,s] then begin
     n:=0;
     if cp[f,s]<=max[tsk[f,s]] then begin
       if (T2>=T1*0.5) or (T4>=T3*0.75) then n:=n+1;
       if (n=0) and (max[tsk[f2,sk[f2]]]<cp[f2,1]) then n:=n-1;
       if (T4>=T3*0.5) then n:=n+1;
       if (max[tsk[f2,1]]>=Sr) then n:=n+1;
       if min[tsp[f2,1]]<X1 then n:=n-1;
       if (T4<0.33*(1+t[tss[f,s]]-t[tsp[f,s]])) and (max[tsk[f2,1]]+1.11*(max[tsn[f2,1]]-min[tsp[f2,1]])<cp[f,s]) then n:=n-1;
       if T2<T1*0.333 then n:=0 else n:=n+1;
     end else begin
       if max[tsk[f2,1]]>=cp[f2,1] then n:=n+1;
       if T2>=T1*0.38 then n:=n+1;
       if T4>=T3*0.47 then n:=n+1;
       if T2<T1*0.18 then n:=0;
     end;
     if n<=1 then begin Result:=0; Exit; end;
   end;
   if (tsk[f,s]=tss[f,s]) and (T2>3) and (min[tsp[f2,1]]<X1) and ((max[tsk[f,s]]>=cp[f,s]) or (t[tsl[f,s]]<>t[tsp[f,s]])) and
   ((cp[f,s]-Tx>sr) or (cp[f2,1]+Tx+Ty<sr) or (max[tsk[f2,1]]<cp[f2,1])) then Result:=2 else Result:=1;
 end else begin
   Tx:=(max[tsp[f,s]]-min[tsn[f,s]])*0.11; Ty:=(max[tsp[f2,1]]-min[tsk[f2,1]])*0.11;
   X1:=max[tsp[f,s]]+(max[tsp[f,s]]-min[tsn[f,s]])*0.05; X1:=round(X1);
   if tsk[f,s]=tss[f,s] then begin
     n:=0;
     if cp[f,s]>=min[tsk[f,s]] then begin
       if (T2>=T1*0.4) or (T4>=T3*0.75) then n:=n+1;
       if (n=0) and (min[tsk[f2,sk[f2]]]>cp[f2,1]) then n:=n-1;
       if (T4>=T3*0.5) then n:=n+1;
       if (min[tsk[f2,1]]<=Sr) then n:=n+1;
       if (max[tsp[f2,1]]>X1) then n:=n-1;
       if (T4<0.33*(1+t[tss[f,s]]-t[tsp[f,s]])) and (min[tsk[f2,1]]-1.11*(max[tsp[f2,1]]-min[tsn[f2,1]])>cp[f,s]) then n:=n-1;
       if (T2<T1*0.333) then n:=0 else n:=n+1
     end else begin
       if min[tsk[f2,1]]<=cp[f2,1] then n:=n+1;
       if T2>=T1*0.38 then n:=n+1;
       if T4>=T3*0.47 then n:=n+1;
       if T2<T1*0.18 then n:=0;
     end;
     if n<=1 then begin Result:=0; Exit; end;
   end;
   if (tsk[f,s]=tss[f,s]) and (T2>3) and (max[tsp[f2,1]]>X1) and ((min[tsk[f,s]]<=cp[f,s]) or (t[tsl[f,s]]<>t[tsp[f,s]])) and
   ((cp[f,s]+Tx<sr) or (cp[f2,1]-Tx-Ty>sr) or (min[tsk[f2,1]]>cp[f2,1])) then Result:=2 else Result:=1;
 end;

 //T1x:=T1*0.33; if frac(T1x)<=0.595 then T1x:=trunc(T1x) else T1x:=round(T1x);
 //T2x:=T2*0.33; if frac(T2x)<=0.595 then T2x:=trunc(T2x) else T2x:=round(T2x);
 //{if frac(T1)<=0.595 then T1:=trunc(T1) else T1:=round(T1);} if frac(T2)<=0.595 then T2:=trunc(T2) else T2:=round(T2);

end;
//----------------------------------

//ПРОГРАММА СОЗДАНИЯ ФИГУР№2!!!!!!!!!!!!!!!!!!!!!!!1
procedure FigureMaker2;
Var fn,Nbc: Integer;
Label VF378, m100sb22, Xrb22,of_vf13,shablon2,bcsb22;
begin
 f:=fk; s:=sk[f]; f2:=0; pm:=0; mxj:=max[tk[j]]; mnj:=min[tk[j]]; Nbc:=0;
 if min[tn[j-1]]<min[tk[j]] then begin
  if f=0 then begin
    FigureCreate; vf[f]:=2; SM1sistem; Exit;
  end else case vf[f] of
   3,8: begin
     FigureCreate; vf[f]:=2; SM1sistem; Exit;
   end;
   1,2,14,98,99: begin
     case vf[f] of
      2: begin tss[f,1]:=tk[j]; BlockSmTslTst(true,false,false); tsk[f,1]:=tk[j]; BlockSmTslTst(false,true,true); end;
      1,14,99: begin
        if (vf[f]=14) and (sk[f]=1) and (f>1) and (vf[f-1]=9) then begin
          tsl[f-1,sk[f-1]]:=tsl[f,s]; tsp[f-1,sk[f-1]]:=tsp[f,s]; tss[f-1,sk[f-1]]:=tss[f,s]; tsk[f-1,sk[f-1]]:=tsk[f,s]; tst[f-1,sk[f-1]]:=tst[f,s];
          FigureDelete1; s:=sk[f]; vf[f]:=10;
        end;
        FigureCreate; vf[f]:=2; SM1sistem;
      end;
      98: begin
        if t[tn[j-1]]=t[tsk[f,s]] then begin FigureCreate; vf[f]:=2; SM1sistem;
        end else begin
          tss[f,s]:=tk[j]; tsk[f,s]:=tk[j]; BlockSmTslTst(true,true,true);
          repeat f:=f-1; s:=sk[f] until vf[f] in [2,4,10];
          if vf[f] in [4,10] then goto VF378
          else if vf[f]=2 then begin tss[f,1]:=tk[j]; BlockSmTslTst(true,false,false); tsk[f,1]:=tk[j]; BlockSmTslTst(false,true,true); end;
        end;
      end;
     end;
     m100sb22:
     f2:=f; f:=f-1; if f=0 then Exit; s:=sk[f];//ищем сб2/2
     while vf[f] in [1,3,8,13,98,99] do begin  //ищем сб2/2
       f:=f-1; if f=0 then Exit; s:=sk[f];
     end;
     if vf[f] in [2,4,10,14] then begin
       if (vf[f]=14) and (sk[f]=1) and (f>1) and (vf[f-1]=9) then begin
          if tsk[f,s]<>tss[f,s] then begin
            if pm=0 then BlockSmTslTst(true,false,false) else begin sm[f,s]:=sm[f,s]+pm-pt[f,s]; pt[f,s]:=pt[f2,sk[f2]]; end;
            tsk[f,s]:=tsk[f2,sk[f2]];
          end;  
          tsl[f-1,sk[f-1]]:=tsl[f,s]; tsp[f-1,sk[f-1]]:=tsp[f,s]; tss[f-1,sk[f-1]]:=tss[f,s]; tsk[f-1,sk[f-1]]:=tsk[f,s]; tst[f-1,sk[f-1]]:=tst[f,s];
          FigureDelete1; s:=sk[f]; vf[f]:=10; pm:=0; Nbc:=1; goto Xrb22;
          bcsb22: Nbc:=0;
       end;
       case rule100_SB(0,true) of
        0: begin pm:=0; if sk[f]=1 then vf[f]:=2 else vf[f]:=10; Exit; end;
        1: begin
          if tsk[f,s]=tss[f,s] then begin
            if (tsl[f,s]<>tsp[f,s]) and (t[tst[f,s]]-t[tsl[f,s]]<=0.5*(t[tsk[f2,1]]-t[tsp[f,s]])) then begin tsl[f,s]:=tsp[f,s]; tst[f,s]:=tsk[f,s]; end;
            sm[f,s]:=sm[f,s]+sm[f2,sk[f2]]-pt[f,s]; pm:=sm[f2,sk[f2]];
          end else if ((pm=0) or (tsk[f,s]=tsk[f2,sk[f2]])) then BlockSmTslTst(true,false,false) else sm[f,s]:=sm[f,s]+pm-pt[f,s];
          pt[f,s]:=pt[f2,sk[f2]];
          if max[tsp[f2,sk[f2]]]>max[tsp[f,s]] then tsp[f,s]:=tsp[f2,sk[f2]];     //схема2
          tsk[f,s]:=tsk[f2,sk[f2]]; BlockSmTslTst(false,true,true);
          if rule100_SB(666,true)=666 then begin
            tss[f,s]:=tss[f2,sk[f2]]; tsk[f,s]:=tsk[f2,sk[f2]]; tst[f,s]:=tsk[f2,sk[f2]]; vf[f2]:=98;   //схема3
            if max[tsp[f2,sk[f2]]]>max[tsp[f,s]] then tsp[f,s]:=tsp[f2,sk[f2]];
            if max[tsl[f2,sk[f2]]]>max[tsl[f,s]] then begin tsl[f,s]:=tsl[f2,sk[f2]]; tst[f,s]:=tst[f2,sk[f2]]; end;
          end;
        end;
        2: begin
          vf[f]:=10; s:=s+1; sk[f]:=sk[f]+1;
          SetLength(tsn[f],sk[f]+1); SetLength(tsl[f],sk[f]+1); SetLength(tsp[f],sk[f]+1); SetLength(tss[f],sk[f]+1); SetLength(tsk[f],sk[f]+1);
          SetLength(tst[f],sk[f]+1); SetLength(pt[f],sk[f]+1); SetLength(sm[f],sk[f]+1); SetLength(cp[f],sk[f]+1);
          tsn[f,s]:=tsk[f,s-1]; tsl[f,s]:=tsl[f2,1]; tsp[f,s]:=tsp[f2,1]; tss[f,s]:=tss[f2,1]; tsk[f,s]:=tsk[f2,1]; tst[f,s]:=tst[f2,1];
          f:=f2; s:=sk[f]; FigureDelete1; f2:=0;
        end;
       end;
       case vf[f] of  //правило 100% Сб2/2 дало меньше
        2: begin li[f]:=0; ly[f]:=0; goto m100sb22; end;
        4,10: begin pm:=0; goto Xrb22; end;
        14: begin if s>=2 then begin vf[f]:=10; pm:=0; goto Xrb22; end else begin vf[f]:=2; li[f]:=0; ly[f]:=0; goto m100sb22; end; end;
       end;
     end;
   end;
   4,9,10: begin//конец (vf[f]=1,2,14,98,99
     VF378:      //из vf=98
     if (f=fk) and (tsk[f,s]=0) then begin vf[f]:=10; tss[f,s]:=tk[j]; tsk[f,s]:=tk[j]; tst[f,s]:=tk[j]; SM1sistem;
     end else begin vf[f]:=10; if (t[tn[j-1]]=t[tsk[f,s]]) and (pm=0) then SM2Sistem else BlockSmTslTst(true,false,false); tss[f,s]:=tk[j]; tsk[f,s]:=tk[j]; BlockSmTslTst(false,true,true); end;
     Xrb22:
     if RB22_VR_and_shlopivanie410=true then begin  //проверка на Х Рб2/2   //переход в др шаблон
       if s>2 then begin
         sm[f,s-1]:=sm[f,s-1]+sm[f,s]-pt[f,s-1]; pt[f,s-1]:=pt[f,s]; pm:=sm[f,s];
         SDelete1; goto Xrb22;
       end else if vf[f-1]=9 then begin
         tsp[f-1,sk[f-1]]:=tsp[f,1]; tss[f-1,sk[f-1]]:=tss[f,1]; tsk[f-1,sk[f-1]]:=tsk[f,1]; tsl[f-1,sk[f-1]]:=tsl[f,1]; tst[f-1,sk[f-1]]:=tst[f,1];
         if tsn[f,s-1]=tsk[f-1,sk[f-1]-1] then sm[f,s-1]:=sm[f,s-1]+sm[f,s]-pt[f,s-1];
         pt[f,s-1]:=pt[f,s]; pm:=sm[f,s];
         SDelete1;
         FigureDelete1; vf[f]:=10; BlockSmTslTst(false,true,true); goto Xrb22;
       end else begin
         sm[f,s-1]:=sm[f,s-1]+sm[f,s]-pt[f,s-1]; pt[f,s-1]:=pt[f,s]; pm:=sm[f,s];
         SDelete1; vf[f]:=2; li[f]:=0; ly[f]:=0;
         if Nbc=1 then goto bcsb22;
         if mnj<=min[tsn[f,s]] then goto shablon2 else goto m100sb22;
       end;
     end else begin vf[f]:=10; if Nbc=1 then goto bcsb22; Exit; end;
   end//конец vf[f]=3,7,8
  else MessageDlg('Ошибка в ФМё2, не выбрана ни 1 фигура'+inttostr(i),mtWarning,[mbOK],0); end;
 end //конец шаблона max[tn[j-1]]>max[tk[j]]
 else if min[tn[j-1]]>=min[tk[j]] then begin
   shablon2:
   repeat
    if f=0 then break;
    s:=sk[f];
    case vf[f] of
     99: f:=f-1;
     7: begin
       if min[tsl[f,s]]>min[tk[j]] then begin tsl[f,s]:=tk[j]; tsp[f,s]:=tk[j]; end;
       f:=f-1;
     end;
     1,3,8,13: begin
       if mnj<=min[tsp[f,s]] then begin
         if f=fk then begin
           fn:=f;
           repeat f:=f-1; s:=sk[f] until (f=0) or (vf[f] in [2,4,10]);
           if (f>0) and (t[tsk[f,sk[f]]]<t[tsk[fn,sk[fn]]]) then SM2sistem;
           f:=fn; s:=sk[f];
         end ;
         if Nakl_SB22_VN=true then begin //проверка на Х сб2/2 вр
           vf[f]:=13;
           if (sk[f]=1) and (mnj<min[tsp[f,s]]) and (li[f]=0) then li[f]:=t[i];
           fn:=f;
           while f<fk do begin f:=f+1;
             if vf[f]=99 then begin FigureDelete1; fn:=f; end;
           end;
           f:=fn-1;
         end else begin
           vf[f]:=7; s:=s+1; sk[f]:=sk[f]+1;
           SetLength(tsn[f],sk[f]+1); SetLength(tsl[f],sk[f]+1); SetLength(tsp[f],sk[f]+1); SetLength(tss[f],sk[f]+1); SetLength(tsk[f],sk[f]+1);
           SetLength(tst[f],sk[f]+1); SetLength(pt[f],sk[f]+1); SetLength(sm[f],sk[f]+1); SetLength(cp[f],sk[f]+1);
           tsn[f,s]:=tsk[f,s-1]; tsl[f,s]:=tk[j]; tsp[f,s]:=tk[j];
           f:=f-1;
         end;
       end else f:=f-1;
     end;
     4,9,10: goto VF378;
     14: begin
       li[f]:=0; ly[f]:=0;
       if (f=fk) and (t[i]>t[tsk[f,s]]) then begin SM2Sistem;
         if max[tsp[f,s]]<max[tn[j]] then tsp[f,s]:=tn[j];
       end else if (f<fk) and (vf[f+1] in [7,13]) then begin
         if max[tsp[f,s]]<max[tsn[f+1,1]] then tsp[f,s]:=tsn[f+1,1];
       end else if max[tsp[f,s]]<max[tn[j]] then tsp[f,s]:=tn[j];
       if s>1 then begin vf[f]:=10; goto VF378; end else goto of_vf13;
     end;
     2,98: begin
       of_vf13: //из vf=13
       if mnj<=min[tsn[f,s]]  then begin
         tss[f,s]:=tk[j]; if (t[tn[j-1]]=t[tsk[f,s]]) and (pm=0) then SM2Sistem else BlockSmTslTst(true,false,false); tsk[f,s]:=tk[j]; BlockSmTslTst(false,true,true);
         if (f-1>0) and (vf[f-1] in [2,4,9,10,14]) then begin
           if max[tsp[f,s]]>max[tsp[f-1,sk[f-1]]] then tsp[f-1,sk[f-1]]:=tsp[f,s];
         end;
         FigureDelete1;
       end else begin
         case vf[f] of
           14: begin
             if (f>1) and (vf[f-1]=9) then begin
               tsl[f-1,sk[f-1]]:=tsl[f,s]; tsp[f-1,sk[f-1]]:=tsp[f,s]; tss[f-1,sk[f-1]]:=tss[f,s]; tsk[f-1,sk[f-1]]:=tsk[f,s]; tst[f-1,sk[f-1]]:=tst[f,s];
               FigureDelete1; vf[f]:=10; s:=sk[f];
               goto VF378;
             end else begin vf[f]:=2; li[f]:=0; ly[f]:=0;
               tss[f,s]:=tk[j]; BlockSmTslTst(true,false,false); tsk[f,s]:=tk[j]; BlockSmTslTst(false,true,true); goto m100sb22;
             end;
           end;
           98: begin
             tss[f,s]:=tk[j]; tsk[f,s]:=tk[j]; BlockSmTslTst(true,true,true);
             repeat f:=f-1 until (f=0) or (vf[f] in [2,4,10]);
             s:=sk[f];
             if vf[f]=2 then begin li[f]:=0; ly[f]:=0; tss[f,s]:=tk[j]; if (t[tn[j-1]]=t[tsk[f,s]]) and (pm=0) then SM2Sistem else BlockSmTslTst(true,false,false); tsk[f,s]:=tk[j]; BlockSmTslTst(false,true,true); goto m100sb22; end;
             if vf[f] in [4,10] then goto VF378;
           end;
           2: begin li[f]:=0; ly[f]:=0; tss[f,s]:=tk[j]; if (t[tn[j-1]]=t[tsk[f,s]]) and (pm=0) then SM2Sistem else BlockSmTslTst(true,false,false); tsk[f,s]:=tk[j]; BlockSmTslTst(false,true,true); goto m100sb22; end;
         end;
       end;
     end;
    end; //конец vf=1 98 и конец поиска фигур
   until f=0;
 end;
end;
//-------------------------------------------------

function Nakl_SB22_VN:Boolean;
Var Tf1:Real;
begin
 Tf1:=max[tsn[f,s]]-min[tsp[f,s]]; bod:=0;
 if Tf1*0.111>=(min[tsp[f,s]]-mnj)*0.97 then begin
   if (sk[f]=1) and (f-1>0) and (vf[f-1]=10) and (mnj<min[tsp[f,s]]) and (ly[f]=0) then begin ly[f]:=33; bod:=1; mnj:=min[tsp[f,s]]; end;
   Result:=true
 end else begin
   if (bud<2) and ((max[tsn[f,s]]-min[tsp[f,s]]>8) or (vf[f] in [1,3,8])) then begin
     if bud=0 then begin mnj:=min[tsp[f,s]]; bud:=1; end else begin mnj:=min[tsp[f,s]]-Tf1*0.05; bud:=2; end;
     if frac(mnj)<0.2 then mnj:=trunc(mnj) else begin mnj:=mnj+0.3; mnj:=round(mnj); end;
     Result:=true;
   end else begin bud:=0; Result:=false; end;
 end;
end;
//--------------------------------------------------

function Nakl_SB22_VR:Boolean;  //проверка на Х сб2/2 вр
Var Tf1:Real;
begin
 Tf1:=max[tsp[f,s]]-min[tsn[f,s]]; bod:=0;
 if Tf1*0.111>=(mxj-max[tsp[f,s]])*0.97 then begin
   if (sk[f]=1) and (f-1>0) and (vf[f-1]=8) and (mxj>max[tsp[f,s]]) and (ly[f]=0) then begin ly[f]:=33; bod:=1; mxj:=max[tsp[f,s]]; end;
   Result:=true
 end else begin
   if (bud<2) and ((max[tsp[f,s]]-min[tsn[f,s]]>8) or (vf[f] in [2,4,10])) then begin
     if bud=0 then begin mxj:=max[tsp[f,s]]; bud:=1; end else begin mxj:=max[tsp[f,s]]+Tf1*0.05; bud:=2; end;
     if frac(mxj)<0.8 then mxj:=trunc(mxj) else mxj:=round(mxj);
     Result:=true;
   end else begin bud:=0; Result:=false; end;
 end;
end;
//--------------------------------------------------

function RB22_VN_and_shlopivanie38:Boolean; //проверка накл рб2/2 на Х для ВН  и схема схлопывания по времени и по силе
Var sr,Tx,Ty,Tz,T1,T2,T3,T4,Y1,Y2,Na,N:Real;
label m1;
begin
 sr:=(sm[f,s]+sm[f,s-1]-pt[f,s-1])/(1+t[tsk[f,s]]-t[tsn[f,s-1]]);
 Tx:=sm[f,s-1]/(1+t[tsk[f,s-1]]-t[tsn[f,s-1]]);
 Ty:=sm[f,s]/(1+t[tsk[f,s]]-t[tsn[f,s]]);
 if mxj>=max[tsn[f,s]] then begin
   m1:
   T4:=sr+(max[tsn[f,s-1]]-min[tsp[f,s]])*0.12;
   if (tsl[f,s-1]<>tsp[f,s-1]) and (1+t[tst[f,s-1]]-t[tsl[f,s-1]]<=0.5*(1+t[tsk[f,s]]-t[tsp[f,s-1]])) then tsl[f,s-1]:=tsp[f,s-1];
   if ( ((Tx>T4) and (T4<max[tss[f,s-1]])) or (1+t[tsk[f,s-1]]-t[tsl[f,s-1]]<=0.5*(1+t[tsk[f,s]]-t[tsl[f,s]])) ) and
      (min[tsp[f,s-1]]-min[tsp[f,s]]>0.11*(max[tsn[f,s-1]]-min[tsp[f,s-1]])) then tsl[f,s-1]:=tsl[f,s];
   if tsl[f,s-1]=tsl[f,s] then tst[f,s-1]:=tst[f,s];
   if tsl[f,s-1]=tsp[f,s-1] then tst[f,s-1]:=tsk[f,s-1];
   if tsl[f,s-1]=tsp[f,s] then tst[f,s-1]:=tsk[f,s];
   if (min[tsp[f,s-1]]-min[tsp[f,s]]<=0.11*(max[tsn[f,s-1]]-min[tsp[f,s-1]])) then tst[f,s-1]:=tsk[f,s];
   tsp[f,s-1]:=tsp[f,s]; tss[f,s-1]:=tss[f,s]; tsk[f,s-1]:=tsk[f,s];
   if (tsl[f,s-1]<>tsp[f,s-1]) and (1+t[tst[f,s-1]]-t[tsl[f,s-1]]<0.5*(1+t[tsk[f,s-1]]-t[tsp[f,s-1]])) then begin tsl[f,s-1]:=tsp[f,s-1]; tst[f,s-1]:=tsk[f,s-1]; end;
   Result:=true;
 end else begin
   T1:=max[tsn[f,s-1]]-min[tsp[f,s-1]]; T2:=max[tsn[f,s]]-min[tsp[f,s]]; T3:=1+t[tsk[f,s-1]]-t[tsn[f,s-1]]; T4:=1+t[tsk[f,s]]-t[tsn[f,s]];
   if t[tsk[f,s]]=t[i] then Na:=mxj else Na:=max[tss[f,s]];
   if ((T1*0.111>=(max[tsk[f,s-1]]-Na)*0.97) or (T2*0.111>=(max[tsk[f,s-1]]-Na)*0.97)) and ( ((Sr>=Tx-(max[tsn[f,s-1]]-min[tsp[f,s]])*0.111) and (Sr<=Ty+(max[tsn[f,s-1]]-min[tsp[f,s]])*0.111) and (T4>=0.33*T3))
      or ((Tx>max[tss[f,s-1]]) and (Ty>=min[tsp[f,s-1]]-T1*0.11) and (T4>=0.33*T3)) or (min[tsp[f,s-1]]-min[tsp[f,s]]<=T1*0.111)
      or (max[tsn[f,s-1]]-max[tsk[f,s-1]]<=T1*0.111) or ((Ty>=min[tsl[f,s-1]]) and (T4>=0.33*T3) and ((tss[f,s-1]=tsk[f,s-1]) or (max[tsk[f,s-1]]>=Tx)))
      or ((1.11*(max[tsn[f,s]]-min[tsp[f,s]])>=2*(max[tsn[f,s-1]]-min[tsp[f,s-1]])) and (1.11*T4>=T3))) then goto m1
   else begin                          //схема схлопывания по времени
     N:=0;
     Tz:=(max[tss[f,s]]-min[tsp[f,s]])*1.11; Tx:=round(Tx);
     T1:=(1+t[tsk[f,s]]-t[tsl[f,s]])*1.05;
     T2:=1+t[tsk[f,s]]-t[tsn[f,s]];
     Y1:=1+t[tsk[f,s-1]]-t[tsl[f,s-1]];
     Y2:=1+t[tsk[f,s-1]]-t[tsn[f,s-1]];
     if frac(T1)<=0.6 then T1:=trunc(T1) else T1:=round(T1);
     if (T1>3) and (T1>=Y2) then N:=N+1;               // время + доп.
     if ((Y1>1) or (T1>4)) and (T1>=2*Y1) then N:=N+1;
     if tsl[f,s]<>tsp[f,s] then N:=N-1;
     if (max[tss[f,s-1]]<Tx) and (N>0) and ((max[tsk[f,s]]>=sr) or ((T1>=2.75*Y1) and (max[tsk[f,s]]>=Ty)) ) then N:=N+1;
     if (f2>0) and (vf[f2]=1) and (1+t[tsk[f2,sk[f2]]]-t[tsn[f2,sk[f2]]]>=(1+t[tsk[f,s-1]]-t[tsn[f,s-1]])*0.75) and ((1+t[tss[f,s]]-t[tsl[f,s]]>=0.55*Y1) or (N>0)) then N:=N+1;
     if (N>0) and ((max[tsn[f,s-1]]-min[tsp[f,s-1]])*1.05>=2*(max[tss[f,s-1]]-min[tsp[f,s-1]])) and (cp[f,s]>=min[tsl[f,s-1]]) then N:=N+1;
     if ((T2>2*Y2) and (N>0)) or ((Y2>10) and (T2*1.05>2*Y2)and (sr<=max[tsk[f,s]])) or ((Y2>10) and (T2*1.05>2.47*Y2))then N:=N+1;
     if (max[tsk[f,s]]<Ty) and (T2<2*Y2) and (Tz<max[tsn[f,s-1]]-min[tsp[f,s-1]]) then N:=N-1;
     if N<2 then begin N:=0;                  // сила + доп.
       if (Tz>=max[tsn[f,s-1]]-min[tsp[f,s-1]]) and ((Y1>1) or (T1>4) or (T2>2*Y2)) and (T1>=Y1*0.9) and (T1>=1+t[tsl[f,s-1]]-t[tsn[f,s-1]]) and (T2>=Y2) then N:=N+1;
       if (Tz>=max[tsn[f,s-1]]-min[tsp[f,s-1]]) and (T2>2.75*Y2) then N:=N+1;
       if (max[tsk[f,s-1]]-max[tss[f,s]]<=0.11*(max[tsn[f,s]]-min[tsp[f,s]]))
          or ((max[tss[f,s]]>=Tx) and (1.11*(max[tsn[f,s]]-min[tsp[f,s]])>=2*(max[tsn[f,s-1]]-min[tsp[f,s-1]]))) then N:=N+1;
       if ((T2>2*Y2) and (N>0)) or ((Y2>10) and (T2*1.05>2*Y2)) or ((T1>3) and (T1>=Y2) and ((max[tsk[f,s]]-min[tsp[f,s]])*1.11>=max[tsn[f,s-1]]-min[tsp[f,s-1]])) then N:=N+1;
       if (f2>0) and (vf[f2]=1) and (1+t[tsk[f2,sk[f2]]]-t[tsn[f2,sk[f2]]]>=(1+t[tsk[f,s-1]]-t[tsn[f,s-1]])*0.75) and (1+t[tss[f,s]]-t[tsl[f,s]]>=0.55*Y1) then N:=N+1;
       if (max[tsk[f,s]]<Ty) and (T2<2*Y2) then N:=N-1;
       if tsl[f,s]<>tsp[f,s] then N:=N-1;
     end;
     if (N<2) and (T2>=2.34*Y2) and ((1+t[tsk[f,s]]-t[tsp[f,s]])*1.05>=Y1) and ((max[tsk[f,s]]-min[tsp[f,s]])*1.05>=max[tsk[f,s-1]]-min[tsp[f,s-1]]) then N:=3;
     if T2<4 then N:=N-2;
     if (T1>=Y2) and (T1>=2*Y1) and (max[tss[f,s]]>=sr) and (1.11*(max[tsn[f,s]]-min[tsp[f,s]])>=2*(max[tsn[f,s-1]]-min[tsp[f,s-1]])) and (Tz>=2*(max[tsn[f,s-1]]-min[tsp[f,s-1]])) then N:=10;
     if N>1 then Result:=true else Result:=false;
     if Result=true then goto m1;
   end;
 end;
end;
//----------------------------------

function RB22_VR_and_shlopivanie410:Boolean; //проверка накл рб2/2 на Х для ВР  и схема схлопывания по времени и по силе
Var sr,Tx,Ty,Tz,T1,T2,T3,T4,Y1,Y2,Na,N:Real;
label m1;
begin
 sr:=(sm[f,s]+sm[f,s-1]-pt[f,s-1])/(1+t[tsk[f,s]]-t[tsn[f,s-1]]);
 Tx:=sm[f,s-1]/(1+t[tsk[f,s-1]]-t[tsn[f,s-1]]);
 Ty:=sm[f,s]/(1+t[tsk[f,s]]-t[tsn[f,s]]);
 if mnj<=min[tsn[f,s]] then begin
   m1:
   T4:=Sr-(max[tsp[f,s]]-min[tsn[f,s-1]])*0.12;
   if (tsl[f,s-1]<>tsp[f,s-1]) and (1+t[tst[f,s-1]]-t[tsl[f,s-1]]<=0.5*(1+t[tsk[f,s]]-t[tsp[f,s-1]])) then tsl[f,s-1]:=tsp[f,s-1];
   if (((Tx<T4) and (T4>min[tss[f,s-1]])) or (1+t[tsk[f,s-1]]-t[tsl[f,s-1]]<=0.5*(1+t[tsk[f,s]]-t[tsl[f,s]])))
      and (max[tsp[f,s]]-max[tsp[f,s-1]]>0.11*(max[tsp[f,s-1]]-min[tsn[f,s-1]])) then tsl[f,s-1]:=tsl[f,s];
   if tsl[f,s-1]=tsl[f,s] then tst[f,s-1]:=tst[f,s];
   if tsl[f,s-1]=tsp[f,s-1] then tst[f,s-1]:=tsk[f,s-1];
   if tsl[f,s-1]=tsp[f,s] then tst[f,s-1]:=tsk[f,s];
   if max[tsp[f,s]]-max[tsp[f,s-1]]<=0.11*(max[tsp[f,s-1]]-min[tsn[f,s-1]]) then tst[f,s-1]:=tsk[f,s];
   tsp[f,s-1]:=tsp[f,s]; tss[f,s-1]:=tss[f,s]; tsk[f,s-1]:=tsk[f,s];
   if (tsl[f,s-1]<>tsp[f,s-1]) and (1+t[tst[f,s-1]]-t[tsl[f,s-1]]<0.5*(1+t[tsk[f,s-1]]-t[tsp[f,s-1]])) then begin tsl[f,s-1]:=tsp[f,s-1]; tst[f,s-1]:=tsk[f,s-1]; end;
   Result:=true;
 end else begin
   T1:=max[tsp[f,s-1]]-min[tsn[f,s-1]]; T2:=max[tsp[f,s]]-min[tsn[f,s]]; T3:=1+t[tsk[f,s-1]]-t[tsn[f,s-1]]; T4:=1+t[tsk[f,s]]-t[tsn[f,s]];
   if t[tsk[f,s]]=t[i] then Na:=mnj else Na:=min[tss[f,s]];
   if ((T1*0.111>=(Na-min[tsk[f,s-1]])*0.97) or (T2*0.111>=(Na-min[tsk[f,s-1]])*0.97)) and ( ((Sr<=Tx+(max[tsp[f,s]]-min[tsn[f,s-1]])*0.111) and (Sr>=Ty-(max[tsp[f,s]]-min[tsn[f,s-1]])*0.111) and (T4>=0.33*T3))
      or ((Tx<min[tss[f,s-1]]) and (Ty<=max[tsp[f,s-1]]+T1*0.11) and (T4>=0.33*T3)) or (max[tsp[f,s]]-max[tsp[f,s-1]]<=T1*0.111)
      or (min[tsk[f,s-1]]-min[tsn[f,s-1]]<=T1*0.111) or ((Ty<=max[tsl[f,s-1]]) and (T4>=0.33*T3) and ((tss[f,s-1]=tsk[f,s-1]) or (min[tsk[f,s-1]]<=Tx)))
      or ((1.11*(max[tsp[f,s]]-min[tsn[f,s]])>=2*(max[tsp[f,s-1]]-min[tsn[f,s-1]])) and (1.11*T4>=T3))) then goto m1
   else begin                          //схема схлопывания по времени
     N:=0;
     Tz:=(max[tsp[f,s]]-min[tss[f,s]])*1.11; Tz:=round(Tz);
     T1:=(1+t[tsk[f,s]]-t[tsl[f,s]])*1.05;
     T2:=1+t[tsk[f,s]]-t[tsn[f,s]];
     Y1:=1+t[tsk[f,s-1]]-t[tsl[f,s-1]];
     Y2:=1+t[tsk[f,s-1]]-t[tsn[f,s-1]];
     if frac(T1)<=0.6 then T1:=trunc(T1) else T1:=round(T1);
     if ((T1>3) or (T2>2*Y2)) and (T1>=Y2) then N:=N+1;               // время + доп.
     if ((Y1>1) or (T1>4)) and (T1>=2*Y1) then N:=N+1;
     if tsl[f,s]<>tsp[f,s] then N:=N-1;
     if (min[tss[f,s-1]]>Tx) and (N>0) and ((min[tsk[f,s]]<=sr) or ((T1>=2.75*Y1) and (min[tsk[f,s]]<=Ty)) ) then N:=N+1;
     if (f2>0) and (vf[f2]=2) and (1+t[tsk[f2,sk[f2]]]-t[tsn[f2,sk[f2]]]>=(1+t[tsk[f,s-1]]-t[tsn[f,s-1]])*0.75) and ((1+t[tss[f,s]]-t[tsl[f,s]]>=0.55*Y1) or (N>0)) then N:=N+1;
     if (N>0) and ((max[tsp[f,s-1]]-min[tsn[f,s-1]])*1.05>=2*(max[tsp[f,s-1]]-min[tss[f,s-1]])) and (cp[f,s]<=max[tsl[f,s-1]]) then N:=N+1;
     if ((T2>2*Y2) and (N>0)) or ((Y2>10) and (T2*1.05>2*Y2) and (sr>=min[tsk[f,s]])) or ((Y2>10) and (T2*1.05>2.47*Y2)) then N:=N+1;
     if (min[tsk[f,s]]>Ty) and (T2<2*Y2) then N:=N-1;
     if N<2 then begin N:=0;                  // сила + доп.
       if (Tz>=max[tsp[f,s-1]]-min[tsn[f,s-1]]) and ((Y1>1) or (T1>4) or (T2>2*Y2)) and (T1>=Y1*0.9) and (T1>=1+t[tsl[f,s-1]]-t[tsn[f,s-1]]) and (T2>=Y2) then N:=N+1;
       if (Tz>=max[tsp[f,s-1]]-min[tsn[f,s-1]]) and (T2>2.75*Y2) then N:=N+1;
       if (min[tss[f,s]]-min[tsk[f,s-1]]<=0.11*(max[tsp[f,s]]-min[tsn[f,s]]))
          or ((min[tss[f,s]]<=Tx) and (1.11*(max[tsp[f,s]]-min[tsn[f,s]])>=2*(max[tsp[f,s-1]]-min[tsn[f,s-1]]))) then N:=N+1;
       if ((T2>2*Y2) and (N>0)) or ((Y2>10) and (T2*1.05>2*Y2)) or ((T1>3) and (T1>=Y2)) then N:=N+1;
       if (f2>0) and (vf[f2]=2) and (1+t[tsk[f2,sk[f2]]]-t[tsn[f2,sk[f2]]]>=(1+t[tsk[f,s-1]]-t[tsn[f,s-1]])*0.75) and (1+t[tss[f,s]]-t[tsl[f,s]]>=0.55*Y1) then N:=N+1;
       if (min[tsk[f,s]]>Ty) and (T2<2*Y2) then N:=N-1;
       if tsl[f,s]<>tsp[f,s] then N:=N-1;
     end;
     if (N<2) and (T2>=2.34*Y2) and ((1+t[tsk[f,s]]-t[tsp[f,s]])*1.05>=Y1) and ((max[tsp[f,s]]-min[tsk[f,s]])*1.05>=max[tsp[f,s-1]]-min[tsk[f,s-1]]) then N:=3;
     if T2<4 then N:=N-2;
     if (T1>=Y2) and (T1>=2*Y1) and (min[tss[f,s]]<=sr) and (1.11*(max[tsp[f,s]]-min[tsn[f,s]])>=2*(max[tsp[f,s-1]]-min[tsn[f,s-1]])) and (Tz>=2*(max[tsp[f,s-1]]-min[tsn[f,s-1]])) then N:=10;
     if N>1 then Result:=true else Result:=false;
     if Result=true then goto m1;
   end;
 end;
end;
//--------------------------


procedure SistemK;
Var n,fn,tpm: Integer;
begin
 f:=fk; pm:=0; tpm:=0;             //SISTEM Cp
 repeat
   s:=sk[f];
   case vf[f] of
    1,2,13,14,98,99: begin cp[f,s]:=sm[f,s]/(1+t[tsk[f,s]]-t[tsn[f,s]]);  pm:=0; end;
    3,4,8,10: begin cp[f,s]:=sm[f,s]/(1+t[tsk[f,s]]-t[tsn[f,s]]); pm:=sm[f,s]; tpm:=t[tsk[f,s]]; end;
    7,9: begin
      if pm>0 then begin
        cp[f,s]:=pm/(1+tpm-t[tsn[f,s]]);
      end;
    end;
   end;
   if vf[f] in [3,4,7,8,9,10] then begin s:=s-1;
     while (s>0) and ((s>1) or ((s=1) and (f-1>0) and (vf[f-1] in [7,9]) and (tss[f-1,sk[f-1]-1]=tsk[f-1,sk[f-1]-1]))) do begin
       pm:=pm+sm[f,s]-pt[f,s]; s:=s-1;
     end;
   end;
   cp[f,s]:=round(cp[f,s]*100)/100; f:=f-1;
 until f=0;
 SetLength(ks,fk+1); for n:=1 to fk do begin SetLength(ks[n],sk[n]+1); end;
 f:=fk;                                                                      //SISTEM ks
 while (f>0) and (vf[f] in [2,4,9,10,14,98,99]) do begin f:=f-1; end;
 if f>0 then begin
   f2:=f; f:=f-1;
   while f>0 do begin
     if vf[f] in [1,3,7,8,13] then begin
       if ( ( (vf[f] in [1,3,8,13]) and (vf[f2] in [1,7,8,13]) and ((t[tsk[f,sk[f]]]=t[tsk[f2,1]])
         or ((1+t[tsk[f2,1]]-t[tsn[f2,1]])/(1+t[tss[f,sk[f]]]-t[tsn[f,sk[f]]])>0.49)) )
       or ( (vf[f]=7) and (vf[f2] in [7,8,13]) and ((t[tsk[f,sk[f]-1]]=t[tsk[f2,1]])
         or ((1+t[tsk[f2,1]]-t[tsn[f2,1]])/(1+t[tss[f,sk[f]-1]]-t[tsn[f,sk[f]-1]])>0.49)) ) ) then begin
         if vf[f]=7 then ks[f,sk[f]-1]:=1 else  ks[f,sk[f]]:=1;
         ks[f2,1]:=2;
         n:=1; fn:=f2;
         while (f2+n<=fk) and ((sk[fn]=1) or ((vf[fn]=7) and (sk[fn]<3))) and ((vf[f2+n] in [2,4,9,10,14,98,99])
         or ((ks[f2+n,1]>1) and ((vf[f2+n]=7) or ((vf[f2+n] in [1,13]) and (sk[f2+n]=1)) or (vf[f2+n] in [3,8,13])))) do begin
           if vf[f2+n] in [1,3,7,8,13] then begin ks[f2+n,1]:=ks[fn,1]+1; fn:=f2+n; end;
           n:=n+1;
         end;
         f2:=f; f:=f-1;
       end else begin ks[f2,1]:=1; f2:=f; f:=f-1; end;
     end else f:=f-1;
   end;
 end;
 f:=fk;
 while (f>0) and (vf[f] in [1,3,7,8,13,98,99]) do begin f:=f-1; end;
 if f>0 then begin
   f2:=f; f:=f-1;
   while f>0 do begin
     if vf[f] in [2,4,9,10,14] then begin
       if ( ( (vf[f] in [2,4,10,14]) and (vf[f2] in [2,9,10,14]) and ((t[tsk[f,sk[f]]]=t[tsk[f2,1]])
         or ((1+t[tsk[f2,1]]-t[tsn[f2,1]])/(1+t[tss[f,sk[f]]]-t[tsn[f,sk[f]]])>0.49)) )
       or ( (vf[f]=9) and (vf[f2] in [9,10,14]) and ((t[tsk[f,sk[f]-1]]=t[tsk[f2,1]])
         or ((1+t[tsk[f2,1]]-t[tsn[f2,1]])/(1+t[tss[f,sk[f]-1]]-t[tsn[f,sk[f]-1]])>0.49)) ) ) then begin
         if vf[f]=9 then ks[f,sk[f]-1]:=1 else ks[f,sk[f]]:=1;
         ks[f2,1]:=2;
         n:=1; fn:=f2;
         while (f2+n<=fk) and ((sk[fn]=1) or ((vf[fn]=9) and (sk[fn]<3))) and ((vf[f2+n] in [1,3,7,8,13,98,99])
         or ((ks[f2+n,1]>1) and ((vf[f2+n]=9) or ((vf[f2+n] in [2,14]) and (sk[f2+n]=1)) or (vf[f2+n] in [4,10,14])))) do begin
           if vf[f2+n] in [2,4,9,10,14] then begin ks[f2+n,1]:=ks[fn,1]+1; fn:=f2+n; end;
           n:=n+1;
         end;
         f2:=f; f:=f-1;
       end else begin ks[f2,1]:=1; f2:=f; f:=f-1; end;
     end else f:=f-1;
   end;
 end;
end;

end.
