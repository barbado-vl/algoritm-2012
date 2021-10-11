unit Unit3;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADLite_TLB, StdCtrls, ExtCtrls, Grids, DBGrids,
  TeeProcs, TeEngine, Chart, DB, DBTables, Series, MXGRAPH,
  ArrowCha, ADODB, ComCtrls, Inifiles;
                                                              
procedure MainSistemOfTS;
procedure OrderDelete;       // �������� ������ ���� ��� �� ���������
procedure SystemLine;
procedure Op113;
procedure Op214;
procedure SistemW0VN;        // ������� W0��
procedure SistemW0VR;        // ������� W0��
procedure SistemRevolution;  // ������� ������ ����� ����������
procedure SistemUTurn;       // ����� ���������
procedure GoToStar;          // ������� �������� �������
procedure SistemFPSP;        // ������ ����������� fp
procedure U1SaveToIniFile;
procedure U1LoadFromIniFile;
procedure U1FindA(tfind:Integer);
procedure U1SortMassiv;
function deletechar(s1:string):string;
procedure BlockChanel;


Var w,f3,f4,f5,fp,fo2,sp,tpt,tfp,f7,rn: Integer;
    tpvn,tpvr,trv,tsv,ctn,ctr,cop,ccl: Real;
    OrderStart,zn,zp,zp2,zs,cho,kop,kcl,noop,nocl,pns: Integer;
    nap,stat:Boolean;
    Kch,Tx,Ro,Ro1, stepN,step1,step2,step3,step6,Ty: Real;
    mnovn,mnovr,Nk,um1v,um1n,um2v,um2n,tout,frv,frn,mp,mfv,mfn,Xxx: Integer; // ����� ���������� �������
    b_p,stus,chpad,ordNo,tcl,top,unp,qty,realP,rest: WideString;
    bs: String;
    a: array of integer;
    aa,suma: Integer; //??????????????????????????

implementation
uses Unit1,Unit2;

procedure MainSistemOfTS;
Var T1,T2,T3,ub,um1,um2,Fsm: Real;
Label mt27,mt29, percon;
begin
SystemLine; SistemK;
Op113; Op214;
if vkl=true then begin
 if (fp>0) and (sp>sk[fp]) then sp:=sk[fp];
 f:=fk; s:=sk[f];
 case w of
  0: begin SistemW0VN; SistemW0VR; end;
  1: begin
    if fp=0 then begin SistemRevolution; GoToStar; Exit; end;
    case vf[fp] of
     7,9: begin
       if (rn=0) and (kop=0) and (fp+1<=fk) and (sk[fp+1]=2) and (ks[fp+1,1]=ks[fp,sk[fp]-1]+1) and (vf[fp+1] in [8,10]) then begin
         if (fp-1=0) or (vf[fp-1] in [1,2,3,4,8,10,13,14,98,99]) or ((sk[fp]<3) and (op[fp]=3)) then begin    ///  ����� ������
           if vf[fp]=8 then SistemW0VN else SistemW0VR;
         end else begin
           f:=fp;
           while (f-1>0) and (vf[f] in [7,9]) and (vf[f-1] in [7,9,13,14]) do begin f:=f-1 end;
           if (vf[f] in [13,14]) or ( (vf[f]=7) and (max[tss[fp,sk[fp]]]>=min[tsp[f,sk[f]-1]]-(0.15*(max[tsn[f,sk[f]-1]]-min[tsp[f,sk[f]-1]]))) )
              or ( (vf[f]=9) and (min[tss[fp,sk[fp]]]<=max[tsp[f,sk[f]-1]]+(0.15*(max[tsp[f,sk[f]-1]]-min[tsn[f,sk[f]-1]]))) ) then begin
             if vf[fp]=8 then SistemW0VN else SistemW0VR;
           end;
         end;
       end;
       rn:=0; SistemUTurn; end;
     13,14: begin
       if sk[fp]>1 then begin rn:=0; SistemUTurn; end else SistemRevolution;
     end;
     1,2,98,99: SistemRevolution;
     3,4,8,10: begin
       if (f5>0) and (vf[f5] in [7,9]) then begin GoToStar; Exit; end;
       if f4=f5 then begin tpvr:=0; f4:=0; end; if f3=f5 then begin tpvn:=0; f3:=0; end;
       tsv:=trv; f5:=0;
       if ((vf[fp] in [4,10]) and (vf[fp+1] in [2,98])) or ((vf[fp] in [3,8]) and (vf[fp+1] in [1,99])) then f:=fp+2 else f:=fp+1;
       s:=sk[f];
       if (f=fp+2) and (vf[f] in [1,2,13,14]) and (sk[f]=1) and ((1+t[tsk[f,sk[f]]]-t[tsn[f,sk[f]]])<=0.111*(1+t[tsk[fp,sk[fp]]]-t[tsn[fp,sk[fp]]])) then op[f]:=2;
       if (f<=fk) and (op[f]>2) and (sk[f]=1) and (((vf[fp] in [3,8]) and (vf[f] in [2,14])) or ((vf[fp] in [4,10]) and (vf[f] in [1,13])))
          and ( ((fp-1=0) or (vf[fp-1] in [1,2,3,4,8,10,13,14,98,99])) or ((f=fp+1) and (fp-1>0) and (vf[fp-1] in [7,9])) )
          and (((vf[fp] in [3,8]) and ((frn=0) or ((fp<=frn) or (cop-max[tsp[f,1]]>=mp)))) or ((vf[fp] in [4,10]) and ((frv=0) or ((fp<=frv) or (min[tsp[f,1]]-cop>=mp))))) then begin
         if vf[fp] in [3,8] then begin T1:=max[tsp[f,s]]+(max[tsp[f,s]]-min[tsn[f,s]])*0.111; T1:=round(T1); um1:=um1v; um2:=um2v;
         end else begin T1:=min[tsp[f,s]]-(max[tsn[f,s]]-min[tsp[f,s]])*0.111; T1:=trunc(T1); um1:=um1n; um2:=um2n;
         end;
         tsv:=T1; f5:=f;
         begin
           if vf[f] in [2,14] then begin T3:=min[tsn[f,s]]; T2:=max[tsp[f,s]]; end else begin T3:=min[tsp[f,s]]; T2:=max[tsn[f,s]]; end;
           if (1+t[tsk[f,s]]-t[tsn[f,s]]>=um1) and (1+t[tsk[f,s]]-t[tsn[f,s]]<=um2) and ( ((vf[f] in [2,14]) and ((T2-T3)*Nk<=mnovr)) or ((vf[f] in [1,13]) and ((T2-T3)*Nk<=mnovn))) then begin
             if vf[f] in [2,14] then begin tpvr:=T1; f4:=f; ctr:=min[tss[f,s]];
             end else begin tpvn:=T1; f3:=f; ctn:=max[tss[f,s]]; end;
           end else begin
             if vf[fp] in [3,8] then begin tpvr:=0; f4:=0; end else begin tpvn:=0; f3:=0; end;
           end;
           GoToStar; Exit;
         end;
       end else begin
         if (kop>0) and ((t[tsk[fp,sk[fp]]]-t[tsn[fp,sk[fp]]]+1>5000) or (t[tsk[fp,sk[fp]-1]]-t[tsn[fp,sk[fp]-1]]+1>5000)) and (t[tsk[fp,sk[fp]]]-t[tsl[fp,sk[fp]]]+1>1000) then begin
           if vf[fp] in [4,10] then begin trv:=max[tsp[fp,sk[fp]]]; tsv:=max[tsp[fp,sk[fp]]]; end else begin trv:=min[tsp[fp,sk[fp]]]; tsv:=min[tsp[fp,sk[fp]]]; end;
         end;
       end;
       if (vf[fp] in [3,4]) or (kop>0) then begin GoToStar; Exit; end;
       if (kop=0) then begin
         if (fp-1>0) and (vf[fp-1] in [7,9]) then begin
           ub:=20; f:=fp-1;
           while (f-1>0) and (((vf[fp] in [3,8]) and (vf[f-1] in [7,13])) or ((vf[fp] in [4,10]) and (vf[f-1] in [9,14]))) do begin
             f:=f-1; if (op[f]=3) and (sk[f]=2) then ub:=30; end;
           if vf[f] in [7,9] then s:=sk[f]-1 else s:=sk[f];
           if vf[f] in [9,14] then Fsm:=(max[tsp[f,s]]-cp[f,s])/(cp[f,s]-min[tsn[f,s]]) else Fsm:=(cp[f,s]-min[tsp[f,s]])/(max[tsn[f,s]]-cp[f,s]);
           if (1+t[tsk[f,s]]-t[tsn[f,s]]>=300) and ( ((op[f]=3) and (sk[f]=2)) or (Fsm<=0.63) or ( (1+t[tsk[f,s]]-t[tsl[f,s]]>=1+t[tsl[f,s]]-t[tsn[f,s]])
               and ( ( (vf[f] in [7,13]) and (max[tsk[f,s]]-min[tsp[f,s]]<=max[tsn[f,s]]-max[tsk[f,s]]) )
               or ( (vf[f] in [9,14]) and (max[tsp[f,s]]-min[tsk[f,s]]<=min[tsk[f,s]]-min[tsn[f,s]]) ) ) ) ) then ub:=40;
           if (((vf[f] in [9,14]) and (cop>max[tsp[f,s]]+0.111*(max[tsp[f,s]]-min[tsn[f,s]])))
              or ((vf[f] in [7,13]) and (cop<min[tsp[f,s]]-0.111*(max[tsn[f,s]]-min[tsp[f,s]])))) then ub:=10;
           if (f5=0) and (rn=0) and (fp-1>0) and (((vf[fp-1] in [13,14]) and (sk[fp-1]=1)) or ((vf[fp-1] in [7,9]) and (sk[fp-1]=2))
              or (ub>20) or ((fp-2>0) and (vf[fp-2] in [7,9,13,14]))) then begin
             if vf[fp] in [4,10] then begin tpvr:=max[tsp[f,s]]+(max[tsp[f,s]]-min[tsn[f,s]])*0.111; tpvr:=round(tpvr); f4:=f;
               if (tpvr>cop) and (tpvr-cop>ub) then tpvr:=cop+ub;
             end else begin tpvn:=min[tsp[f,s]]-(max[tsn[f,s]]-min[tsp[f,s]])*0.111; tpvn:=trunc(tpvn); f3:=f;
               if (tpvn<cop) and (cop-tpvn>ub) then tpvn:=cop-ub;
             end;
             rn:=1;
           end else goto percon;
         end else begin
           percon:
           if (fp-1=0) or (vf[fp-1] in [1,2,3,4,8,10,13,14,98,99]) or ((sk[fp]<3) and (op[fp]=3)) then begin    ///  ����� ������
             if vf[fp]=8 then SistemW0VN else SistemW0VR;
           end else begin
             f:=fp;
             while (f-1>0) and (vf[f] in [7,9]) and (vf[f-1] in [7,9,13,14]) do begin f:=f-1 end;
             if (vf[f] in [13,14]) or ( (vf[f]=7) and (max[tss[fp,sk[fp]]]>=min[tsp[f,sk[f]-1]]-(0.15*(max[tsn[f,sk[f]-1]]-min[tsp[f,sk[f]-1]]))) )
                or ( (vf[f]=9) and (min[tss[fp,sk[fp]]]<=max[tsp[f,sk[f]-1]]+(0.15*(max[tsp[f,sk[f]-1]]-min[tsn[f,sk[f]-1]]))) ) then begin
               if vf[fp]=8 then SistemW0VN else SistemW0VR;
             end;
           end;
         end;
       end;
       GoToStar; Exit;
     end;
    end;
  end;
 end;
 GoToStar;
end else begin
 if (bud>0) or (bod>0) then begin
   if u[j]=true then FigureMaker1 else FigureMaker2;// ������!!!!!!!!!!!
   MainSistemOfTS;
 end;
end;

end;

//--------------------------------------------------
procedure OrderDelete;  // �������� ������ ���� ��� �� ���������
begin
 if (zp>0) and (step1=0) then begin
   b_p:=AD.GetLocalDBData('sum_balance','balance_price','p_code like "'+pcode+'"'); b_p:=deletechar(b_p); //OFFLINE TEST
   stus:=AD.GetLocalDBData('orders','status', 'comments like "'+IntToStr(zp)+'"'); stus:=deletechar(stus); //OFFLINE TEST
   if stus='M' then begin cop:=StrToFloat(b_p);
     qty:=AD.GetLocalDBData('orders', 'qty','comments like "'+IntToStr(zp)+'"'); qty:=deletechar(qty);
     kop:=StrToInt(qty);
   end else begin
     ordNo:=AD.GetLocalDBData('orders', 'ord_no','comments like "'+IntToStr(zp)+'"'); ordNo:=deletechar(ordNo);
     AD.DropOrder(StrToInt(ordNo),'BS',Tread,AccTr,placeC,pcode,tout); Step3:=StepN;
   end;
   zp:=0;
 end;
end;


//---------------------------------------------------
procedure SistemW0VN; // ������� W0��
Label mt1;
begin
 if (f3>0) and (vf[f3] in [8,99]) then begin tpvn:=0; f3:=0 end;
 f:=fk+1;
 mt1:
 repeat f:=f-1; s:=sk[f] until (f<=0) or (f<=fp) or ((vf[f] in[1,13]) and (sk[f]=1));
 if (f>0) and (f>fp) then begin
   if op[f]<=2 then begin if f=f3 then begin f3:=0; tpvn:=0; end; goto mt1; end;
   if (f3>0) and ((f<f3) or (vf[f3] in [3,7,8])) then Exit;
   if 1+t[tsk[f,s]]-t[tsn[f,s]]>=um1n then begin
     if ((1+t[tsk[f,s]]-t[tsn[f,s]])<=um2n) and (((max[tsn[f,s]]-min[tsp[f,s]])*Nk)<=mnovn) then begin
       tpvn:=min[tsp[f,s]]-(max[tsn[f,s]]-min[tsp[f,s]])*0.111; tpvn:=trunc(tpvn);
       ctn:=max[tss[f,s]]; f3:=f;
     end else begin tpvn:=0; f3:=0; end;
   end else goto mt1;
 end;
end;

//-------------------------------------------------------
procedure SistemW0VR; // ������� W0��
Label mt1;
begin
 if (f4>0) and (vf[f4] in [10,98]) then begin tpvr:=0; f4:=0 end;
 f:=fk+1;
 mt1:
 repeat f:=f-1; s:=sk[f] until (f<=0) or (f<=fp) or ((vf[f] in[2,14]) and (sk[f]=1));
 if (f>0) and (f>fp) then begin
   if op[f]<=2 then begin if f=f4 then begin f4:=0; tpvr:=0; end; goto mt1; end;
   if (f4>0) and ((f<f4) or (vf[f4] in [4,9,10])) then Exit;
   if 1+t[tsk[f,s]]-t[tsn[f,s]]>=um1v then begin
     if ((1+t[tsk[f,s]]-t[tsn[f,s]])<=um2v) and (((max[tsp[f,s]]-min[tsn[f,s]])*Nk)<=mnovr) then begin
       tpvr:=max[tsp[f,s]]+(max[tsp[f,s]]-min[tsn[f,s]])*0.111; tpvr:=round(tpvr);
       ctr:=min[tss[f,s]]; f4:=f;
     end else begin tpvr:=0; f4:=0; end;
   end else goto mt1;
 end;
end;
//--------------------------------------------------

procedure SystemLine;
Var T1,T2,y1,ysk: Real;
Label m1,m2,m3;
begin
 f:=fk+1;
 m1:
 repeat f:=f-1; s:=sk[f]; until (f=0) or ((vf[f] in [3,4,7,8,9,10,13,14]) and (sk[f]>1));
 if f<=0 then Exit;
 if vf[f] in [3,7,8,13] then begin T1:=min[tsp[f,sk[f]]]; T2:=(max[tsn[f,sk[f]]]-T1)*0.111;
 end else begin T1:=max[tsp[f,sk[f]]]; T2:=(T1-min[tsn[f,sk[f]]])*0.111; end;
 li[f]:=0;
 m2:
 s:=s-1;
 if s>0 then begin
   if (s=1) or (s=sk[f]-1) then begin
     if t[tsn[f,1]]<>t[tsp[f,s]] then begin
       if vf[f] in [3,7,8,13] then Tx:=max[tsn[f,1]]-((max[tsn[f,1]]-min[tsl[f,s]])*(1+t[tsp[f,sk[f]]]-t[tsn[f,1]])/(1+t[tsl[f,s]]-t[tsn[f,1]]))
       else Tx:=min[tsn[f,1]]+((max[tsl[f,s]]-min[tsn[f,1]])*(1+t[tsp[f,sk[f]]]-t[tsn[f,1]])/(1+t[tsl[f,s]]-t[tsn[f,1]]));
       if (Tx-T2<=T1) and (T1<=Tx+T2) then begin li[f]:=2; goto m2; end;
     end;
     if t[tsp[f,s]]<>t[tsl[f,s]] then begin
       if vf[f] in [3,7,8,13] then Tx:=max[tsn[f,1]]-((max[tsn[f,1]]-min[tsp[f,s]])*(1+t[tsp[f,sk[f]]]-t[tsn[f,1]])/(1+t[tsp[f,s]]-t[tsn[f,1]]))
       else Tx:=min[tsn[f,1]]+((max[tsp[f,s]]-min[tsn[f,1]])*(1+t[tsp[f,sk[f]]]-t[tsn[f,1]])/(1+t[tsp[f,s]]-t[tsn[f,1]]));
       if (Tx-T2<=T1) and (T1<=Tx+T2) then ly[f]:=200;
       goto m2;
     end else goto m2;
   end else goto m2;
 end;
 s:=sk[f];
 if vf[f] in [3,7,8,13] then Tx:=min[tsp[f,s-1]]-((max[tsn[f,1]]-max[tsk[f,s-1]])*(1+t[tsp[f,s]]-t[tsp[f,s-1]])/(1+t[tsk[f,s-1]]-t[tsn[f,1]]))
 else Tx:=max[tsp[f,s-1]]+((min[tsk[f,s-1]]-min[tsn[f,1]])*(1+t[tsp[f,s]]-t[tsp[f,s-1]])/(1+t[tsk[f,s-1]]-t[tsn[f,1]]));
 if (Tx-T2<=T1) and (T1<=Tx+T2) then begin if li[f]=2 then li[f]:=12 else li[f]:=10;
 end else if t[tsp[f,s-1]]<>t[tsl[f,s-1]] then begin
   if vf[f] in [3,7,8,13] then Tx:=min[tsl[f,s-1]]-((max[tsn[f,1]]-max[tsk[f,s-1]])*(1+t[tsp[f,s]]-t[tsl[f,s-1]])/(1+t[tsk[f,s-1]]-t[tsn[f,1]]))
   else Tx:=max[tsl[f,s-1]]+((min[tsk[f,s-1]]-min[tsn[f,1]])*(1+t[tsp[f,s]]-t[tsl[f,s-1]])/(1+t[tsk[f,s-1]]-t[tsn[f,1]]));
   if (Tx-T2<=T1) and (T1<=Tx+T2) then begin if li[f]=2 then li[f]:=12 else li[f]:=10; end;
 end;
 y1:=t[tsn[f,1]]+(t[tsk[f,1]]-t[tsn[f,1]])/2;
 if vf[f] in [7,9] then ysk:=t[tsn[f,s]]+(t[i]-t[tsn[f,s]])/2 else ysk:=t[tsn[f,s]]+(t[tsk[f,s]]-t[tsn[f,s]])/2;
 if vf[f] in [3,7,8,13] then Tx:=min[tsp[f,s-1]]-((cp[f,1]-cp[f,s])*(1+t[tsp[f,s]]-t[tsp[f,s-1]])/(1+ysk-y1))
 else Tx:=max[tsp[f,s-1]]+((cp[f,s]-cp[f,1])*(1+t[tsp[f,s]]-t[tsp[f,s-1]])/(1+ysk-y1));
 if (Tx-T2<=T1) and (T1<=Tx+T2) then begin if li[f]=2 then li[f]:=23; if li[f]=12 then li[f]:=123; if li[f]=10 then li[f]:=103; if li[f]=0 then li[f]:=3;
 end else if t[tsp[f,s-1]]<>t[tsl[f,s-1]] then begin
   if vf[f] in [3,7,8,13] then Tx:=min[tsl[f,s-1]]-((cp[f,1]-cp[f,s])*(1+t[tsl[f,s]]-t[tsp[f,s-1]])/(1+ysk-y1))
   else Tx:=max[tsp[f,s-1]]+((cp[f,s]-cp[f,1])*(1+t[tsp[f,s]]-t[tsp[f,s-1]])/(1+ysk-y1));
   if (Tx-T2<=T1) and (T1<=Tx+T2) then begin
     if li[f]=2 then li[f]:=23;
     if li[f]=12 then li[f]:=123;
     if li[f]=10 then li[f]:=103 else li[f]:=3;
   end;
 end;
 if vf[f] in [3,7,8,13] then Tx:=min[tsp[f,1]]-((cp[f,1]-cp[f,s])*(1+t[tsp[f,s]]-t[tsp[f,1]])/(1+ysk-y1))
 else Tx:=max[tsp[f,1]]+((cp[f,s]-cp[f,1])*(1+t[tsp[f,s]]-t[tsp[f,1]])/(1+ysk-y1));
 if (Tx-T2<=T1) and (T1<=Tx+T2) then li[f]:=li[f]+1000;
 goto m1;
end;
//--------------------------------------------------

procedure Op113;
Var n,Tf2,fvr,fvn,dd: Integer;
    T1,T2,T3,T4,Tkf,Tsm,X1,Fsm: Real;
Label m1, m2, m3, my;
begin
 f:=fk+1;
 while f>0 do begin
   f:=f-1; s:=sk[f]; X1:=0; Fsm:=0; dd:=0;
   if (f>0) and ((vf[f]=1) or ((vf[f]=13) and (sk[f]=1))) then begin
     f7:=0; n:=0; fo2:=f; fvr:=0; fvn:=0; Tf2:=1+t[tsk[fo2,1]]-t[tsn[fo2,1]];
     if (cp[fo2,1]=min[tsp[fo2,1]]) or (cp[fo2,1]=max[tsn[fo2,1]]) then cp[fo2,1]:=cp[fo2,1]+0.001;
     Tsm:=(cp[fo2,1]-min[tsp[fo2,1]])/(max[tsn[fo2,1]]-cp[fo2,1]);
     m1:
     f:=f-1; s:=sk[f];
     if f<=0 then begin
       if (max[tsk[fo2,1]]-min[tsp[fo2,1]]<=0.55*(max[tsn[fo2,1]]-min[tsp[fo2,1]])) and (1+t[tsk[fo2,1]]-t[tsl[fo2,1]]>=0.5*Tf2)
       and (Tf2>15) then n:=n+3;
       m3:
       if n>2 then begin
         if (op[fo2]<>3) and (op[fo2]<>100) then op[fo2]:=3;
       end else begin
         if (op[fo2]<>1) and (op[fo2]<>100) then op[fo2]:=1;
       end;
       f:=fo2;
     end else begin
       case vf[f] of
        1,2,3,7,8,13,14: begin
          if vf[f]=7 then s:=sk[f]-1 else s:=sk[f];
          T1:=min[tsp[fo2,1]]-(max[tsn[fo2,1]]-min[tsp[fo2,1]])*0.111; T1:=trunc(T1);
          Tkf:=1+t[tsk[f,s]]-t[tsl[f,s]]; if (vf[f] in [1,3,7,8,13]) then Fsm:=(cp[f,s]-min[tsp[f,s]])/(max[tsn[f,s]]-cp[f,s]);
          if (fvn=0) and (fvr=0) and (vf[f]=2) then fvr:=fo2-f;
          if (fvn=0) and (fvr=0) and (vf[f]=1) then fvn:=1;
          if ks[fo2,1]>1 then begin
            if ((vf[f] in [1,8,13]) and (Tf2<=0.35*(1+Tkf-Tf2))) or ((ks[fo2,1]=2) and ((Tf2<=0.35*(1+Tkf-Tf2))
               or (Tf2<=0.21*(1+t[tsk[f,s]]-t[tsn[f,s]]))) and (cp[f,s]<=max[tss[f,s]])) then goto m2
            else if (vf[f] in [1,8,13]) and (ks[f,s]<2) then goto m3 else goto m1;
          end else if (f>=fo2-2) or (((f>=fo2-4) or (dd=1)) and ((ks[fo2-1,sk[fo2-1]]>1) or (ks[fo2-2,sk[fo2-2]]>1))) then begin
            if ((f>=fo2-2) and ((Tf2<=0.35*Tkf) or ((Tf2<=0.21*(1+t[tsk[f,s]]-t[tsn[f,s]])) and (vf[f] in [1,7,8,13]) and (cp[f,s]<=max[tsk[f,s]])))) or ((f<fo2-2) and (Tf2<=0.35*Tkf)) then begin
            m2:
            case vf[fo2-1] of
             2,98: X1:=min[tsn[fo2-1,1]];
             7: X1:=min[tsp[fo2-1,sk[fo2-1]-1]];
             1,3,8,13,99: X1:=min[tsp[fo2-1,sk[fo2-1]]];
             4,9,10,14: X1:=0;
            end;
            if ( ((max[tsk[fo2,1]]-min[tsp[fo2,1]]<=0.55*(max[tsn[fo2,1]]-min[tsp[fo2,1]])) and (t[tsk[fo2,1]]-t[tsl[fo2,1]]+1>=1/3*Tf2))
               or ((Tsm<=0.6444) and (t[tsk[fo2,1]]-t[tsl[fo2,1]]+1>=0.47*Tf2)) )
               and ( (Tf2>=um1n) or ((T1<=X1) or ((max[tsn[fo2,1]]-min[tsp[fo2,1]])/(min[tsp[fo2,1]]-X1)>0.9)) ) then n:=n+3;
            if (n=0) and (fvn=0) and (fvr>0) and (max[tsp[fo2-fvr,1]]-min[tsp[fo2,1]]<=0.34*(max[tsp[fo2-fvr,1]]-min[tsn[fo2-fvr,1]]))
               and (t[tsk[fo2-fvr,1]]-t[tsp[fo2-fvr,1]]>=0.47*(t[tsk[fo2-fvr,1]]-t[tsn[fo2-fvr,1]])) and (Tf2>=35) then n:=n+3;
            if (n=0) and (fvn=0) and (fvr>0) and (max[tsp[fo2-fvr,1]]-min[tsp[fo2,1]]<=0.47*(max[tsp[fo2-fvr,1]]-min[tsn[fo2-fvr,1]]))
               and (t[tsk[fo2-fvr,1]]-t[tsp[fo2-fvr,1]]>=0.47*(t[tsk[fo2-fvr,1]]-t[tsn[fo2-fvr,1]])) and (Tf2>=35)
               and (Tsm<=0.9111) and (t[tsk[fo2,1]]-t[tsl[fo2,1]]+1>=0.47*Tf2) then n:=n+3;
            if (n=0) and (vf[f] in [2,14]) and (f-1>0) and (vf[f-1] in [1,8]) then begin f:=f-1; s:=sk[f]; Fsm:=(cp[f,s]-min[tsp[f,s]])/(max[tsn[f,s]]-cp[f,s]); end;
            if (n=0) and (ks[fo2,1]<2) and (Tsm<=1.5) and (vf[f] in [1,3,7,8,13]) and (t[tsk[f,s]]-t[tsl[f,s]]+1>=0.5*(t[tsk[f,s]]-t[tsn[f,s]]+1))
               and ((max[tsk[f,s]]-min[tsp[f,s]]<=0.55*(max[tsn[f,s]]-min[tsp[f,s]])) or (Fsm<=0.62)) and ((T1<=min[tsp[f,s]])
               or ((max[tsn[fo2,1]]-min[tsp[fo2,1]])/(min[tsp[fo2,1]]-min[tsp[f,s]])>1.9)) then n:=n+3;  // ���� ks(f,1)=2, �� ���� � ���� ���� � ��������� �������
            if (n=0) and (Tsm<=0.9999) and ((1+t[tsk[fo2,1]]-t[tsl[fo2,1]]>=0.75*Tf2)) and (vf[f] in [1,3,7,8,13]) and (Fsm<=0.62) then n:=n+3;
            my:
            if (n=0) and (vf[f] in [1,13]) and (ks[f,1]>1) then begin
              f:=f-1;
              while vf[f] in [2,4,9,10,14,98,99] do begin f:=f-1; end;
              if (vf[f] in [1,3,8,13]) then s:=sk[f] else s:=sk[f]-1;
              Fsm:=(cp[f,s]-min[tsp[f,s]])/(max[tsn[f,s]]-cp[f,s]);
              if (ks[fo2,1]<2) and (Tsm<=1.5) and (vf[f] in [1,3,7,8,13]) and (t[tsk[f,s]]-t[tsl[f,s]]+1>=0.5*(t[tsk[f,s]]-t[tsn[f,s]]+1))
               and ((max[tsk[f,s]]-min[tsp[f,s]]<=0.55*(max[tsn[f,s]]-min[tsp[f,s]])) or (Fsm<=0.62)) and ((T1<=min[tsp[f,s]])
               or ((max[tsn[fo2,1]]-min[tsp[fo2,1]])/(min[tsp[fo2,1]]-min[tsp[f,s]])>1.9)) then n:=n+3;
              if (n=0) and (Tsm<=0.9999) and ((1+t[tsk[fo2,1]]-t[tsl[fo2,1]]>=0.75*Tf2)) and (vf[f] in [1,3,7,8,13]) and (Fsm<=0.62) then n:=n+3;
              if (n=0) and (ks[f,s]>1) then goto my;
            end;
            goto m3;
          end else if (sk[f]=1) or ((sk[f]=2) and (vf[f]=7) and (vf[f-1] in [1,2,3,4,8,10,13,14,98,99])) then goto m1 else goto m3;
          end else goto m3;
        end;
        9,98,99: begin if vf[f] in [98,99] then dd:=1; goto m1; end;
        4,10: begin
          if ( (1+t[tsk[fo2,sk[fo2]]]-t[tsn[fo2,sk[fo2]]]<>2) or ((t[i]=t[tsk[fo2,sk[fo2]]]) and ((max[i-1]<=max[i]) or (min[i-1]>=min[i]))) ) then begin
            BlockChanel;
            s:=sk[f]; n:=0;
            if (t[tsk[fo2,1]]<>t[tss[fo2,1]]) and (t[tsp[fo2,1]]<>t[tsl[fo2,1]]) then T1:=min[tsp[fo2,1]] else T1:=min[tsp[fo2,1]]-(max[tsn[fo2,1]]-min[tsp[fo2,1]])*0.05; T1:=round(T1);
            T2:=max[tsp[f,sk[f]-1]]+(max[tsp[f,sk[f]-1]]-min[tsn[f,sk[f]-1]])*0.111; T2:=round(T2);
            T3:=min[tsp[fo2,1]]; T4:=(max[tsn[fo2,1]]-T3)*0.11; T4:=round(T4);
            if ((cp[f,s-1]>=min[tsk[f,s-1]]) or ((s=2) and ((f-1=0) or (vf[f-1]<>9))) or ((T2>=min[tsp[fo2,1]]) and (li[f]>0)) or (ly[f]=1111111))
               and ((ly[f]=1111111) or (ly[f]>=T1)) then n:=n+1 else n:=0;
            if (cp[f,s]>=min[tsp[fo2,1]]) or (T2>=min[tsp[fo2,1]]) or ((f-1>0) and (vf[f-1]=9) and (cp[f,s]<=max[tsp[f-1,sk[f-1]-1]]))
               or (max[tsp[f,s]]-min[tsn[f,s]]>=2*(max[tsp[f,s-1]]-min[tsn[f,s-1]])) or (ly[f]=1111111) then n:=n+1 else n:=0;
            if (n<2) and (li[f]>0) and (ly[f]>=T1) and (f=fp) and (sk[f]>2) and (trv>max[tsl[f,s-2]]) and (f-1>0) and (vf[f-1]=9) then n:=n+2;
            if (T4>=max[tsn[fo2,1]]-max[tsk[fo2,1]]) and (Tsm>1.18) then n:=0;
            if n>1 then begin
              if (f-1=0) or ((vf[f-1] in [1,2,3,4,8,10,13,98,99]) or ((vf[f-1]=14) and (max[tsn[fo2,1]]<=max[tsp[f-1,sk[f-1]]]+0.05*(max[tsp[f-1,sk[f-1]]]-min[tsn[f-1,sk[f-1]]])))) then n:=n+1;
              if (vf[f-1] in [9,14]) and ((f-2=0) or (vf[f-2]<>9)) and ((li[f]>0) or (li[f-1]>0) or ((ks[f,1]>1) and (Tsm<=0.99999))) and ((ks[f,1]>1) or ((Tf2>6) and (Tsm<=0.99999) and
                 (T4<max[tsn[fo2,1]]-max[tss[fo2,1]]) and (((ly[f]=1111111) and (sk[f]=2)) or (tsk[fo2,1]<>tss[fo2,1]) or (tsl[fo2,1]<>tsp[fo2,1])))) then n:=n+1;
              if (f-2>0) and (vf[f-1] in [9,14]) and (vf[f-2]=9) and ((f-3=0) or (vf[f-3]<>9)) and ((li[f-1]>0) or (li[f-2]>0) or (li[f]>0)) and (Tsm<=0.99999) and (T4<max[tsn[fo2,1]]-max[tss[fo2,1]])
                 and (Tf2>4) and (((Tf2>6) and ((tsk[fo2,1]<>tss[fo2,1]) or (tsl[fo2,1]<>tsp[fo2,1]))) or ((ks[f,1]>1) and (f-ks[f,1]>0) and (vf[f-ks[f,1]]<>9))) then n:=n+1;
              if (f-3>0) and (vf[f-1] in [9,14]) and (vf[f-2]=9) and (vf[f-3]=9) and ((li[f-2]>0) or (li[f]>0)) and (Tsm<=0.99999) and (T4<max[tsn[fo2,1]]-max[tss[fo2,1]])
                 and (Tf2>4) and (((Tf2>6) and ((tsk[fo2,1]<>tss[fo2,1]) or (tsl[fo2,1]<>tsp[fo2,1]))) or ((ks[f,1]>1) and (f-ks[f,1]>0) and (vf[f-ks[f,1]]<>9))) then n:=n+1;
            end;
            /// if min[tsp[fo2,1]]-cop<[�������� �������] then n:=0;
            if n>2 then begin
              if (op[fo2]<>3) and (op[fo2]<>100) then op[fo2]:=3;
              if (op[fo2]=3) and (1+t[tsk[fo2,1]]-t[tsn[fo2,1]]<=mfn) then op[fo2]:=2;
            end else begin
              if (op[fo2]<>1) and (op[fo2]<>100) then op[fo2]:=1;
            end;
            f:=fo2;
          end;
        end;
       end;
     end;
   end;
 end;
end;
//------------------------------------------------

procedure Op214;
Var n,Tf2,fvr,fvn,dd: Integer;
    T1,T2,T3,T4,Tkf,Tsm,X1,Fsm: Real;
Label m1, m2, m3, my;
begin
 f:=fk+1;
 while f>0 do begin
   f:=f-1; s:=sk[f]; X1:=0; Fsm:=0; dd:=0;
   if (f>0) and ((vf[f]=2) or ((vf[f]=14) and (sk[f]=1))) then begin
     f7:=0; n:=0; fo2:=f; fvr:=0; fvn:=0; Tf2:=1+t[tsk[fo2,1]]-t[tsn[fo2,1]];
     if (cp[fo2,1]=max[tsp[fo2,1]]) or (cp[fo2,1]=min[tsn[fo2,1]]) then cp[fo2,1]:=cp[fo2,1]+0.001;
     Tsm:=(max[tsp[fo2,1]]-cp[fo2,1])/(cp[fo2,1]-min[tsn[fo2,1]]);
     m1:
     f:=f-1; s:=sk[f];
     if f<=0 then begin
       if (max[tsk[fo2,1]]-min[tsp[fo2,1]]<=0.55*(max[tsn[fo2,1]]-min[tsp[fo2,1]])) and (1+t[tsk[fo2,1]]-t[tsl[fo2,1]]>=0.5*Tf2)
       and (Tf2>15) then n:=n+3;
       m3:
       if n>2 then begin
         if (op[fo2]<>3) and (op[fo2]<>100) then op[fo2]:=3;
       end else begin
         if (op[fo2]<>1) and (op[fo2]<>100) then op[fo2]:=1;
       end;
       f:=fo2;
     end else begin
       case vf[f] of
        1,2,4,9,10,13,14: begin
          if vf[f]=9 then s:=sk[f]-1 else s:=sk[f];
          T1:=max[tsp[fo2,1]]+(max[tsp[fo2,1]]-min[tsn[fo2,1]])*0.111; T1:=round(T1);
          Tkf:=1+t[tsk[f,s]]-t[tsl[f,s]]; if (vf[f] in [2,4,9,10,14]) then Fsm:=(max[tsp[f,s]]-cp[f,s])/(cp[f,s]-min[tsn[f,s]]);
          if (fvn=0) and (fvr=0) and (vf[f]=1) then fvn:=fo2-f;
          if (fvn=0) and (fvr=0) and (vf[f]=2) then fvr:=1;
          if ks[fo2,1]>1 then begin
            if ((vf[f] in [2,10,14]) and (Tf2<=0.35*(1+Tkf-Tf2))) or ((ks[fo2,1]=2) and ((Tf2<=0.35*(1+Tkf-Tf2))
               or (Tf2<=0.21*(1+t[tsk[f,s]]-t[tsn[f,s]]))) and (cp[f,s]>=min[tss[f,s]])) then goto m2
            else if (vf[f] in [2,10,14]) and (ks[f,s]<2) then goto m3 else goto m1;
          end else if (f>=fo2-2) or (((f>=fo2-4) or (dd=1)) and ((ks[fo2-1,sk[fo2-1]]>1) or (ks[fo2-2,sk[fo2-2]]>1)))  then begin
            if ((f>=fo2-2) and ((Tf2<=0.35*Tkf) or ((Tf2<=0.21*(1+t[tsk[f,s]]-t[tsn[f,s]])) and (vf[f] in [2,9,10,14]) and (cp[f,s]>=min[tsk[f,s]])))) or ((f<fo2-2) and (Tf2<=0.35*Tkf)) then begin
            m2:
            case vf[fo2-1] of
             1,99: X1:=max[tsn[fo2-1,1]];
             9: X1:=max[tsp[fo2-1,sk[fo2-1]-1]];
             2,4,10,14,98: X1:=max[tsp[fo2-1,sk[fo2-1]]];
             3,7,8,13: X1:=0;
            end;
            if ( ((max[tsp[fo2,1]]-min[tsk[fo2,1]]<=0.55*(max[tsp[fo2,1]]-min[tsn[fo2,1]])) and (1+t[tsk[fo2,1]]-t[tsl[fo2,1]]>=1/3*Tf2))
               or ((Tsm<=0.64444) and (t[tsk[fo2,1]]-t[tsl[fo2,1]]+1>=0.47*Tf2)) )
               and ( (Tf2>=um1v) or ((T1>=X1) or ((max[tsp[fo2,1]]-min[tsn[fo2,1]])/(X1-max[tsp[fo2,1]])>0.9)) ) then n:=n+3;
            if (n=0) and (fvr=0) and (fvn>0) and (max[tsp[fo2,1]]-min[tsp[fo2-fvn,1]]<=0.34*(max[tsn[fo2-fvn,1]]-min[tsp[fo2-fvn,1]]))
               and (t[tsk[fo2-fvr,1]]-t[tsp[fo2-fvr,1]]>=0.47*(t[tsk[fo2-fvr,1]]-t[tsn[fo2-fvr,1]])) and (Tf2>=35) then n:=n+3;
            if (n=0) and (fvr=0) and (fvn>0) and (max[tsp[fo2,1]]-min[tsp[fo2-fvn,1]]<=0.47*(max[tsn[fo2-fvn,1]]-min[tsp[fo2-fvn,1]]))
               and (t[tsk[fo2-fvr,1]]-t[tsp[fo2-fvr,1]]>=0.47*(t[tsk[fo2-fvr,1]]-t[tsn[fo2-fvr,1]])) and (Tf2>=35)
               and (Tsm<=0.91111) and (t[tsk[fo2,1]]-t[tsl[fo2,1]]+1>=0.47*Tf2) then n:=n+3;
            if (n=0) and (vf[f] in [1,13]) and (f-1>0) and (vf[f-1] in [2,10]) then begin f:=f-1; s:=sk[f]; Fsm:=(max[tsp[f,s]]-cp[f,s])/(cp[f,s]-min[tsn[f,s]]); end;
            if (n=0) and (ks[fo2,1]<2) and (Tsm<=1.5) and (vf[f] in [2,4,9,10,14]) and (t[tsk[f,s]]-t[tsl[f,s]]+1>=0.5*(t[tsk[f,s]]-t[tsn[f,s]]+1))
               and ((max[tsp[f,s]]-min[tsk[f,s]]<=0.55*(max[tsp[f,s]]-min[tsn[f,s]])) or (Fsm<=0.62)) and ((T1>=max[tsp[f,s]])
               or ((max[tsp[fo2,1]]-min[tsn[fo2,1]])/(max[tsp[f,s]]-max[tsp[fo2,1]])>1.9)) then n:=n+3;  // ���� ks(f,1)=2, �� ���� � ���� ���� � ��������� �������
            if (n=0) and (Tsm<=0.9999) and ((1+t[tsk[fo2,1]]-t[tsl[fo2,1]]>=0.75*Tf2)) and (vf[f] in [2,4,9,10,14]) and (Fsm<=0.62) then n:=n+3;
            my:
            if (n=0) and (vf[f] in [2,14]) and (ks[f,1]>1) then begin
              f:=f-1;
              while vf[f] in [1,3,7,8,13,98,99] do begin f:=f-1; end;
              if (vf[f] in [2,4,10,14]) then s:=sk[f] else s:=sk[f]-1;
              Fsm:=(max[tsp[f,s]]-cp[f,s])/(cp[f,s]-min[tsn[f,s]]);
              if (ks[fo2,1]<2) and (Tsm<=1.5) and (vf[f] in [2,4,9,10,14]) and (t[tsk[f,s]]-t[tsl[f,s]]+1>=0.5*(t[tsk[f,s]]-t[tsn[f,s]]+1))
               and ((max[tsp[f,s]]-min[tsk[f,s]]<=0.55*(max[tsp[f,s]]-min[tsn[f,s]])) or (Fsm<=0.62)) and ((T1>=max[tsp[f,s]])
               or ((max[tsp[fo2,1]]-min[tsn[fo2,1]])/(max[tsp[f,s]]-max[tsp[fo2,1]])>1.9)) then n:=n+3;
              if (n=0) and (Tsm<=0.9999) and ((1+t[tsk[fo2,1]]-t[tsl[fo2,1]]>=0.75*Tf2)) and (vf[f] in [2,4,9,10,14]) and (Fsm<=0.62) then n:=n+3;
              if (n=0) and (ks[f,s]>1) then goto my;
            end;
            goto m3;
          end else if (sk[f]=1) or ((sk[f]=2) and (vf[f]=9) and (vf[f-1] in [1,2,3,4,8,10,13,14,98,99])) then goto m1 else goto m3;
          end else goto m3;
        end;
        7,98,99: begin if vf[f] in [98,99] then dd:=1; goto m1; end;
        3,8: begin
          if ( (1+t[tsk[fo2,sk[fo2]]]-t[tsn[fo2,sk[fo2]]]<>2) or ((t[i]=t[tsk[fo2,sk[fo2]]]) and ((max[i-1]<=max[i]) or (min[i-1]>=min[i]))) ) then begin
            BlockChanel;
            s:=sk[f]; n:=0;
            if (t[tsk[fo2,1]]<>t[tss[fo2,1]]) and (t[tsp[fo2,1]]<>t[tsl[fo2,1]]) then T1:=max[tsp[fo2,1]] else T1:=max[tsp[fo2,1]]+(max[tsp[fo2,1]]-min[tsn[fo2,1]])*0.05; T1:=round(T1);
            T2:=min[tsp[f,sk[f]-1]]-(max[tsn[f,sk[f]-1]]-min[tsp[f,sk[f]-1]])*0.111; T2:=trunc(T2);
            T3:=max[tsp[fo2,1]]; T4:=(T3-min[tsn[fo2,1]])*0.11; T4:=round(T4);
            if ((cp[f,s-1]<=max[tsk[f,s-1]]) or ((s=2) and ((f-1=0) or (vf[f-1]<>7))) or ((T2<=max[tsp[fo2,1]]) and (li[f]>0)) or (ly[f]=1111111))
               and ((ly[f]=1111111) or (ly[f]<=T1)) then n:=n+1 else n:=0;
            if (cp[f,s]<=max[tsp[fo2,1]]) or (T2<=max[tsp[fo2,1]]) or ((f-1>0) and (vf[f-1]=7) and (cp[f,s]>=min[tsp[f-1,sk[f-1]-1]]))
               or (max[tsn[f,s]]-min[tsp[f,s]]>=2*(max[tsn[f,s-1]]-min[tsp[f,s-1]])) or (ly[f]=1111111) then n:=n+1 else n:=0;
            if (n<2) and (li[f]>0) and (ly[f]<=T1) and (f=fp) and (sk[f]>2) and (trv<min[tsl[f,s-2]]) and (f-1>0) and (vf[f-1]=7) then n:=n+2;
           // if (T4>=min[tsk[fo2,1]]-min[tsn[fo2,1]]) and (Tsm>1.18) then n:=0;
            if n>1 then begin
              if (f-1=0) or ((vf[f-1] in [1,2,3,4,8,10,14,98,99]) or ((vf[f-1]=13) and (min[tsn[fo2,1]]>=min[tsp[f-1,sk[f-1]]]-0.05*(max[tsn[f-1,sk[f-1]]]-min[tsp[f-1,sk[f-1]]])))) then n:=n+1;
              if (vf[f-1] in [7,13]) and ((f-2=0) or (vf[f-2]<>7)) and ((li[f]>0) or (li[f-1]>0) or ((ks[f,1]>1) and (Tsm<=0.9999))) and ((ks[f,1]>1) or ((Tf2>6) and (Tsm<=0.9999) and
                 (T4<min[tss[fo2,1]]-min[tsn[fo2,1]]) and (((ly[f]=1111111) and (sk[f]=2)) or (tsk[fo2,1]<>tss[fo2,1]) or (tsl[fo2,1]<>tsp[fo2,1])))) then n:=n+1;
              if (f-2>0) and (vf[f-1] in [7,13]) and (vf[f-2]=7) and ((f-3=0) or (vf[f-3]<>7)) and ((li[f-1]>0) or (li[f-2]>0) or (li[f]>0)) and (Tsm<=0.9999) and (T4<min[tss[fo2,1]]-min[tsn[fo2,1]])
                and (Tf2>4) and (((Tf2>6) and ((tsk[fo2,1]<>tss[fo2,1]) or (tsl[fo2,1]<>tsp[fo2,1]))) or ((ks[f,1]>1) and (f-ks[f,1]>0) and (vf[f-ks[f,1]]<>7))) then n:=n+1;
              if (f-3>0) and (vf[f-1] in [7,13]) and (vf[f-2]=7) and (vf[f-3]=7) and ((li[f-2]>0) or (li[f]>0)) and (Tsm<=0.9999) and (T4<min[tss[fo2,1]]-min[tsn[fo2,1]])
                and (Tf2>4) and (((Tf2>6) and ((tsk[fo2,1]<>tss[fo2,1]) or (tsl[fo2,1]<>tsp[fo2,1]))) or ((ks[f,1]>1) and (f-ks[f,1]>0) and (vf[f-ks[f,1]]<>7))) then n:=n+1;
            end;
            /// if cop-max[tsp[fo2,1]]<[�������� �������] then n:=0;
            if n>2 then begin
              if (op[fo2]<>3) and (op[fo2]<>100) then op[fo2]:=3;
              if (op[fo2]=3) and (1+t[tsk[fo2,1]]-t[tsn[fo2,1]]<=mfv) then op[fo2]:=2;
            end else begin
              if (op[fo2]<>1) and (op[fo2]<>100) then op[fo2]:=1;
            end;
            f:=fo2;
          end;
        end;
       end;
     end;
   end;
 end;
end;
//------------------------------------------------





//-----------------------------------------------
procedure SistemRevolution;  //������� ������ ����� ����������
Var T1,T2: Real;
    fn: Integer;
Label m11,m21,esc1,esc2;
begin
 fo2:=0; rn:=0;
 if fp>0 then fo2:=fp else begin
   if tfp>0 then begin
     f:=fk; if (vf[f] in [7,9]) then s:=sk[f]-1 else s:=sk[f];
     while (f>0) and (tfp<t[tsn[f,s]]) do begin f:=f-1; if (vf[f] in [7,9]) then s:=sk[f]-1 else s:=sk[f]; end;
     if (f>0) and (tfp>=t[tsn[f,s]]) then begin
       fo2:=f;
       if (fp=0) and (((nap=true) and (vf[fo2]=9)) or ((nap=false) and (vf[fo2]=7))) and (fo2<>f3) and (fo2<>f4) then begin
         fp:=fo2; sp:=sk[fo2]-1; SistemUTurn;
       end else begin
         if (fp=0) and (fo2+1<=fk) and (((nap=true) and (vf[fo2+1]=9)) or ((nap=false) and (vf[fo2+1]=7))) and (fo2+1<>f3) and (fo2+1<>f4)
            and (1+t[tsk[fo2+1,1]]-t[tsn[fo2,1]]>=150) then begin fp:=fo2+1; sp:=1; SistemUTurn; end;
       end;
     end;
   end;
 end;
 if ((f5=0) or (vf[f5] in [1,2,3,4,13,14,98,99])) and (fo2>0) then begin
   if nap=true then begin
     if (tfp>0) and ( ( (fp-1>0) and (vf[fp-1] in [1,8]) and ((trv-20<=min[tsp[fp-1,sk[fp-1]]]-0.111*(max[tsn[fp-1,sk[fp-1]]]-min[tsp[fp-1,sk[fp-1]]])) or (tfp=t[tsp[fp-1,sk[fp-1]]])) )
     or ( (vf[fo2] in [1,8,13]) and ((trv-20<=min[tsp[fo2,sk[fo2]]]-0.111*(max[tsn[fo2,sk[fo2]]]-min[tsp[fo2,sk[fo2]]])) or (tfp=t[tsp[fo2,sk[fo2]]])) ) ) then begin
       if (fp-1>0) and (vf[fp-1] in [1,8]) then f:=fp-1 else f:=fo2; s:=sk[f];
       tsv:=min[tsp[f,s]]-(max[tsn[f,s]]-min[tsp[f,s]])*0.111; tsv:=trunc(tsv); f5:=f;
     end else begin tsv:=trv; f5:=0; end;
   end else begin
     if (tfp>0) and (((fp-1>0) and (vf[fp-1] in [2,10]) and ((trv+20>=max[tsp[fp-1,sk[fp-1]]]+0.111*(max[tsp[fp-1,sk[fp-1]]]-min[tsn[fp-1,sk[fp-1]]])) or (tfp=t[tsp[fp-1,sk[fp-1]]])))
     or ((vf[fo2] in [2,10,14]) and ((trv+20>=max[tsp[fo2,sk[fo2]]]+0.111*(max[tsp[fo2,sk[fo2]]]-min[tsn[fo2,sk[fo2]]])) or (tfp=t[tsp[fo2,sk[fo2]]])))) then begin
       if (fp-1>0) and (vf[fp-1] in [2,10]) then f:=fp-1 else f:=fo2; s:=sk[f];
       tsv:=max[tsp[f,s]]+(max[tsp[f,s]]-min[tsn[f,s]])*0.111; tsv:=round(tsv); f5:=f;
     end else begin tsv:=trv; f5:=0; end;
   end;
 end;
 f:=fk+1; fn:=0; T2:=0;
 m11:
 repeat f:=f-1; s:=sk[f] until (f=0) or (vf[f]=1) or ((vf[f]=13) and (sk[f]=1));
 if f>0 then begin
   if op[f]<=2 then begin if f=f3 then begin f3:=0; tpvn:=0; end; goto m11; end;
   if (f3=0) or ((f>=f3) and (vf[f3] in [1,2,4,9,10,13,14,98,99])) then begin
     if 1+t[tsk[f,s]]-t[tsn[f,s]]>=um1n then begin
       if (1+t[tsk[f,s]]-t[tsn[f,s]]<=um2n) and ((max[tsn[f,s]]-min[tsp[f,s]])*Nk<=mnovn) then begin
         tpvn:=min[tsp[f,s]]-(max[tsn[f,s]]-min[tsp[f,s]])*0.111; tpvn:=trunc(tpvn);
         ctn:=max[tss[f,s]]; f3:=f;
         if (fo2>0) and (f3>fo2) and (tfp>0) then begin
           repeat f:=f-1; s:=sk[f] until (f=0) or (vf[f] in [1,3,4,8,10,13]);
           if (f>0) and (f>fo2) then begin
             if (sk[f]=1) and (nap=true) then begin fn:=f3; T2:=tpvn; end else begin fn:=0; T2:=0; end;
             f:=f3; f3:=0; tpvn:=0; goto m11;
           end;
         end;
         f:=f3; s:=sk[f]; goto esc1;
       end else begin
         if fn>0 then begin tpvn:=T2; f3:=fn; f:=f3; s:=sk[f]; end;
         esc1:
         if nap=true then begin
           T1:=min[tsp[f,s]]-(max[tsn[f,s]]-min[tsp[f,s]])*0.111; T1:=trunc(T1);
           if (tsv=min[tsp[f,s]]) or (tsv<T1) then begin f5:=f; tsv:=T1; OrderDelete; end;
         end;
       end;
     end else goto m11;
   end else if (fn>0) and (T2>0) then begin tpvn:=T2; f3:=fn; f:=f3; s:=sk[f]; goto esc1; end;
 end else if (fn>0) and (T2>0) then begin tpvn:=T2; f3:=fn; f:=f3; s:=sk[f]; goto esc1; end;
 f:=fk+1; fn:=0; T2:=0;
 m21:
 repeat f:=f-1; s:=sk[f] until (f=0) or (vf[f]=2) or ((vf[f]=14) and (sk[f]=1));
 if f>0 then begin
   if op[f]<=2 then begin if f=f4 then begin f4:=0; tpvr:=0; end; goto m21; end;
   if (f4=0) or ((f>=f4) and (vf[f4] in [1,2,3,7,8,13,14,98,99])) then begin
     if 1+t[tsk[f,s]]-t[tsn[f,s]]>=um1v then begin
       if (1+t[tsk[f,s]]-t[tsn[f,s]]<=um2v) and ((max[tsp[f,s]]-min[tsn[f,s]])*Nk<=mnovr) then begin
         tpvr:=max[tsp[f,s]]+(max[tsp[f,s]]-min[tsn[f,s]])*0.111; tpvr:=round(tpvr);
         ctr:=min[tss[f,s]]; f4:=f;
         if (fo2>0) and (f4>fo2) and (tfp>0) then begin
           repeat f:=f-1; s:=sk[f] until (f=0) or (vf[f] in [2,3,4,8,10,14]);
           if (f>0) and (f>fo2) then begin
             if (sk[f]=1) and (nap=false) then begin fn:=f4; T2:=tpvr; end else begin fn:=0; T2:=0; end;
             f:=f4; f4:=0; tpvr:=0; goto m21;
           end;
         end;
         f:=f4; s:=sk[f]; goto esc2;
       end else begin
         if fn>0 then begin tpvr:=T2; f4:=fn; f:=f4; s:=sk[f]; end;
         esc2:
         if nap=false then begin
           T1:=max[tsp[f,s]]+(max[tsp[f,s]]-min[tsn[f,s]])*0.111; T1:=round(T1);
           if (tsv=max[tsp[f,s]]) or (tsv>T1) then begin f5:=f; tsv:=T1; OrderDelete; end;
         end;
       end;
     end else goto m21;
   end else if (fn>0) and (T2>0) then begin tpvr:=T2; f4:=fn; f:=f4; s:=sk[f]; goto esc2; end;
 end else if (fn>0) and (T2>0) then begin tpvr:=T2; f4:=fn; f:=f4; s:=sk[f]; goto esc2; end;
 if (nap=false) and (fp>0) and (vf[fp]=1) and (f3=0) then ctn:=max[tsk[fp,sp]]
   else if (nap=true) and (fp>0) and (vf[fp]=2) and (f4=0) then ctr:=min[tsk[fp,sp]];
 end;


//----------------------------------------------------
procedure SistemUTurn;  // ����� ���������
var T1,T2,T3,um1,um2:Real;
Label m1,m2,m3;
begin
 if vf[fp] in [7,13] then begin um1:=um1v; um2:=um2v;
     end else begin um1:=um1n; um2:=um2n; end;
 if ((f5=0) or (vf[f5] in [1,2,3,4,8,10,13,14,98,99])) and (kop>0) then begin  //����� �������� �� fp-1
   f:=fp; f5:=0; tsv:=trv; tpvr:=0; f4:=0; tpvn:=0; f3:=0;
   if nap=true then begin
     m1:
     f:=f-1;
     if (f>0) and (sk[f]>1) then begin
       s:=sk[f]-1;
       if ((sk[f]<3) or ((f-1>0) and (vf[f-1]=9))) and (vf[f]=9) and (max[tsp[f,s]]+(max[tsp[f,s]]-min[tsn[f,s]])*0.1>=cop) and ((max[tsp[f,s]]-min[tsn[f,s]])*Nk<=mnovr) and (1+t[tsk[f,s]]-t[tsn[f,s]]<=um2) then begin
         if (op[f]>2) and (sk[f]<3) then begin tsv:=min[tsn[f,s]]; trv:=min[tsn[f,s]]; tfp:=t[tsn[f,1]];
         end else goto m1;
       end;
     end;
   end else begin
     m2:
     f:=f-1;
     if (f>0) and (sk[f]>1) then begin
       s:=sk[f]-1;
       if ((sk[f]<3) or ((f-1>0) and (vf[f-1]=7))) and (vf[f]=7) and (min[tsp[f,s]]-(max[tsn[f,s]]-min[tsp[f,s]])*0.1<=cop) and ((max[tsn[f,s]]-min[tsp[f,s]])*Nk<=mnovn) and (1+t[tsk[f,s]]-t[ tsn[f,s]]<=um2) then begin
         if (op[f]>2) and (sk[f]<3) then begin tsv:=max[tsn[f,s]]; trv:=max[tsn[f,s]]; tfp:=t[tsn[f,1]];
         end else goto m2;
       end;
     end;
   end;
 end;        ////////////
 if fp>=fk then Exit;
 f:=fp+1;
 while (f<fk) and (vf[f]in [7,9]) do begin f:=f+1; end;
 if (f=fk) or (vf[f] in [1,2,13,14,98,99]) then begin
   m3:
   if (f5>0) and (vf[f5] in [7,9]) then Exit;
   tsv:=trv; f5:=0; tpvr:=0; f4:=0; tpvn:=0; f3:=0;
 end else if vf[f] in [3,4,8,10] then begin
   if ((vf[fp] in [7,9]) or ((vf[fp] in [13,14]) and (ks[f,1]<4) and ((f-ks[f,1]=0) or (vf[f-ks[f,1]] in [1,2,3,4,8,10,98,99])))) and (f+1<=fk)
      and (op[f+1]>2) and (sk[f+1]=1) and (((vf[f] in [4,10]) and (vf[f+1] in [1,13])) or ((vf[f] in [3,8]) and (vf[f+1] in [2,14])))
      and (((vf[fp] in [7,13]) and ((frn=0) or ((f<=frn) or (cop-max[tsp[f+1,1]]>=mp)))) or ((vf[fp] in [9,14]) and ((frv=0) or ((f<=frv) or (min[tsp[f+1,1]]-cop>=mp))))) then begin
     if vf[f] in [3,8] then begin
       T1:=max[tsp[f+1,sk[f+1]]]+(max[tsp[f+1,sk[f+1]]]-min[tsn[f+1,sk[f+1]]])*0.111; T1:=round(T1);
     end else begin
       T1:=min[tsp[f+1,sk[f+1]]]-(max[tsn[f+1,sk[f+1]]]-min[tsp[f+1,sk[f+1]]])*0.111; T1:=trunc(T1);
     end;
     f:=f+1; s:=sk[f]; tsv:=T1; f5:=f;
     if vf[f] in [2,14] then begin T3:=min[tss[f,s]]; T2:=max[tsp[f,s]]; end else begin T3:=min[tsp[f,s]]; T2:=max[tss[f,s]]; end;
     if (1+t[tsk[f,s]]-t[tsn[f,s]]>=um1) and ((1+t[tsk[f,s]]-t[tsn[f,s]])<=um2) and (((vf[f] in [2,14]) and ((T2-T3)*Nk<=mnovr)) or ((vf[f] in [1,13]) and ((T2-T3)*Nk<=mnovn))) then begin
       if vf[f] in [2,14] then begin tpvr:=T1; f4:=f; ctr:=min[tss[f,s]];
       end else begin tpvn:=T1; f3:=f; ctn:=max[tss[f,s]]; end;
     end else begin
       if vf[f] in [3,8] then begin tpvr:=0; f4:=0; end else begin tpvn:=0; f3:=0; end;
     end;
   end else goto m3;
 end else MessageDlg('bebebebe'+inttostr(i),mtWarning,[mbOK],0);
end;


//----------------------------------------------------
procedure GoToStar; //������� �������� �������
Var T1: Integer;
Label zpZS;
begin
 if (w=1) and (nap=false) and (f4>0) and (fp>0) and (f4<fp) and (vf[f4]=10) then f4:=0;
 if (w=1) and (nap=true) and (f3>0) and (fp>0) and (f3<fp) and (vf[f3]=8) then f3:=0;
 if (bud>0) or (bod>0) then begin
   if u[j]=true then FigureMaker1 else FigureMaker2;// ������!!!!!!!!!!!
   MainSistemOfTS;
 end else begin
 if  pkl=true then begin       //pkl=false and (stat=true)
   {zn:=zn+1; zs:=zn; step2:=2*stepN; stat:=false;
   if nap=true then OrderStart:=AD.CreateLimitOrder(AccTr,placeC,pcode,Date+1,IntToStr(zs),'RUR','S',kop,tsv-Kch,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,tout)
   else OrderStart:=AD.CreateLimitOrder(AccTr,placeC,pcode,Date+1,IntToStr(zs),'RUR','B',kop,tsv+Kch,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,tout);
   kop:=0; }
   Exit;
 end else begin
   if step1>0 then begin
     ordNo:=AD.GetLocalDBData('orders', 'ord_no','comments like "'+IntToStr(zp)+'"');
     if not (ordNo='') or (ordNo='0') then begin
       step1:=0; Form1.Label24.Caption:='';
       top:=AD.GetLocalDBData('orders', 'ts_time','comments like "'+IntToStr(zp)+'"'); top:=deletechar(top);
       ordNo:=deletechar(ordNo); noop:=StrToInt(OrdNo);
       if nap=true then bs:='b' else bs:='s';
     end else begin
       if step1=1 then Exit
       else if step1=2 then begin BB:=1; Form1.Label24.Caption:='�������, �� �� �� ������� ��������� �� ����� step1, '+TimeToStr(ADt);
         step1:=step1-1; Exit;
       end else begin step1:=step1-1; Exit; end;
     end;
   end; if step3>0 then begin
     stus:=AD.GetLocalDBData('orders','status', 'comments like "'+IntToStr(zp2)+'"'); if stus<>'' then stus:=deletechar(stus); //OFFLINE TEST
     if (stus='W') or (stus='M') then begin
       zp2:=0; step3:=0; Form1.Label24.Caption:='';
     end else begin
       if step3=1 then Exit
       else if step3=2 then begin Form1.Label24.Caption:='�������, �� �� �� ������� ��������� �� ����� step3, '+TimeToStr(ADt); step3:=0; Exit;
       end else begin step3:=step3-1; Exit; end;
     end;
   end;
 end;
 if w=0 then begin
   if ((tpvn>0) and (vf[f3]=7)) or ((tpvr>0) and (vf[f4]=9)) then begin
     zn:=zn+1; zp:=zn; zp2:=zn; step1:=stepN;
     if vf[f3]=7 then begin
       nap:=false;
       OrderStart:=AD.CreateLimitOrder(AccTr,placeC,pcode,Date+1,IntToStr(zp),'RUR','S',Nk,tpvn-Kch,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,tout);
     end else if vf[f4]=9 then begin
       nap:=true;
       OrderStart:=AD.CreateLimitOrder(AccTr,placeC,pcode,Date+1,IntToStr(zp),'RUR','B',Nk,tpvr+Kch,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,tout);
     end;
     SistemFPSP;  MainSistemOfTS;
   end else if zs>0 then begin
     zpZS:
     ordNo:=AD.GetLocalDBData('orders', 'ord_no','comments like "'+IntToStr(zs)+'"');
     if not (ordNo='') or (ordNo='0') then begin
       ordNo:=deletechar(ordNo);
       stus:=AD.GetLocalDBData('orders','status', 'comments like "'+IntToStr(zs)+'"'); stus:=deletechar(stus); //OFFLINE TEST
       if stus='M' then begin
          tcl:=AD.GetLocalDBData('orders', 'ts_time','comments like "'+IntToStr(zs)+'"'); tcl:=deletechar(tcl);
          unp:=AD.GetLocalDBData('orders', 'updt_new_price','comments like "'+IntToStr(zs)+'"'); unp:=deletechar(unp);
          qty:=AD.GetLocalDBData('orders', 'qty','comments like "'+IntToStr(zs)+'"'); qty:=deletechar(qty);
          nocl:=StrToInt(OrdNo); ccl:=StrToFloat(unp); kcl:=StrToInt(qty);
          zs:=0;  step2:=0; step6:=0; Form1.Label24.Caption:='';
        // �������� ������ � ��
       end else if step2<=50 then begin
           if step6=0 then begin AD.DropOrder(StrToInt(ordNo),'BS',Tread,AccTr,placeC,pcode,tout); step6:=stepN;
           end else if stus='W' then begin
             if step6=1 then begin
               rest:=AD.GetLocalDBData('orders', 'rest','comments like "'+IntToStr(zs)+'"'); rest:=deletechar(rest);
               //realP:=FloatToStr(tsv+2*Kch);  //OFFLINE TEST
               realP:=AD.GetLocalDBData('fin_info','last_price','paper_no like "'+paperNo+'"'); realP:=deletechar(realP); //OFFLINE TEST
               zn:=zn+1; zs:=zn; step2:=stepN*2; step6:=0;
               Form1.Label24.Caption:='';
               if zp=0 then begin
                 if nap=true then OrderStart:=AD.CreateLimitOrder(AccTr,placeC,pcode,Date+1,IntToStr(zs),'RUR','S',StrToInt(rest),StrToFloat(realP),Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,tout)
                 else OrderStart:=AD.CreateLimitOrder(AccTr,placeC,pcode,Date+1,IntToStr(zs),'RUR','B',StrToInt(rest),StrToFloat(realP),Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,tout);
               end else begin
                 if nap=true then OrderStart:=AD.CreateLimitOrder(AccTr,placeC,pcode,Date+1,IntToStr(zs),'RUR','B',StrToInt(rest),StrToFloat(realP),Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,tout)
                 else OrderStart:=AD.CreateLimitOrder(AccTr,placeC,pcode,Date+1,IntToStr(zs),'RUR','S',StrToInt(rest),StrToFloat(realP),Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,tout);
               end;
             end else step6:=step6-1;
           end else begin
             if step6=1 then Exit
             else if step6=2 then begin BB:=1; Form1.Label24.Caption:='�������, �� �� �� ������� ��������� �� ����� step6, '+TimeToStr(ADt);
               step6:=step6-1; Exit;
             end else step6:=step6-1;
           end;
       end else step2:=step2-1;
     end else begin
       if step2=59 then Exit
       else if step2=2 then begin BB:=1; Form1.Label24.Caption:='�������, �� �� �� ������� ��������� �� ����� step2, '+TimeToStr(ADt);
         step2:=step2-1; Exit;
       end else step2:=step2-1;
     end;
   end;
 end else begin  //���� w>0
   if zS>0 then goto zpZS;
   if zp>0 then begin
     stus:=AD.GetLocalDBData('orders','status', 'comments like "'+IntToStr(zp)+'"'); stus:=deletechar(stus); //OFFLINE TEST
     qty:=AD.GetLocalDBData('orders', 'qty','comments like "'+IntToStr(zp)+'"'); qty:=deletechar(qty); 
     rest:=AD.GetLocalDBData('orders', 'rest','comments like "'+IntToStr(zp)+'"'); rest:=deletechar(rest);
     T1:=StrToInt(qty);
     if T1=Nk then kop:=0 else kop:=Nk-T1;
     if stus='M' then begin
       zp:=0; kop:=StrToInt(qty)+kop; rn:=0;
       if nap=true then tpvr:=0 else tpvn:=0;
        b_p:=AD.GetLocalDBData('sum_balance','balance_price','p_code like "'+pcode+'"'); b_p:=deletechar(b_p);   //OFFLINE TEST
       //cop:=StrToFloat(b_p);
     end else if stus='O' then kop:=StrToInt(qty)-StrToInt(rest)+kop;
   end;
   chpad:=AD.GetLocalDBData('sum_balance','forword_rest','p_code like "'+pcode+'"'); chpad:=deletechar(chpad);  //OFFLINE TEST
   cho:=abs(StrToInt(chpad));
   if nap=true then begin
     if (tpvn>0) and (vf[f3] in [7,8]) and (pkl=false) then begin
       if zp>0 then begin
         ordNo:=AD.GetLocalDBData('orders', 'ord_no','comments like "'+IntToStr(zp)+'"'); ordNo:=deletechar(ordNo);
         AD.DropOrder(StrToInt(ordNo),'BS',Tread,AccTr,placeC,pcode,tout);
         step3:=stepN; zp:=0;
       end;
       if kop>0 then begin   zn:=zn+1; zs:=zn; step2:=stepN*2;
         OrderStart:=AD.CreateLimitOrder(AccTr,placeC,pcode,Date+1,IntToStr(zs),'RUR','S',kop,tpvn-Kch,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,tout);
         kop:=0;
       end;
       zn:=zn+1; zp:=zn; zp2:=zn; nap:=false; step1:=stepN;
       OrderStart:=AD.CreateLimitOrder(AccTr,placeC,pcode,Date+1,IntToStr(zp),'RUR','S',Nk,tpvn-Kch,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,tout);
     end else if (tsv>min[i]) or ((f5>0) and (vf[f5]=7)) then begin
       if zp>0 then begin
         ordNo:=AD.GetLocalDBData('orders', 'ord_no','comments like "'+IntToStr(zp)+'"'); ordNo:=deletechar(ordNo);
         AD.DropOrder(StrToInt(ordNo),'BS',Tread,AccTr,placeC,pcode,tout);
         zp:=0; step3:=stepN;
       end;
       if kop>0 then begin
         //if pkl=false then begin
           zn:=zn+1; zs:=zn; step2:=stepN*2;
           OrderStart:=AD.CreateLimitOrder(AccTr,placeC,pcode,Date+1,IntToStr(zs),'RUR','S',kop,tsv-Kch,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,tout);
           kop:=0;
         //end else begin stat:=true; vkl:=false; end;
       end;
     end else if (tpvr>0) and ((vf[f4] in [9,10]) or (rn=1)) then begin
       if (kop<>Nk) and (pkl=false) then begin
         if zp>0 then begin
           ordNo:=AD.GetLocalDBData('orders', 'ord_no','comments like "'+IntToStr(zp)+'"'); ordNo:=deletechar(ordNo);
           AD.DropOrder(StrToInt(ordNo),'BS',Tread,AccTr,placeC,pcode,tout);
           zp:=0; step3:=stepN;
         end;
         zn:=zn+1; zp:=zn; zp2:=zn; step1:=stepN; pns:=1;
         OrderStart:=AD.CreateLimitOrder(AccTr,placeC,pcode,Date+1,IntToStr(zp),'RUR','B',Nk-kop,tpvr+Kch,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,tout);
       end else begin pns:=1;
         if rn=1 then rn:=2 else rn:=0;
         SistemFPSP;  MainSistemOfTS; Exit;
       end;
     end else Exit;
     //if step3=0 then ������ ������ � ��
     if step1=0 then begin w:=0; trv:=0; tpt:=0; fp:=0; sp:=0; f5:=0; tfp:=0;
     end else begin SistemFPSP;  MainSistemOfTS; end;
   end else begin
     if (tpvr>0) and (vf[f4] in [9,10]) and (pkl=false) then begin
       if zp>0 then begin
         ordNo:=AD.GetLocalDBData('orders', 'ord_no','comments like "'+IntToStr(zp)+'"'); ordNo:=deletechar(ordNo);
         AD.DropOrder(StrToInt(ordNo),'BS',Tread,AccTr,placeC,pcode,tout);
         zp:=0; step3:=stepN;
       end;
       if kop>0 then begin   zn:=zn+1; zs:=zn; step2:=stepN*2;
         OrderStart:=AD.CreateLimitOrder(AccTr,placeC,pcode,Date+1,IntToStr(zs),'RUR','B',kop,tpvr+Kch,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,tout);
         kop:=0;
       end;
       zn:=zn+1; zp:=zn; zp2:=zn; nap:=true; step1:=stepN;
       OrderStart:=AD.CreateLimitOrder(AccTr,placeC,pcode,Date+1,IntToStr(zp),'RUR','B',Nk,tpvr+Kch,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,tout);
     end else if (tsv<max[i]) or ((f5>0) and (vf[f5]=9)) then begin
       if zp>0 then begin
         ordNo:=AD.GetLocalDBData('orders', 'ord_no','comments like "'+IntToStr(zp)+'"'); ordNo:=deletechar(ordNo);
         AD.DropOrder(StrToInt(ordNo),'BS',Tread,AccTr,placeC,pcode,tout);
         zp:=0; step3:=stepN;
       end;
       if kop>0 then begin
         //if pkl=false then begin
           zn:=zn+1; zs:=zn; step2:=stepN*2;
           OrderStart:=AD.CreateLimitOrder(AccTr,placeC,pcode,Date+1,IntToStr(zs),'RUR','B',kop,tsv+Kch,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,tout);
           kop:=0;
         //end else begin stat:=true; vkl:=false; end;
       end;
     end else if (tpvn>0) and ((vf[f3] in [7,8]) or (rn=1)) then begin
       if (kop<>Nk) and (pkl=false) then begin
         if zp>0 then begin
           ordNo:=AD.GetLocalDBData('orders', 'ord_no','comments like "'+IntToStr(zp)+'"'); ordNo:=deletechar(ordNo);
           AD.DropOrder(StrToInt(ordNo),'BS',Tread,AccTr,placeC,pcode,tout);
           zp:=0; step3:=stepN;
         end;
         zn:=zn+1; zp:=zn; zp2:=zn; step1:=stepN; pns:=1;
         OrderStart:=AD.CreateLimitOrder(AccTr,placeC,pcode,Date+1,IntToStr(zp),'RUR','S',Nk-kop,tpvn-Kch,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,tout);
       end else begin pns:=1;
         if rn=1 then rn:=2 else rn:=0;
         SistemFPSP;  MainSistemOfTS; Exit;
       end;
     end else Exit;
     //if step3=0 then ������ ������ � ��
     if step1=0 then begin w:=0; trv:=0; tpt:=0; fp:=0; sp:=0; f5:=0; tfp:=0;
     end else begin SistemFPSP;  MainSistemOfTS; end;
   end;
 end;
end;
end;

//-----------------------------------------------
procedure SistemFPSP;
begin
 if nap=true then begin
   fp:=f4; sp:=sk[fp]-1;
   if rn=0 then begin tsv:=min[tsn[fp,sp]]; trv:=min[tsn[fp,sp]]; cop:=max[tsp[fp,sp]]; end;
 end else begin
   fp:=f3; sp:=sk[fp]-1;
   if rn=0 then begin tsv:=max[tsn[fp,sp]]; trv:=max[tsn[fp,sp]]; cop:=min[tsp[fp,sp]]; end;
 end;
 tfp:=t[tsn[fp,sp]];
 w:=1; tpvn:=0; tpvr:=0; f3:=0; f4:=0; f5:=0; tpt:=0;
end;



//-------------------------------------------------
function deletechar(s1:string):string;
var i:integer;
    ss:string;
begin
 if s1<>'' then begin
   ss:=''; i:=1;
   while s1[i]<>'|' do begin ss:=ss+s1[i]; i:=i+1; end;
   Result:=ss;
 end else Result:='0';
end;

////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
//------��������� � ����-------/////////////////////////////////////////////////////////////////
procedure U1SaveToIniFile;
Var   ofk,ii,nn: Integer;
begin
 if fk>0 then begin
   iniTS:=TIniFile.Create(extractfilepath(Application.ExeName)+'IniTs.ini');
   ofk:=inits.ReadInteger('AAA','fk',0); for ii:=1 to ofk do iniTs.EraseSection('f'+IntToStr(ii));
   iniTs.EraseSection('AAA');  iniTs.EraseSection('WWW');
   iniTs.WriteInteger('AAA','fk',fk); iniTs.WriteInteger('AAA','j',j); iniTs.WriteBool('AAA','u(j)',u[j]);
   iniTs.WriteInteger('AAA','tn(j)',tn[j]); iniTs.WriteInteger('AAA','t(tn(j))',t[tn[j]]); iniTs.WriteFloat('AAA','max(tn(j))',max[tn[j]]); iniTs.WriteFloat('AAA','min(tn(j))',min[tn[j]]); iniTs.WriteDateTime('AAA','Itime(tn(j))',Itime[tn[j]]);
   iniTs.WriteInteger('AAA','tk(j)',tk[j]); iniTs.WriteInteger('AAA','t(tk(j))',t[tk[j]]); iniTs.WriteFloat('AAA','max(tk(j))',max[tk[j]]); iniTs.WriteFloat('AAA','min(tk(j))',min[tk[j]]); iniTs.WriteDateTime('AAA','Itime(tk(j))',Itime[tk[j]]);
   if j>1 then begin iniTs.WriteBool('AAA','u(j-1)',u[j-1]);
     iniTs.WriteInteger('AAA','tn(j-1)',tn[j-1]); iniTs.WriteInteger('AAA','t(tn(j-1))',t[tn[j-1]]); iniTs.WriteFloat('AAA','max(tn(j-1))',max[tn[j-1]]); iniTs.WriteFloat('AAA','min(tn(j-1))',min[tn[j-1]]); iniTs.WriteDateTime('AAA','Itime(tn(j-1))',Itime[tn[j-1]]);
     iniTs.WriteInteger('AAA','tk(j-1)',tk[j-1]); iniTs.WriteInteger('AAA','t(tk(j-1))',t[tk[j-1]]); iniTs.WriteFloat('AAA','max(tk(j-1))',max[tk[j-1]]); iniTs.WriteFloat('AAA','min(tk(j-1))',min[tk[j-1]]); iniTs.WriteDateTime('AAA','Itime(tk(j-1))',Itime[tk[j-1]]);
   end;
   for ii:=1 to fk do begin
     iniTs.WriteInteger('f'+IntToStr(ii),'vf('+IntToStr(ii)+')',vf[ii]); iniTs.WriteInteger('f'+IntToStr(ii),'sk('+IntToStr(ii)+')',sk[ii]); iniTs.WriteInteger('f'+IntToStr(ii),'op('+IntToStr(ii)+')',op[ii]);
     iniTs.WriteInteger('f'+IntToStr(ii),'li('+IntToStr(ii)+')',li[ii]); iniTs.WriteFloat('f'+IntToStr(ii),'ly('+IntToStr(ii)+')',ly[ii]);
     for nn:=1 to sk[ii] do begin
       iniTs.WriteInteger('f'+IntToStr(ii),'s('+IntToStr(ii)+')',nn);
       iniTs.WriteInteger('f'+IntToStr(ii),'tsn('+IntToStr(nn)+')',tsn[ii,nn]); iniTs.WriteInteger('f'+IntToStr(ii),'t(tsn('+IntToStr(nn)+'))',t[tsn[ii,nn]]); iniTs.WriteFloat('f'+IntToStr(ii),'max(tsn('+IntToStr(nn)+'))',max[tsn[ii,nn]]); iniTs.WriteFloat('f'+IntToStr(ii),'min(tsn('+IntToStr(nn)+'))',min[tsn[ii,nn]]); iniTs.WriteDateTime('f'+IntToStr(ii),'Itime(tsn('+IntToStr(nn)+'))',Itime[tsn[ii,nn]]);
       iniTs.WriteInteger('f'+IntToStr(ii),'tsl('+IntToStr(nn)+')',tsl[ii,nn]); iniTs.WriteInteger('f'+IntToStr(ii),'t(tsl('+IntToStr(nn)+'))',t[tsl[ii,nn]]); iniTs.WriteFloat('f'+IntToStr(ii),'max(tsl('+IntToStr(nn)+'))',max[tsl[ii,nn]]); iniTs.WriteFloat('f'+IntToStr(ii),'min(tsl('+IntToStr(nn)+'))',min[tsl[ii,nn]]); iniTs.WriteDateTime('f'+IntToStr(ii),'Itime(tsl('+IntToStr(nn)+'))',Itime[tsl[ii,nn]]);
       iniTs.WriteInteger('f'+IntToStr(ii),'tsp('+IntToStr(nn)+')',tsp[ii,nn]); iniTs.WriteInteger('f'+IntToStr(ii),'t(tsp('+IntToStr(nn)+'))',t[tsp[ii,nn]]); iniTs.WriteFloat('f'+IntToStr(ii),'max(tsp('+IntToStr(nn)+'))',max[tsp[ii,nn]]); iniTs.WriteFloat('f'+IntToStr(ii),'min(tsp('+IntToStr(nn)+'))',min[tsp[ii,nn]]); iniTs.WriteDateTime('f'+IntToStr(ii),'Itime(tsp('+IntToStr(nn)+'))',Itime[tsp[ii,nn]]);
       iniTs.WriteInteger('f'+IntToStr(ii),'tss('+IntToStr(nn)+')',tss[ii,nn]); iniTs.WriteInteger('f'+IntToStr(ii),'t(tss('+IntToStr(nn)+'))',t[tss[ii,nn]]); iniTs.WriteFloat('f'+IntToStr(ii),'max(tss('+IntToStr(nn)+'))',max[tss[ii,nn]]); iniTs.WriteFloat('f'+IntToStr(ii),'min(tss('+IntToStr(nn)+'))',min[tss[ii,nn]]); iniTs.WriteDateTime('f'+IntToStr(ii),'Itime(tss('+IntToStr(nn)+'))',Itime[tss[ii,nn]]);
       iniTs.WriteInteger('f'+IntToStr(ii),'tsk('+IntToStr(nn)+')',tsk[ii,nn]); iniTs.WriteInteger('f'+IntToStr(ii),'t(tsk('+IntToStr(nn)+'))',t[tsk[ii,nn]]); iniTs.WriteFloat('f'+IntToStr(ii),'max(tsk('+IntToStr(nn)+'))',max[tsk[ii,nn]]); iniTs.WriteFloat('f'+IntToStr(ii),'min(tsk('+IntToStr(nn)+'))',min[tsk[ii,nn]]); iniTs.WriteDateTime('f'+IntToStr(ii),'Itime(tsk('+IntToStr(nn)+'))',Itime[tsk[ii,nn]]);
       iniTs.WriteInteger('f'+IntToStr(ii),'tst('+IntToStr(nn)+')',tst[ii,nn]); iniTs.WriteInteger('f'+IntToStr(ii),'t(tst('+IntToStr(nn)+'))',t[tst[ii,nn]]); iniTs.WriteFloat('f'+IntToStr(ii),'max(tst('+IntToStr(nn)+'))',max[tst[ii,nn]]); iniTs.WriteFloat('f'+IntToStr(ii),'min(tst('+IntToStr(nn)+'))',min[tst[ii,nn]]); iniTs.WriteDateTime('f'+IntToStr(ii),'Itime(tst('+IntToStr(nn)+'))',Itime[tst[ii,nn]]);
       iniTs.WriteInteger('f'+IntToStr(ii),'ks('+IntToStr(nn)+')',ks[ii,nn]); iniTs.WriteFloat('f'+IntToStr(ii),'pt('+IntToStr(nn)+')',pt[ii,nn]); iniTs.WriteFloat('f'+IntToStr(ii),'sm('+IntToStr(nn)+')',sm[ii,nn]); iniTs.WriteFloat('f'+IntToStr(ii),'cp('+IntToStr(nn)+')',cp[ii,nn]);
     end;
   end;
   iniTs.WriteInteger('WWW','w',w); iniTs.WriteInteger('WWW','fp',fp); iniTs.WriteInteger('WWW','sp',sp); iniTs.WriteInteger('WWW','tfp',tfp); iniTs.WriteInteger('WWW','f3',f3); iniTs.WriteInteger('WWW','f4',f4); iniTs.WriteInteger('WWW','f5',f5); iniTs.WriteInteger('WWW','kop',kop);
   iniTs.WriteInteger('WWW','zp',zp); iniTs.WriteInteger('WWW','zp2',zp2); iniTs.WriteInteger('WWW','zs',zs); if w>0 then iniTs.WriteBool('WWW','nap',nap); iniTs.WriteInteger('WWW','tpt',tpt); iniTs.WriteBool('WWW','stat',stat);
   iniTs.WriteFloat('WWW','tpvr',tpvr); iniTs.WriteFloat('WWW','tpvn',tpvn); iniTs.WriteFloat('WWW','tsv',tsv); iniTs.WriteFloat('WWW','trv',trv); iniTs.WriteFloat('WWW','ctr',ctr); iniTs.WriteFloat('WWW','ctn',ctn); iniTs.WriteFloat('WWW','cop',cop);
   for ii:=0 to Length(smv)-1 do begin
     iniTs.WriteFloat('srednee','smv('+IntToStr(ii)+')',smv[ii]); iniTs.WriteFloat('srednee','smn('+IntToStr(ii)+')',smn[ii]); iniTs.WriteInteger('srednee','nv('+IntToStr(ii)+')',nv[ii]); iniTs.WriteInteger('srednee','nm('+IntToStr(ii)+')',nm[ii]);
   end;

   inits.Free;
 end;
end;


procedure U1LoadFromIniFile;
Var ii,nn: Integer;
begin
 suma:=0; aa:=0;
 iniTS:=TIniFile.Create(extractfilepath(Application.ExeName)+'IniTs.ini');
 zn:=iniTs.ReadInteger('OOO','zn',1000);
 fk:=inits.ReadInteger('AAA','fk',0);
 if fk>0 then begin
   SetLength(vf,fk+1); SetLength(sk,fk+1); SetLength(ks,fk+1); SetLength(op,fk+1); SetLength(li,fk+1); SetLength(ly,fk+1);
   for ii:=1 to fk do begin
     f:=ii; vf[f]:=iniTs.ReadInteger('f'+IntToStr(ii),'vf('+IntToStr(ii)+')',0); sk[f]:=iniTs.ReadInteger('f'+IntToStr(ii),'sk('+IntToStr(ii)+')',0); op[f]:=iniTs.ReadInteger('f'+IntToStr(ii),'op('+IntToStr(ii)+')',0);
     li[f]:=iniTs.ReadInteger('f'+IntToStr(ii),'li('+IntToStr(ii)+')',0); ly[f]:=iniTs.ReadFloat('f'+IntToStr(ii),'ly('+IntToStr(ii)+')',0);
     SetLength(tsn,fk+1); SetLength(tsl,fk+1); SetLength(tsp,fk+1); SetLength(tss,fk+1); SetLength(tsk,fk+1); SetLength(tst,fk+1);
     SetLength(tsn[f],sk[f]+1); SetLength(tsl[f],sk[f]+1); SetLength(tsp[f],sk[f]+1); SetLength(tss[f],sk[f]+1); SetLength(tsk[f],sk[f]+1); SetLength(tst[f],sk[f]+1);
     SetLength(ks[f],sk[f]+1); SetLength(pt,fk+1); SetLength(sm,fk+1); SetLength(cp,fk+1);
     SetLength(pt[f],sk[f]+1); SetLength(sm[f],sk[f]+1); SetLength(cp[f],sk[f]+1);
     for nn:=1 to sk[f] do begin
       tsn[f,nn]:=iniTs.ReadInteger('f'+IntToStr(ii),'tsn('+IntToStr(nn)+')',0); U1FindA(tsn[f,nn]);
       tsl[f,nn]:=iniTs.ReadInteger('f'+IntToStr(ii),'tsl('+IntToStr(nn)+')',0); U1FindA(tsl[f,nn]);
       tsp[f,nn]:=iniTs.ReadInteger('f'+IntToStr(ii),'tsp('+IntToStr(nn)+')',0); U1FindA(tsp[f,nn]);
       tss[f,nn]:=iniTs.ReadInteger('f'+IntToStr(ii),'tss('+IntToStr(nn)+')',0); U1FindA(tss[f,nn]);
       tsk[f,nn]:=iniTs.ReadInteger('f'+IntToStr(ii),'tsk('+IntToStr(nn)+')',0); U1FindA(tsk[f,nn]);
       tst[f,nn]:=iniTs.ReadInteger('f'+IntToStr(ii),'tst('+IntToStr(nn)+')',0); U1FindA(tst[f,nn]);
       ks[f,nn]:=iniTs.ReadInteger('f'+IntToStr(ii),'ks('+IntToStr(nn)+')',0); pt[f,nn]:=iniTs.ReadFloat('f'+IntToStr(ii),'pt('+IntToStr(nn)+')',0); sm[f,nn]:=iniTs.ReadFloat('f'+IntToStr(ii),'sm('+IntToStr(nn)+')',0); cp[f,nn]:=iniTs.ReadFloat('f'+IntToStr(ii),'cp('+IntToStr(nn)+')',0);
     end;
   end;
   j:=1; jsum:=3; SetLength(u,jsum); SetLength(tn,jsum); SetLength(tk,jsum); u[j]:=iniTs.ReadBool('AAA','u(j-1)',false);
   tn[j]:=iniTs.ReadInteger('AAA','tn(j-1)',0); U1FindA(tn[j]); tk[j]:=iniTs.ReadInteger('AAA','tk(j-1)',0); U1FindA(tk[j]);
   j:=2; u[j]:=iniTs.ReadBool('AAA','u(j)',false);
   tn[j]:=iniTs.ReadInteger('AAA','tn(j)',0); U1FindA(tn[j]); tk[j]:=iniTs.ReadInteger('AAA','tk(j)',0); U1FindA(tk[j]);
   U1SortMassiv;
   for ii:=1 to fk do begin
     SetLength(t, Length(a)); SetLength(min, Length(a)); SetLength(max, Length(a)); SetLength(Itime, Length(a));
     for nn:=1 to sk[ii] do begin
       i:=-1; repeat i:=i+1 until tsn[ii,nn]=a[i]; tsn[ii,nn]:=i; t[tsn[ii,nn]]:=iniTs.ReadInteger('f'+IntToStr(ii),'t(tsn('+IntToStr(nn)+'))',0); max[tsn[ii,nn]]:=iniTs.ReadFloat('f'+IntToStr(ii),'max(tsn('+IntToStr(nn)+'))',0); min[tsn[ii,nn]]:=iniTs.ReadFloat('f'+IntToStr(ii),'min(tsn('+IntToStr(nn)+'))',0); Itime[tsn[ii,nn]]:=iniTs.ReadDateTime('f'+IntToStr(ii),'Itime(tsn('+IntToStr(nn)+'))',0);
       i:=-1; repeat i:=i+1 until tsl[ii,nn]=a[i]; tsl[ii,nn]:=i; t[tsl[ii,nn]]:=iniTs.ReadInteger('f'+IntToStr(ii),'t(tsl('+IntToStr(nn)+'))',0); max[tsl[ii,nn]]:=iniTs.ReadFloat('f'+IntToStr(ii),'max(tsl('+IntToStr(nn)+'))',0); min[tsl[ii,nn]]:=iniTs.ReadFloat('f'+IntToStr(ii),'min(tsl('+IntToStr(nn)+'))',0); Itime[tsl[ii,nn]]:=iniTs.ReadDateTime('f'+IntToStr(ii),'Itime(tsl('+IntToStr(nn)+'))',0);
       i:=-1; repeat i:=i+1 until tsp[ii,nn]=a[i]; tsp[ii,nn]:=i; t[tsp[ii,nn]]:=iniTs.ReadInteger('f'+IntToStr(ii),'t(tsp('+IntToStr(nn)+'))',0); max[tsp[ii,nn]]:=iniTs.ReadFloat('f'+IntToStr(ii),'max(tsp('+IntToStr(nn)+'))',0); min[tsp[ii,nn]]:=iniTs.ReadFloat('f'+IntToStr(ii),'min(tsp('+IntToStr(nn)+'))',0); Itime[tsp[ii,nn]]:=iniTs.ReadDateTime('f'+IntToStr(ii),'Itime(tsp('+IntToStr(nn)+'))',0);
       i:=-1; repeat i:=i+1 until tss[ii,nn]=a[i]; tss[ii,nn]:=i; t[tss[ii,nn]]:=iniTs.ReadInteger('f'+IntToStr(ii),'t(tss('+IntToStr(nn)+'))',0); max[tss[ii,nn]]:=iniTs.ReadFloat('f'+IntToStr(ii),'max(tss('+IntToStr(nn)+'))',0); min[tss[ii,nn]]:=iniTs.ReadFloat('f'+IntToStr(ii),'min(tss('+IntToStr(nn)+'))',0); Itime[tss[ii,nn]]:=iniTs.ReadDateTime('f'+IntToStr(ii),'Itime(tss('+IntToStr(nn)+'))',0);
       i:=-1; repeat i:=i+1 until tsk[ii,nn]=a[i]; tsk[ii,nn]:=i; t[tsk[ii,nn]]:=iniTs.ReadInteger('f'+IntToStr(ii),'t(tsk('+IntToStr(nn)+'))',0); max[tsk[ii,nn]]:=iniTs.ReadFloat('f'+IntToStr(ii),'max(tsk('+IntToStr(nn)+'))',0); min[tsk[ii,nn]]:=iniTs.ReadFloat('f'+IntToStr(ii),'min(tsk('+IntToStr(nn)+'))',0); Itime[tsk[ii,nn]]:=iniTs.ReadDateTime('f'+IntToStr(ii),'Itime(tsk('+IntToStr(nn)+'))',0);
       i:=-1; repeat i:=i+1 until tst[ii,nn]=a[i]; tst[ii,nn]:=i; t[tst[ii,nn]]:=iniTs.ReadInteger('f'+IntToStr(ii),'t(tst('+IntToStr(nn)+'))',0); max[tst[ii,nn]]:=iniTs.ReadFloat('f'+IntToStr(ii),'max(tst('+IntToStr(nn)+'))',0); min[tst[ii,nn]]:=iniTs.ReadFloat('f'+IntToStr(ii),'min(tst('+IntToStr(nn)+'))',0); Itime[tst[ii,nn]]:=iniTs.ReadDateTime('f'+IntToStr(ii),'Itime(tst('+IntToStr(nn)+'))',0);
     end;
   end; j:=1;
   i:=-1; repeat i:=i+1 until tn[j]=a[i]; tn[j]:=i; t[tn[j]]:=iniTs.ReadInteger('AAA','t(tn(j-1))',0); max[tn[j]]:=iniTs.ReadFloat('AAA','max(tn(j-1))',0); min[tn[j]]:=iniTs.ReadFloat('AAA','min(tn(j-1))',0); Itime[tn[j]]:=iniTs.ReadDateTime('AAA','Itime(tn(j-1))',0);
   i:=-1; repeat i:=i+1 until tk[j]=a[i]; tk[j]:=i; t[tk[j]]:=iniTs.ReadInteger('AAA','t(tk(j-1))',0); max[tk[j]]:=iniTs.ReadFloat('AAA','max(tk(j-1))',0); min[tk[j]]:=iniTs.ReadFloat('AAA','min(tk(j-1))',0); Itime[tk[j]]:=iniTs.ReadDateTime('AAA','Itime(tk(j-1))',0);
   j:=2;
   i:=-1; repeat i:=i+1 until tn[j]=a[i]; tn[j]:=i; t[tn[j]]:=iniTs.ReadInteger('AAA','t(tn(j))',0); max[tn[j]]:=iniTs.ReadFloat('AAA','max(tn(j))',0); min[tn[j]]:=iniTs.ReadFloat('AAA','min(tn(j))',0); Itime[tn[j]]:=iniTs.ReadDateTime('AAA','Itime(tn(j))',0);
   i:=-1; repeat i:=i+1 until tk[j]=a[i]; tk[j]:=i; t[tk[j]]:=iniTs.ReadInteger('AAA','t(tk(j))',0); max[tk[j]]:=iniTs.ReadFloat('AAA','max(tk(j))',0); min[tk[j]]:=iniTs.ReadFloat('AAA','min(tk(j))',0); Itime[tk[j]]:=iniTs.ReadDateTime('AAA','Itime(tk(j))',0);
   w:=iniTs.ReadInteger('WWW','w',0); fp:=iniTs.ReadInteger('WWW','fp',0); sp:=iniTs.ReadInteger('WWW','sp',0); tfp:=iniTs.ReadInteger('WWW','tfp',0); f3:=iniTs.ReadInteger('WWW','f3',f3); f4:=iniTs.ReadInteger('WWW','f4',0); f5:=iniTs.ReadInteger('WWW','f5',0); kop:=iniTs.ReadInteger('WWW','kop',0);
   zp:=iniTs.ReadInteger('WWW','zp',0); zp2:=iniTs.ReadInteger('WWW','zp2',0); zs:=iniTs.ReadInteger('WWW','zs',0); if w>0 then nap:=iniTs.ReadBool('WWW','nap',false); tpt:=iniTs.ReadInteger('WWW','tpt',0); stat:=iniTs.ReadBool('WWW','stat',false);
   tpvr:=iniTs.ReadFloat('WWW','tpvr',0); tpvn:=iniTs.ReadFloat('WWW','tpvn',0); tsv:=iniTs.ReadFloat('WWW','tsv',0); trv:=iniTs.ReadFloat('WWW','trv',0); ctr:=iniTs.ReadFloat('WWW','ctr',0); ctn:=iniTs.ReadFloat('WWW','ctn',0); cop:=iniTs.ReadFloat('WWW','cop',0);
   for ii:=0 to Length(smv)-1 do begin
     smv[ii]:=iniTs.ReadFloat('srednee','smv('+IntToStr(ii)+')',0); smn[ii]:=iniTs.ReadFloat('srednee','smn('+IntToStr(ii)+')',0); nv[ii]:=iniTs.ReadInteger('srednee','nv('+IntToStr(ii)+')',0); nm[ii]:=iniTs.ReadInteger('srednee','nm('+IntToStr(ii)+')',0);
   end;
   y:=Length(smv)-1;
   Form1.ShowFigure;
 end;
 inits.Free;
end;

procedure U1FindA(tfind:Integer);
Var bz: Boolean;
    nn: Integer;
begin
 bz:=false;
 for nn:=0 to Length(a)-1 do begin if tfind=a[nn] then bz:=true; end;
 if bz=false then begin suma:=suma+1; SetLength(a,suma); a[aa]:=tfind; aa:=aa+1; end;
end;

procedure U1SortMassiv;
Var ii,jj,mm,temp: Integer;
begin
 for mm:=Length(a)-1 downto 1 do begin
   temp:=a[0]; jj:=0;
   for ii:=1 to mm do begin
     if a[ii]>temp then begin temp:=a[ii]; jj:=ii; end;
   end;
   a[jj]:=a[mm]; a[mm]:=temp;
 end;
 //for ii:=0 to Length(a)-1 do begin mm:=ii; for jj:=ii+1 to Length(a)-2 do begin if a[jj]<a[mm] then mm:=jj; temp:=a[ii]; a[ii]:=a[mm]; a[mm]:=temp; end; end;
end;

procedure BlockChanel;
Var y1,ysk,X1,X2,X3,Xk,Xp,Xps,Xsk,Lytx,Smf,klc,N: Real;
//Label tskk,tspp,tskp;
begin
 s:=sk[f]; ly[f]:=0;
 y1:=t[tsn[f,1]]+(t[tsk[f,1]]-t[tsn[f,1]])/2; ysk:=t[tsn[f,s]]+(t[tsk[f,s]]-t[tsn[f,s]])/2;
 if cp[f,s]=cp[f,1] then cp[f,s]:=cp[f,s]+0.0001;
 if vf[f] in [3,8] then begin                                                  // 3,8
   ly[f]:=max[tsk[f,s-1]]-(cp[f,1]-cp[f,s])*(1+t[i]-t[tsk[f,s-1]])/(ysk-y1+1); // ����� Cp tsk s-1
   if s>2 then begin
     X1:=max[tsk[f,s-1]]+(cp[f,1]-cp[f,s])*(1+t[tsk[f,s-1]]-t[tsk[f,s-2]])/(ysk-y1+1);
     X2:=max[tsk[f,s-1]]+(cp[f,1]-cp[f,s])*(1+t[tsk[f,s-1]]-t[tsn[f,s-2]])/(ysk-y1+1);
     X3:=max[tsk[f,s-1]]-(cp[f,1]-cp[f,s])*(1+ysk-t[tsk[f,s-1]])/(ysk-y1+1);
     Tx:=max[tsk[f,s-2]]-(cp[f,1]-cp[f,s])*(1+t[i]-t[tsk[f,s-2]])/(ysk-y1+1);    // ����� Cp tsk s-2
     if (X3>cp[f,s]+0.1*(max[tsn[f,s-1]]-min[tsp[f,s-1]])) and (X1>max[tsk[f,s-2]]+0.1*(max[tsn[f,s-2]]-min[tsp[f,s-2]]))
        and (X2>max[tsk[f,s-2]]+0.1*(max[tsn[f,s-2]]-min[tsp[f,s-2]])) then ly[f]:=Tx;
   end;
   if (f+1<=fk) and (sk[f+1]=1) and (vf[f+1] in [1,13]) and (1+t[tsk[fo2,1]]-t[tsn[fo2,1]]>3) and (1+t[tsk[fo2,1]]-t[tsn[fo2,1]]>0.111*(1+t[tsk[f,s]]-t[tsn[f,s]]))
      and (tsk[f,s]<>tss[f,s]) then ly[f]:=max[tsn[f,1]]-(max[tsn[f,1]]-max[tss[f,s]])*(1+t[i]-t[tsn[f,1]])/(1+t[tss[f,s]]-t[tsn[f,1]]) // ����� 13/14
   else begin
     Tx:=max[tsk[f,s-1]]-(min[tsp[f,s-1]]-min[tsl[f,s]])*(1+t[i]-t[tsk[f,s-1]])/(1+t[tsl[f,s]]-t[tsp[f,s-1]]);  // ����� tsp(sk)
     X1:=cp[f,1]-(min[tsp[f,s-1]]-min[tsl[f,s]])*(1+ysk-y1)/(1+t[tsl[f,s]]-t[tsp[f,s-1]]);
     if ly[f]>Tx then Lytx:=ly[f]-Tx else Lytx:=Tx-ly[f];
     if (cp[f,s]>max[tsp[fo2,1]]) and (max[tsn[f,s]]-min[tsp[f,s]]>=2*(max[tsn[f,s-1]]-min[tsp[f,s-1]])) and (Tx>min[tsp[f,s]])
       and (Lytx>=0.11*(max[tsn[f,s]]-min[tsp[f,s]])) and (X1<cp[f,s]-0.11*(max[tsn[f,1]]-min[tsp[f,s]])) then ly[f]:=Tx
     else if (s=2) and (cp[f,s]<=max[tsk[f,s]]) and (cp[f,s-1]>max[tsk[f,s-1]])
     and (1+t[tsk[f,s-1]]-t[tsl[f,s-1]]<=0.33*(1+t[tsk[f,s-1]]-t[tsn[f,s-1]])) then ly[f]:=max[tsp[fo2,1]]-1
     else begin
       X1:=max[tsn[f,1]]-(max[tsn[f,1]]-max[tsp[fo2,1]])*(1+y1-t[tsn[f,1]])/(1+t[i]-t[tsn[f,1]]);
       X2:=max[tsn[f,1]]-(max[tsn[f,1]]-max[tsp[fo2,1]])*(1+ysk-t[tsn[f,1]])/(1+t[i]-t[tsn[f,1]]);
       Xk:=max[tsn[f,1]]-(max[tsn[f,1]]-max[tsp[fo2,1]])*(1+t[tsk[f,s-1]]-t[tsn[f,1]])/(1+t[i]-t[tsn[f,1]]);
       Xp:=min[tsl[f,1]]-(max[tsn[f,1]]-max[tsp[fo2,1]])*(1+t[tsp[f,s]]-t[tsl[f,1]])/(1+t[i]-t[tsn[f,1]]);
       Xps:=min[tsl[f,1]]-(max[tsn[f,1]]-max[tsp[fo2,1]])*(1+ysk-t[tsl[f,1]])/(1+t[i]-t[tsn[f,1]]);
       Xsk:=min[tsl[f,s]]+(max[tsn[f,1]]-max[tsp[fo2,1]])*(1+t[tsl[f,s]]-y1)/(1+t[i]-t[tsn[f,1]]);
       N:=0; Smf:=(max[tsp[fo2,1]]-cp[fo2,1])/(cp[fo2,1]-min[tsn[fo2,1]]); klc:=t[tsk[f,s]]-t[tsp[f,s]];
       if (X2>=cp[f,s]) then N:=N+1;
       if (X1>cp[f,1]+0.05*(max[tsn[f,1]]-min[tsp[f,1]])) then N:=N+1;
       if (Xk<=max[tsk[f,s-1]]+0.1*(max[tsn[f,s-1]]-min[tsp[f,s-1]])) then N:=N+1;
       if ( (Xp>=min[tsp[f,s]]-0.1*(max[tsn[f,s]]-min[tsp[f,s]])) or (Xsk<=cp[f,1]-0.1*(max[tsn[f,1]]-min[tsp[f,1]])) ) then N:=N+1;
       if ( (Xps<cp[f,s]-0.1*(max[tsn[f,s]]-min[tsp[f,s]])) or ((Xps<cp[f,s]) and (t[tsp[f,s]]<ysk) and (ly[f]>max[tsp[fo2,1]]+0.05*(max[tsp[fo2,1]]-min[tsn[fo2,1]]))) ) then N:=N+1;
       if (klc>=0.34*(t[tsk[f,s-1]]-t[tsl[f,s-1]])) then N:=N+1;
       if (f-2<=0) or ((vf[f-1]<>7) or (vf[f-2]<>7)) then N:=N+1;
       if (sk[f]=2) and ( ((Smf<=0.91) and (klc<=1.1*(t[tsp[f,s]]-t[tsn[f,s]])) and (t[tsk[f,1]]-t[tsp[f,1]]<=1.1*(t[tsp[f,1]]-t[tsn[f,1]])))
          or ((Smf<=0.75) and ( (klc<=1.1*(t[tsp[f,s]]-t[tsn[f,s]])) or (t[tsk[f,1]]-t[tsp[f,1]]<=1.1*(t[tsp[f,1]]-t[tsn[f,1]])))) ) then N:=N+1;
       if (sk[f]>2) and (Smf<=0.75) and ((t[tsl[fo2,1]]<>t[tsp[fo2,1]]) or (t[tsk[fo2,1]]<>t[tss[fo2,1]])) and (Xp>=min[tsp[f,s]]-0.1*(max[tsn[f,s]]-min[tsp[f,s]])) then begin
         s:=sk[f]+1;
         repeat s:=s-1; until (t[tsk[f,s]]-t[tsp[f,s]]<=1.1*(t[tsp[f,s]]-t[tsn[f,s]])) or (s=1);
         if ((s=1) and (t[tsk[f,1]]-t[tsp[f,1]]<=1.1*(t[tsp[f,1]]-t[tsn[f,1]]))) or (t[tsk[f,s]]-t[tsp[f,s]]<=1.1*(t[tsp[f,s]]-t[tsn[f,s]])) then N:=N+1;
       end; s:=sk[f];
       if N>=8 then ly[f]:=1111111
       else if (s=2) and (max[tsn[f,1]]-max[tsk[f,1]]<=0.12*(max[tsn[f,1]]-min[tsp[f,1]])) then begin    // ����� tsn
         X1:=max[tsn[f,1]]-(cp[f,1]-cp[f,s])*(1+t[tsp[fo2,1]]-t[tsn[f,1]])/(ysk-y1+1);
         X2:=max[tsn[f,1]]-(cp[f,1]-cp[f,s])*(1+ysk-t[tsn[f,1]])/(ysk-y1+1);
         Tx:=max[tsn[f,1]]-(cp[f,1]-cp[f,s])*(1+t[i]-t[tsn[f,1]])/(ysk-y1+1);
         if (X1>max[tsp[fo2,1]]) and (X2>=cp[f,s]+0.11*(max[tsn[f,1]]-min[tsp[f,s]])) and (Tx<=max[tsp[fo2,1]]+0.05*(max[tsp[fo2,1]]-min[tsn[fo2,1]])) then ly[f]:=Tx
         else begin
           X1:=max[tsn[f,1]]-(min[tsp[f,1]]-min[tsp[f,s]])*(1+t[tsp[fo2,1]]-t[tsn[f,1]])/(1+t[tsp[f,s]]-t[tsp[f,1]]);
           Tx:=max[tsn[f,1]]-(min[tsp[f,1]]-min[tsp[f,s]])*(1+t[i]-t[tsn[f,1]])/(1+t[tsp[f,s]]-t[tsp[f,1]]);
           if (X1>max[tsp[fo2,1]]) and (Tx<=max[tsp[fo2,1]]+0.05*(max[tsp[fo2,1]]-min[tsn[fo2,1]])) then begin ly[f]:=Tx; li[f]:=li[f]+1000; end;
         end;
       end;
     end;
   end;
 end else begin                                                               // 10,4
   ly[f]:=min[tsk[f,s-1]]+(cp[f,s]-cp[f,1])*(1+t[i]-t[tsk[f,s-1]])/(ysk-y1+1);  // ����� Cp tsk s-1
   if s>2 then begin
     X1:=min[tsk[f,s-1]]-(cp[f,s]-cp[f,1])*(1+t[tsk[f,s-1]]-t[tsk[f,s-2]])/(ysk-y1+1);
     X2:=min[tsk[f,s-1]]-(cp[f,s]-cp[f,1])*(1+t[tsk[f,s-1]]-t[tsn[f,s-2]])/(ysk-y1+1);
     X3:=min[tsk[f,s-1]]+(cp[f,s]-cp[f,1])*(1+ysk-t[tsk[f,s-1]])/(ysk-y1+1);
     Tx:=min[tsk[f,s-2]]+(cp[f,s]-cp[f,1])*(1+t[i]-t[tsk[f,s-2]])/(ysk-y1+1);          // ����� Cp tsk s-2
     if (X3<cp[f,s]-0.1*(max[tsp[f,s-1]]-min[tsn[f,s-1]])) and (X1<min[tsk[f,s-2]]+0.1*(max[tsp[f,s-2]]-min[tsn[f,s-2]]))
        and (X2<min[tsk[f,s-2]]+0.1*(max[tsp[f,s-2]]-min[tsn[f,s-2]])) then ly[f]:=Tx;
   end;
   if (f+1<=fk) and (sk[f+1]=1) and (vf[f+1] in [2,14]) and (1+t[tsk[fo2,1]]-t[tsn[fo2,1]]>3) and (1+t[tsk[fo2,1]]-t[tsn[fo2,1]]>0.111*(1+t[tsk[f,s]]-t[tsn[f,s]]))
      and (tsk[f,s]<>tss[f,s]) then ly[f]:=min[tsn[f,1]]+(min[tss[f,s]]-min[tsn[f,1]])*(1+t[i]-t[tsn[f,1]])/(1+t[tss[f,s]]-t[tsn[f,1]])  // ����� 13/14
   else begin
     Tx:=min[tsk[f,s-1]]+(max[tsl[f,s]]-max[tsp[f,s-1]])*(1+t[i]-t[tsk[f,s-1]])/(1+t[tsl[f,s]]-(t[tsp[f,s-1]])*1.00001);      // ����� tsp(sk)
     X1:=cp[f,1]+(max[tsl[f,s]]-max[tsp[f,s-1]])*(1+ysk-y1)/(1+t[tsl[f,s]]-(t[tsp[f,s-1]])*1.00001);
     if ly[f]>Tx then Lytx:=ly[f]-Tx else Lytx:=Tx-ly[f];
     if (cp[f,s]<min[tsp[fo2,1]]) and (max[tsp[f,s]]-min[tsn[f,s]]>=2*(max[tsp[f,s-1]]-min[tsn[f,s-1]])) and (Tx<max[tsp[f,s]])
       and (Lytx>=0.11*(max[tsp[f,s]]-min[tsn[f,s]])) and (X1>cp[f,s]+0.11*(max[tsp[f,s]]-min[tsn[f,1]])) then ly[f]:=Tx
     else if (s=2) and (cp[f,s]>=min[tsk[f,s]]) and (cp[f,s-1]<min[tsk[f,s-1]])
     and (1+t[tsk[f,s-1]]-t[tsl[f,s-1]]<=0.33*(1+t[tsk[f,s-1]]-t[tsn[f,s-1]])) then ly[f]:=min[tsp[fo2,1]]+1
     else begin
       X1:=min[tsn[f,1]]+(min[tsp[fo2,1]]-min[tsn[f,1]])*(1+y1-t[tsn[f,1]])/(1+t[i]-t[tsn[f,1]]);
       X2:=min[tsn[f,1]]+(min[tsp[fo2,1]]-min[tsn[f,1]])*(1+ysk-t[tsn[f,1]])/(1+t[i]-t[tsn[f,1]]);
       Xk:=min[tsn[f,1]]+(min[tsp[fo2,1]]-min[tsn[f,1]])*(1+t[tsk[f,s-1]]-t[tsn[f,1]])/(1+t[i]-t[tsn[f,1]]);
       Xp:=max[tsl[f,1]]+(min[tsp[fo2,1]]-min[tsn[f,1]])*(1+t[tsp[f,s]]-t[tsl[f,1]])/(1+t[i]-t[tsn[f,1]]);
       Xps:=max[tsl[f,1]]+(min[tsp[fo2,1]]-min[tsn[f,1]])*(1+ysk-t[tsl[f,1]])/(1+t[i]-t[tsn[f,1]]);
       Xsk:=max[tsl[f,s]]+(min[tsp[fo2,1]]-min[tsn[f,1]])*(1+t[tsl[f,s]]-y1)/(1+t[i]-t[tsn[f,1]]);
       N:=0; Smf:=(cp[fo2,1]-min[tsp[fo2,1]])/(max[tsn[fo2,1]]-cp[fo2,1]); klc:=t[tsk[f,s]]-t[tsp[f,s]];
       if (X2<=cp[f,s]) then N:=N+1;
       if (X1<cp[f,1]-0.1*(max[tsp[f,1]]-min[tsn[f,1]])) then N:=N+1;
       if (Xk>=min[tsk[f,s-1]]-0.1*(max[tsp[f,s-1]]-min[tsn[f,s-1]])) then N:=N+1;
       if ((Xp<=max[tsp[f,s]]+0.1*(max[tsp[f,s]]-min[tsn[f,s]])) or (Xsk>=cp[f,1]+0.1*(max[tsp[f,1]]-min[tsl[f,1]]))) then N:=N+1;
       if ((Xps>cp[f,s]+0.1*(max[tsp[f,s]]-min[tsn[f,s]])) or ((Xps>cp[f,s]) and (t[tsp[f,s]]<ysk) and (ly[f]<min[tsp[fo2,1]]-0.05*(max[tsn[fo2,1]]-min[tsp[fo2,1]])))) then N:=N+1;
       if (klc>=0.34*(t[tsk[f,s-1]]-t[tsl[f,s-1]])) then N:=N+1;
       if (f-2<=0) or ((vf[f-1]<>9) or (vf[f-2]<>9)) then N:=N+1;
       if (sk[f]=2) and ( ((Smf<=0.91) and (klc<=1.1*(t[tsp[f,s]]-t[tsn[f,s]])) and (t[tsk[f,1]]-t[tsp[f,1]]<=1.1*(t[tsp[f,1]]-t[tsn[f,1]])))
          or ((Smf<=0.75) and ( (klc<=1.1*(t[tsp[f,s]]-t[tsn[f,s]])) or (t[tsk[f,1]]-t[tsp[f,1]]<=1.1*(t[tsp[f,1]]-t[tsn[f,1]])))) ) then N:=N+1;
       if (sk[f]>2) and (Smf<=0.75) and ((t[tsl[fo2,1]]<>t[tsp[fo2,1]]) or (t[tsk[fo2,1]]<>t[tss[fo2,1]])) and (Xp<=max[tsp[f,s]]+0.1*(max[tsp[f,s]]-min[tsn[f,s]])) then begin
         s:=sk[f]+1;
         repeat s:=s-1; until (t[tsk[f,s]]-t[tsp[f,s]]<=1.1*(t[tsp[f,s]]-t[tsn[f,s]])) or (s=1);
         if ((s=1) and (t[tsk[f,1]]-t[tsp[f,1]]<=1.1*(t[tsp[f,1]]-t[tsn[f,1]]))) or (t[tsk[f,s]]-t[tsp[f,s]]<=1.1*(t[tsp[f,s]]-t[tsn[f,s]])) then N:=N+1;
       end; s:=sk[f];
       if N>=8 then ly[f]:=1111111
       else if (s=2) and (min[tsk[f,1]]-min[tsn[f,1]]<=0.12*(max[tsp[f,1]]-min[tsn[f,1]])) then begin    // ����� tsn
         X1:=min[tsn[f,1]]+(cp[f,s]-cp[f,1])*(1+t[tsp[fo2,1]]-t[tsn[f,1]])/(ysk-y1+1);
         X2:=min[tsn[f,1]]+(cp[f,s]-cp[f,1])*(1+ysk-t[tsn[f,1]])/(ysk-y1+1);
         Tx:=min[tsn[f,1]]+(cp[f,s]-cp[f,1])*(1+t[i]-t[tsn[f,1]])/(ysk-y1+1);
         if (X1<min[tsp[fo2,1]]) and (X2<=cp[f,s]-0.11*(max[tsp[f,s]]-min[tsn[f,1]])) and (Tx>=min[tsp[fo2,1]]-0.05*(max[tsn[fo2,1]]-min[tsp[fo2,1]])) then ly[f]:=Tx
         else begin
           X1:=min[tsn[f,1]]+(max[tsp[f,s]]-max[tsp[f,1]])*(1+t[tsp[fo2,1]]-t[tsn[f,1]])/(1+t[tsp[f,s]]-t[tsp[f,1]]);
           Tx:=min[tsn[f,1]]+(max[tsp[f,s]]-max[tsp[f,1]])*(1+t[i]-t[tsn[f,1]])/(1+t[tsp[f,s]]-t[tsp[f,1]]);
           if (X1<min[tsp[fo2,1]]) and (Tx>=min[tsp[fo2,1]]-0.05*(max[tsn[fo2,1]]-min[tsp[fo2,1]])) then begin ly[f]:=Tx; li[f]:=li[f]+1000; end;
         end;
       end;
     end;
   end;
 end;
 ly[f]:=round(ly[f]);
end;

end.


