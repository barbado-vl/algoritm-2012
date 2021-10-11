unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADLite_TLB, StdCtrls, ExtCtrls, Grids, DBGrids,
  TeeProcs, TeEngine, Chart, DB, DBTables, Series, MXGRAPH,
  ArrowCha, ADODB, ComCtrls, Inifiles, ShellAPI;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Timer1: TTimer;
    DataSource1: TDataSource;
    Edit5: TEdit;
    Button2: TButton;
    Memo1: TMemo;
    DataSource2: TDataSource;
    AD_little_lines: TADOTable;
    arch_min1: TADOTable;
    Label1: TLabel;
    Button4: TButton;
    ADOConnection1: TADOConnection;
    DataSource3: TDataSource;
    ADOQuery1: TADOQuery;
    EditNk: TEdit;
    EditKch: TEdit;
    EditMnovn: TEdit;
    EditStepN: TEdit;
    ButtonSetNamber: TButton;
    TpvnEdit: TEdit;
    TpvrEdit: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    ZNEdit: TEdit;
    TrvEdit: TEdit;
    TsvEdit: TEdit;
    EditCho: TEdit;
    Button3: TButton;
    EditStus: TEdit;
    Label22: TLabel;
    EditBp: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label21: TLabel;
    Label20: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label12: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    ZSEdit: TEdit;
    ZREdit: TEdit;
    ZPEdit: TEdit;
    WEdit: TEdit;
    Fp2Edit: TEdit;
    FdEdit: TEdit;
    F4Edit: TEdit;
    F3Edit: TEdit;
    FpEdit: TEdit;
    EditUm1v: TEdit;
    Label25: TLabel;
    EditUm2v: TEdit;
    Label26: TLabel;
    Button5: TButton;
    SaveButton: TButton;
    CheckBox1: TCheckBox;
    Button6: TButton;
    Label8: TLabel;
    EditUm1n: TEdit;
    EditUm2n: TEdit;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    EditFrv: TEdit;
    EditFrn: TEdit;
    EditMp: TEdit;
    EditMfv: TEdit;
    EditMfn: TEdit;
    Label31: TLabel;
    Label32: TLabel;
    EditXxx: TEdit;
    Label33: TLabel;
    EditMnovr: TEdit;
    Label34: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ButtonSetNamberClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LineMaker1;
    procedure ShowFigure;
    procedure FindMaxMinForDinamic(s:WideString);
    procedure SredneeSvechek;
    procedure Alarm;
    procedure Parametrs;
    { Public declarations }
  end;

var
   Form1: TForm1;
   AD: IAlfaDirect; //объект альфадирект
   ADt: TDateTime;
   Itime: array of TDateTime;
   mx, mn,trsi, price, n1, srs: Real;  //макс и мин цена за текущую минуту
   Hist: TextFile;
   iniTs: TIniFile;
   i,j,sum,jsum,zn2,y,AA,BB: Integer; //f-№ фигуры, fk-последняя фигура, sk-последняя ступень
   szn,SStime, AccTr, Tread, placeC, pcode, paperNo , trm, trs: String; // значения из АД
   mYear, mMonth, mDay, Hour, Minn, Sec, MSec: Word;
   u: array of Boolean; //  вниз - false, вверх - true
   tn, tk, t, nv, nm: array of Integer;
   mxf,ti,fe,vkl,pkl: Boolean;
   max, min, smv, smn: array of real;
   sc: WideString;

implementation
uses Unit2, Unit3;

{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
begin
 try
    AD := CoAlfaDirect.Create;
    Label1.Caption := 'Объект успешно создан';
  except
    Label1.Caption := Exception(ExceptObject).Message;
 end;
 f:=0; fk:=0; Setlength(sk,2); sk[0]:=0;
 Nk:=0; Kch:=1; mnovn:=0; mnovr:=0; stepN:=60; um1v:=0; um2v:=0; um1n:=0; um2n:=0;
 frv:=0; frn:=0; mp:=0; mfv:=0; mfn:=0; Xxx:=0;                                                     /// ПАРАМЕТРЫ !!!!!!!!!
 stus:='O';  chpad:='0'; b_p:='0'; EditCho.Text:=chpad; EditStus.Text:=stus; EditBp.Text:=b_p; //OFFLINE TEST
 EditNk.Text:=IntToStr(Nk); EditKch.Text:=FloatToStr(Kch); EditStepN.Text:=FloatToStr(stepN);
 EditMnovn.Text:=IntToStr(mnovn); EditMnovr.Text:=IntToStr(mnovr);
 EditUm1v.Text:=IntToStr(um1v); EditUm2v.Text:=IntToStr(um2v);
 EditUm1n.Text:=IntToStr(um1n); EditUm2n.Text:=IntToStr(um2n);
 EditFrv.Text:=IntToStr(frv); EditFrn.Text:=IntToStr(frn); EditMp.Text:=IntToStr(mp);
 EditMfv.Text:=IntToStr(mfv); EditMfn.Text:=IntToStr(mfn);
 EditXxx.Text:=IntToStr(Xxx);
 vkl:=false; w:=0; fp:=0; sp:=0; f3:=0; f4:=0; f5:=0; ;zp:=0; zp2:=0; zs:=0; kop:=0; tfp:=0; rn:=0;
 pkl:=true; stat:=false; tpvn:=0; tpvr:=0; trv:=0; tsv:=0; tpt:=0; ctr:=0; ctn:=0; cop:=0; price:=0;
 step1:=0; step2:=0; step3:=0; step6:=0; zn2:=0;
 AccTr:='5767-000'; Tread:='5767'; placeC:='FORTS'; pcode:='SBER-6.15'; paperNo:='79633'; tout:=-10;      // ЗАМЕНА !!!!!  // в Tform, объект "ADO ?", свойство SQL (TStrings)
 AssignFile(Hist, 'Logs.txt');
end;

procedure TForm1.ButtonSetNamberClick(Sender: TObject);
begin
 // Timer1.Enabled:=false;
 Nk:=StrToInt(EditNk.Text); Kch:=StrToInt(EditKch.Text); stepN:=StrToFloat(EditStepN.Text);
 um1v:=StrToInt(EditUm1v.Text); um2v:=StrToInt(EditUm2v.Text); um1n:=StrToInt(EditUm1n.Text); um2n:=StrToInt(EditUm2n.Text);
 frv:=StrToInt(EditFrv.Text); frn:=StrToInt(EditFrn.Text); mp:=StrToInt(EditMp.Text); mfv:=StrToInt(EditMfv.Text); mfn:=StrToInt(EditMfn.Text);
 Xxx:=StrToInt(EditXxx.Text);
 mnovn:=StrToInt(EditMnovn.Text); mnovr:=StrToInt(EditMnovr.Text);
 if (f3>0) and (vf[f3]<>7) then begin f3:=0; tpvn:=0; end;
 if (f4>0) and (vf[f4]<>9) then begin f4:=0; tpvr:=0; end;
 if (f5>0) and (vf[f5] in [1,2,3,4,8,10,13,14,98,99]) then begin f5:=0; tsv:=trv; end;
 // Timer1.Enabled:=true;
end;

procedure TForm1.ShowFigure;
Var ii,nn:Integer;
    t1,t2,t3,t4,t5:string;
begin
 Memo1.Lines.Add('i='+inttostr(i)+'  t[i]='+inttostr(t[i])+'  j='+inttostr(j)+'  maxI='+floattostr(max[i])+' minI='+floattostr(min[i])+'  timeI='+DateTimeToStr(Itime[i])+'  '+SStime+':'+IntToStr(sec));
 Append(Hist); WriteLn(Hist,'i='+inttostr(i)+'  t[i]='+inttostr(t[i])+'  j='+inttostr(j)+'  maxI='+floattostr(max[i])+' minI='+floattostr(min[i])+'  timeI='+DateTimeToStr(Itime[i])+'  '+SStime+':'+IntToStr(sec));
 if j>0 then begin
   for ii:=1 to fk do begin
     Memo1.Lines.Add('f='+inttostr(ii)+' vf='+inttostr(vf[ii])+' sk='+inttostr(sk[ii])+' op='+inttostr(op[ii])+' li='+inttostr(li[ii])+' ly='+floattostr(ly[ii]));
     WriteLn(Hist,'f='+inttostr(ii)+' vf='+inttostr(vf[ii])+' sk='+inttostr(sk[ii])+' op='+inttostr(op[ii])+' li='+inttostr(li[ii])+' ly='+floattostr(ly[ii]));
     for nn:=1 to sk[ii] do begin
       DecodeTime(Itime[tsn[ii,nn]], Hour, Minn, Sec, MSec);  t1:=IntToStr(Hour)+':'+IntToStr(Minn);
       DecodeTime(Itime[tsl[ii,nn]], Hour, Minn, Sec, MSec);  t2:=IntToStr(Hour)+':'+IntToStr(Minn); DecodeTime(Itime[tsp[ii,nn]], Hour, Minn, Sec, MSec);  t3:=IntToStr(Hour)+':'+IntToStr(Minn);
       DecodeTime(Itime[tss[ii,nn]], Hour, Minn, Sec, MSec);  t4:=IntToStr(Hour)+':'+IntToStr(Minn); DecodeTime(Itime[tsk[ii,nn]], Hour, Minn, Sec, MSec);  t5:=IntToStr(Hour)+':'+IntToStr(Minn);
       Memo1.Lines.Add(' s='+inttostr(nn)+' tsn='+t1+'='+inttostr(t[tsn[ii,nn]])+'  tsl='+t2+'='+inttostr(t[tsl[ii,nn]])+'  tsp='+t3+'='+inttostr(t[tsp[ii,nn]])+'  tss='+t4+'='+inttostr(t[tss[ii,nn]])+'  tsk='+t5+'='+inttostr(t[tsk[ii,nn]])+'  tst='+t5+'='+inttostr(t[tst[ii,nn]])+' ks='+inttostr(ks[ii,nn])+' cp='+floattostr(cp[ii,nn])+' sm='+floattostr(sm[ii,nn]));    //
       WriteLn(Hist,' s='+inttostr(nn)+' tsn='+t1+'='+inttostr(t[tsn[ii,nn]])+'  tsl='+t2+'='+inttostr(t[tsl[ii,nn]])+'  tsp='+t3+'='+inttostr(t[tsp[ii,nn]])+'  tss='+t4+'='+inttostr(t[tss[ii,nn]])+'  tsk='+t5+'='+inttostr(t[tsk[ii,nn]])+'  tst='+t5+'='+inttostr(t[tst[ii,nn]])+' ks='+inttostr(ks[ii,nn])+' cp='+floattostr(cp[ii,nn])+' sm='+floattostr(sm[ii,nn]));  //
     end;
   end;
 end;
 Memo1.Lines.Add(' W='+IntToStr(w)+'  ZN='+IntToStr(zn)+'  ZP='+IntToStr(zp)+'  ZS='+IntToStr(zs)+'  F3='+IntToStr(f3)+'  F4='+IntToStr(f4)+'  Fp='+IntToStr(fp)+'  sp='+IntToStr(sp)+'  tpvn='+FloatToStr(tpvn)+'  tpvr='+FloatToStr(tpvr)+'  f5='+IntToStr(f5)+'  kop='+IntToStr(kop)+'  tfp='+IntToStr(tfp));
 Memo1.Lines.Add(' trv='+FloatToStr(trv)+'  tsv='+FloatToStr(tsv)+'  cop='+FloatToStr(cop)+'  b_p='+b_p+'  stus='+stus+'  cho='+chpad+'  Ord='+ordNo+'  rest='+rest+'  ctr='+FloatToStr(ctr)+'  ctn='+FloatToStr(ctn)+'  Tx='+FloatToStr(Tx)+'  tpt='+IntToStr(tpt)+'  srs='+FloatToStr(srs)+'  nv='+IntToStr(nv[y])+'  smv='+FloatToStr(smv[y])+'  nm='+IntToStr(nm[y])+'  smn='+FloatToStr(smn[y]));
 if Form1.Label24.Caption<>'' then Memo1.Lines.Add(Form1.Label24.Caption);
 Memo1.Lines.Add('');
 WriteLn(Hist,' W='+IntToStr(w)+'  ZN='+IntToStr(zn)+'  ZP='+IntToStr(zp)+'  ZS='+IntToStr(zs)+'  F3='+IntToStr(f3)+'  F4='+IntToStr(f4)+'  Fp='+IntToStr(fp)+'  sp='+IntToStr(sp)+'  tpvn='+FloatToStr(tpvn)+'  tpvr='+FloatToStr(tpvr)+'  f5='+IntToStr(f5)+'  kop='+IntToStr(kop)+'  tfp='+IntToStr(tfp));
 WriteLn(Hist,' trv='+FloatToStr(trv)+'  tsv='+FloatToStr(tsv)+'  cop='+FloatToStr(cop)+'  b_p='+b_p+'  stus='+stus+'  cho='+chpad+'  Ord='+ordNo+'  rest='+rest+'  ctr='+FloatToStr(ctr)+'  ctn='+FloatToStr(ctn)+'  Tx='+FloatToStr(Tx)+'  tpt='+IntToStr(tpt)+'  srs='+FloatToStr(srs)+'  nv='+IntToStr(nv[y])+'  smv='+FloatToStr(smv[y])+'  nm='+IntToStr(nm[y])+'  smn='+FloatToStr(smn[y]));
 WriteLn(Hist,'');
 CloseFile(Hist);
end;

/////////////ПРОГРАММА ОПРЕДЕЛЕНИЯ ЛИНИЙ//
procedure TForm1.LineMaker1;
Label perehod,konec;
begin
   j:=j+1; if j>=jsum then begin jsum:=jsum+10;SetLength(u,jsum); SetLength(tn,jsum); SetLength(tk,jsum); end;
{a}if (max[i-1]>max[i]) and (min[i-1]>min[i]) then begin tn[j]:=i-1; tk[j]:=i; u[j]:=false;
{b}end else if (max[i-1]>max[i]) and (min[i-1]=min[i]) then begin
     if u[j-1]=true then begin tn[j]:=i-1; tk[j]:=i; u[j]:=false;
     end else begin
       if ti=true then begin
         if tk[j-1]=i then begin j:=j-1; goto perehod; end
         else begin tn[j]:=i-1; tk[j]:=i; u[j]:=true; end;
       end else begin j:=j-1; MainSistemOfTS; Exit; end;
     end;
{c}end else if (max[i-1]<max[i]) and (min[i-1]<min[i]) then begin tn[j]:=i-1; tk[j]:=i; u[j]:=true;
{d}end else if (max[i-1]=max[i]) and (min[i-1]<min[i]) then begin
     if u[j-1]=false then begin tn[j]:=i-1; tk[j]:=i; u[j]:=true; end
     else begin
       if ti=true then begin
         if tk[j-1]=i then begin j:=j-1; goto perehod; end
         else begin tn[j]:=i-1; tk[j]:=i; u[j]:=false; end;
       end else begin j:=j-1; MainSistemOfTS; Exit; end;
     end;
{e}end else if (max[i-1]>max[i]) and (min[i-1]<min[i]) then begin
     if ti=true then begin
       if u[j-1]=true then begin u[j]:=false; tn[j]:=i-1; tk[j]:=i; end
       else begin u[j]:=true; tn[j]:=i-1; tk[j]:=i; end;
     end else begin j:=j-1; MainSistemOfTS; Exit; end;
{f}end else if (max[i-1]<=max[i]) and (min[i-1]>=min[i]) then begin
     if mxf=false then begin  //если f первый раз за текущую минуту
       if tk[j-1]=i then begin  // если в f перешли во время менуты из abcde
         tn[j]:=i; tk[j]:=i;
         if (mx=max[i]) and (mn>min[i]) then u[j]:=false  //если изм. мин
         else if (mx<max[i]) and (mn=min[i]) then u[j]:=true   //если изм макс
         else if (mx<max[i]) and (mn>min[i]) then begin
           f:=fk;
           while f>0 do begin
             if vf[f] in [1,3,8,9,13,99] then begin if max[i]<=max[tsn[f,sk[f]]] then break else f:=f-1;
             end else begin if min[i]>=min[tsn[f,sk[f]]] then break else f:=f-1; end;
           end;
           if (f>0) and (vf[f] in [2,4,7,10,14,98]) then u[j]:=false else u[j]:=true;
         end else MessageDlg('В переходе из abcde в f не выбрало ни 1 пути',mtWarning,[mbOK],0);
       end else begin  //tk[j-1]<>i - f первый раз в этой минуте
         fe:=true; tn[j]:=i-1; tk[j]:=i; f:=fk;
         while f>0 do begin
           if vf[f] in [1,3,8,9,13,99] then begin if max[i]<=max[tsn[f,sk[f]]] then break else f:=f-1;
           end else begin if min[i]>=min[tsn[f,sk[f]]] then break else f:=f-1; end;
         end;
         if (f>0) and (vf[f] in [2,4,7,10,14,98]) then u[j]:=false else u[j]:=true;
       end;
     end else begin //mxf<>0 т. е. в этой минуте было f
       if (mx<max[i]) and (mn>min[i]) then begin  //если изм сразу макс и мин
         fe:=true; f:=fk;
         while f>0 do begin
           if vf[f] in [1,3,8,9,13,99] then begin if max[i]<=max[tsn[f,sk[f]]] then break else f:=f-1;
           end else begin if min[i]>=min[tsn[f,sk[f]]] then break else f:=f-1; end;
         end;
         sum:=sum+1; SetLength(max, sum); SetLength(min, sum); SetLength(t, sum); SetLength(Itime,sum);
         if (f>0) and (vf[f] in [2,4,7,10,14,98]) then begin
           i:=i+1; t[i]:=t[i-1]; max[i]:=max[i-1]; min[i]:=mn; max[i-1]:=mx; min[i-1]:=mn;
           u[j]:=false; tn[j]:=i; tk[j]:=i;
         end else begin
           i:=i+1; t[i]:=t[i-1]; max[i]:=mx; min[i]:=min[i-1]; max[i-1]:=mx; min[i-1]:=mn;
           u[j]:=true; tn[j]:=i-1; tk[j]:=i;
         end;
       end else begin //если измен только макс или только мин
         if (mx<max[i]) and (mn=min[i]) then u[j]:=true
         else if (mx=max[i]) and (mn>min[i]) then u[j]:=false
         else begin j:=j-1; ShowFigure; Exit; end; //MessageDlg('Ошибка в переходе из f в f не выбран ни 1 из вариантов'+inttostr(i),mtWarning,[mbOK],0);
         i:=i+1; sum:=sum+1; SetLength(max, sum); SetLength(min, sum); SetLength(t, sum); SetLength(Itime,sum);
         t[i]:=t[i-1]; max[i]:=max[i-1]; min[i]:=min[i-1]; max[i-1]:=mx; min[i-1]:=mn;
         tn[j]:=i-1; tk[j]:=i;
       end;
     end; //конец инструкций при mfx:=0
   end else MessageDlg('Ошибка FFFFUUUUU'+inttostr(i),mtWarning,[mbOK],0);//конец f
   //if j=1 then Ad_little_lines.Insert else
   if j>1 then begin       //если линий больше 1х
    if u[j-1]=u[j] then begin  //сравниваем в одну ли сторону направленны линии
     j:=j-1; tk[j]:=i;//если да, то объеденяем их
    // Ad_little_lines.Edit;   //запись инф о линии в БД
    end;// else Ad_little_lines.Append;
   end; //конец объединения линий
  { Ad_little_lines.FieldByName('Namber_line').AsInteger:=j;    ///ЗАПИСЬ ЛИНИЙ В БД
   Ad_little_lines.FieldByName('f_line').AsBoolean:=u[j];
   Ad_little_lines.FieldByName('tn').AsInteger:=tn[j];
   Ad_little_lines.FieldByName('tk').AsInteger:=tk[j];
   Ad_little_lines.Post;  }
   if j>1 then begin
     if u[j]=true then FigureMaker1 else FigureMaker2; // ФИГУРЫ!!!!!!!!!!!
     MainSistemOfTS; //СХЕМА ПРИНЯТИЯ РЕШЕНИЙ
     ShowFigure;
   end;
   if ((max[i-1]>max[i]) and (min[i-1]=min[i])) or ((max[i-1]=max[i]) and (min[i-1]<min[i]))  //начало обр 2й линии
   or ((max[i-1]>max[i]) and (min[i-1]<min[i])) then begin {b}{d}{e}//_________
{bde}if ti=true then begin
       perehod:
       j:=j+1; if j>=jsum then begin jsum:=jsum+10; SetLength(u,jsum); SetLength(tn,jsum); SetLength(tk,jsum); end;
       if u[j-1]=true then u[j]:=false else u[j]:=true;
       tn[j]:=i; tk[j]:=i;
      {Ad_little_lines.Append;   //запись инф о линии в БД
       Ad_little_lines.FieldByName('Namber_line').AsInteger:=j;   ///ЗАПИСЬ ЛИНИЙ В БД
       Ad_little_lines.FieldByName('f_line').AsBoolean:=u[j];
       Ad_little_lines.FieldByName('tn').AsInteger:=tn[j];
       Ad_little_lines.FieldByName('tk').AsInteger:=tk[j];
       Ad_little_lines.Post;  }
       if u[j]=true then FigureMaker1 else FigureMaker2;// ФИГУРЫ!!!!!!!!!!!
       if j>1 then MainSistemOfTS; //СХЕМА ПРИНЯТИЯ РЕШЕНИЙ
       ShowFigure;
     end; 
     //конец обр 2й л. при bde  // конец {b}{d}{e}
{f}end else if (max[i-1]<=max[i]) and (min[i-1]>=min[i]) then begin
     j:=j+1; if j>=jsum then begin jsum:=jsum+10;SetLength(u,jsum); SetLength(tn,jsum); SetLength(tk,jsum); end;
     if mxf=false then begin
       if fe=false then begin
         if (mx<max[i]) and (mn>min[i]) then begin
           if u[j-1]=true then begin
             if tn[j-1]=i then begin
               i:=i+1; sum:=sum+1; SetLength(max, sum); SetLength(min, sum); SetLength(t, sum); SetLength(Itime,sum);
               t[i]:=t[i-1]; max[i]:=max[i-1]; min[i]:=min[i-1]; min[i-1]:=mn;
             end; u[j]:=false; tn[j]:=i; tk[j]:=i;
           end else begin //если u(j-1)<>true
             if tn[j-1]=i then begin
               i:=i+1; sum:=sum+1; SetLength(max, sum); SetLength(min, sum); SetLength(t, sum); SetLength(Itime,sum);
               t[i]:=t[i-1]; max[i]:=max[i-1]; min[i]:=min[i-1]; max[i-1]:=mx;
             end; u[j]:=true; tn[j]:=i; tk[j]:=i;
           end; //конец проверки u(j-1)=true
         end else begin j:=j-1; mxf:=true; fe:=false; goto konec; end; //если не (mx<max[i]) and (mn>min[i])
       end else begin //если tk[j-1]<>i
         if u[j-1]=true then u[j]:=false else u[j]:=true;
         tn[j]:=i; tk[j]:=i;
       end;
     end else begin   //если mxf<>false
       if fe=true then begin
         i:=i+1; sum:=sum+1; SetLength(max, sum); SetLength(min, sum); SetLength(t, sum); SetLength(Itime,sum);
         t[i]:=t[i-1]; max[i]:=max[i-1]; min[i]:=min[i-1]; max[i-1]:=mx; min[i-1]:=mn;
         if u[j-1]=true then u[j]:=false else u[j]:=true;
         tn[j]:=i; tk[j]:=i;
       end else begin j:=j-1; mxf:=true; fe:=false; goto konec; end; //если не fe=true
     end; //конец проверки mxf
     mxf:=true; fe:=false;
    { Ad_little_lines.Append;   //запись инф о линии в БД
     Ad_little_lines.FieldByName('Namber_line').AsInteger:=j;     ///ЗАПИСЬ ЛИНИЙ В БД
     Ad_little_lines.FieldByName('f_line').AsBoolean:=u[j];
     Ad_little_lines.FieldByName('tn').AsInteger:=tn[j];
     Ad_little_lines.FieldByName('tk').AsInteger:=tk[j];
     Ad_little_lines.Post; }
     if u[j]=true then FigureMaker1 else FigureMaker2;// ФИГУРЫ!!!!!!!!!!!
     if j>1 then MainSistemOfTS; //СХЕМА ПРИНЯТИЯ РЕШЕНИЙ
     ShowFigure;
   end; //конец f }
   konec:
end;

///---------/////////--СТАТИКА--////----------------------
procedure TForm1.Button1Click(Sender: TObject);
var ii,iis:integer;
    s1: String;
begin
 y:=-1; srs:=0; SetLength(smv,50); SetLength(smn,50); SetLength(nv,50); SetLength(nm,50);
 Rewrite(Hist); U1LoadFromIniFile;
 ADOQuery1.Open; sum:=ADOQuery1.RecordCount;
 if fk>0 then begin
   DecodeTime(Itime[i], Hour, Minn, Sec, MSec);
   sstime:=DateTimeToStr(Itime[i]-StrToTime('00:00:'+IntToStr(Sec)));
   ADOQuery1.Locate('time',sstime,[]);  sstime:='';
   SetLength(max, sum); SetLength(min, sum); SetLength(t, sum); SetLength(Itime, sum);
 end else begin
   i:=0; j:=0;
   SetLength(max, sum); SetLength(min, sum); SetLength(t, sum); SetLength(Itime, sum);
   max[i]:=ADOQuery1.FieldValues['high']; min[i]:=ADOQuery1.FieldValues['low']; Itime[i]:=ADOQuery1.FieldValues['time'];
   t[i]:=i;
 end;
 ti:=true; if sum>3 then begin jsum:=sum; SetLength(u,jsum); SetLength(tn,jsum); SetLength(tk,jsum); end;
 sc:=AD.GetLocalDBData('all_trades', 'ts_time', 'paper_no=79633');                                                 // ЗАМЕНА !!!!!
 if sc='' then iis:=sum-1 else iis:=sum-2;
 if ADOQuery1.RecNo<=iis then begin
   if w=0 then begin tpvn:=0; f3:=0; tpvr:=0; f4:=0; end else vkl:=true;
   for ii:=ADOQuery1.RecNo to iis do begin     //!!!!!!!@@@@@@@@@@@@@  iis
     if Memo1.Lines.Count>8000 then begin Memo1.SelStart:=0; Memo1.SelLength:=250000; Memo1.ClearSelection; end;
     mx:=max[i]; mn:=min[i]; i:=i+1; 
     if i>=sum then begin sum:=sum+1; SetLength(max, sum); SetLength(min, sum); SetLength(t, sum); SetLength(Itime,sum); end;
     t[i]:=t[i-1]+1;  mxf:=false;
     if ii=iis then vkl:=true;
     ADOQuery1.Next; max[i]:=ADOQuery1.FieldValues['high'];     min[i]:=ADOQuery1.FieldValues['low'];   Itime[i]:=ADOQuery1.FieldValues['time'];
     SredneeSvechek;
     LineMaker1;
   end;
 end;
 mx:=max[i]; mn:=min[i];
 U1SaveToIniFile;
 if (sc<>'') and (AD.Connected=true) then begin
   i:=i+1; t[i]:=t[i-1]+1; mxf:=false; ti:=false;
   ADOQuery1.Next; max[i]:=ADOQuery1.FieldValues['high']; min[i]:=ADOQuery1.FieldValues['low']; Itime[i]:=ADOQuery1.FieldValues['time'];
   s1:=DateTimeToStr(Itime[i]);
   ADt:=AD.SessionTime;  DecodeTime(ADt, Hour, Minn, Sec, MSec);
   SStime:=DateTimeToStr(ADt+StrToTime('00:01:00')-StrToTime('00:00:'+IntToStr(Sec)));
   if s1<>SStime then begin  //
     ti:=true;
     SredneeSvechek; LineMaker1; mx:=max[i]; mn:=min[i];
     i:=i+1; sum:=sum+1; SetLength(max,sum); SetLength(min,sum); SetLength(t,sum); SetLength(Itime,sum);
     t[i]:=t[i-1]+1; mxf:=false; ti:=false;
     ADOQuery1.Close; ADOQuery1.SQL.Clear; ii:=0;
     while ii<30 do begin sleep(100); Application.ProcessMessages; inc(ii); end; // 100 раз по 100 мс = 10 сек.
     ADOQuery1.SQL.Add('SELECT high,low,paper_no,time FROM arch_min1 WHERE time=:time and paper_no=:paper');
     ADOQuery1.Parameters.ParamByName('time').Value:=SStime; ADOQuery1.Parameters.ParamByName('paper').Value:=paperNo;
     ADOQuery1.Open;
     max[i]:=ADOQuery1.FieldValues['high']; min[i]:=ADOQuery1.FieldValues['low']; Itime[i]:=ADOQuery1.FieldValues['time'];
   end;//}
   trm:=Copy(sc,Length(sc)-10,5); trsi:=sec;
 end else begin trm:='0'; ti:=true; end; //}
 pkl:=false; vkl:=true;  //вкл схемы W
 if timer1.Enabled=true then timer1.Enabled:=false else timer1.Enabled:=true; // }
 Edit1.Text:=IntToStr(i)+'__'+IntToStr(j);  Edit2.Text:=DateTimeToStr(Itime[i]);
 Edit3.Text:=floattostr(max[i])+'___'+floattostr(min[i]); Edit4.Text:=floattostr(max[i-1])+'__'+floattostr(min[i-1]);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 mx:=max[i]; mn:=min[i]; i:=i+1; t[i]:=t[i-1]+1;  mxf:=false;
 ADOQuery1.Next;
 max[i]:=ADOQuery1.FieldValues['high'];     min[i]:=ADOQuery1.FieldValues['low'];     Itime[i]:=ADOQuery1.FieldValues['time'];
 LineMaker1; //процедура образования линий
 //AssignFile(Nfile, 'parametrs.txt'); Rewrite(Nfile); Write(Nfile,IntToStr(zn)); CloseFile(Nfile);
 iniTS:=TIniFile.Create(extractfilepath(Application.ExeName)+'IniTs.ini'); iniTs.WriteInteger('OOO','zn',zn); inits.Free;
 edit1.Text:=IntToStr(i)+'__'+IntToStr(sum);  edit2.Text:=floattostr(max[i])+'___'+floattostr(min[i]);
 ZNEdit.Text:=IntToStr(zn); TpvnEdit.Text:=FloatToStr(tpvn); TpvrEdit.Text:=FloatToStr(tpvr); TrvEdit.Text:=FloatToStr(trv); TsvEdit.Text:=FloatToStr(tsv);
end;
procedure TForm1.Button3Click(Sender: TObject);
begin
 chpad:=EditCho.Text; stus:=EditStus.Text; b_p:=EditBp.Text; //OFFLINE TEST
end;

///////////Блок тревога////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.Alarm;
begin
  if AA=120 then begin ShellExecute(Handle,'open','C:\Sergey\AD\Program_NV4\Alarm.mp3',nil,nil,SW_RESTORE); Button6.Caption:='Connection lost'; end;
  if BB=1 then begin BB:=0; ShellExecute(Handle,'open','C:\Sergey\AD\Program_NV4\Alarm.mp3',nil,nil,SW_RESTORE); Button6.Caption:='order lost'; end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Button6.Caption:='Alarm';
  AA:=0; BB:=0;
end;
//////////Условия для параметров////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.Parametrs;
begin
   //if max[i]=10000 then begin frv:=10; EditFrv.Text:=IntToStr(frv); Xxx:=0; EditXxx.Text:=IntToStr(Xxx); end;
   if min[i]<1000 then begin frn:=8; EditFrn.Text:=IntToStr(frn); Xxx:=0; EditXxx.Text:=IntToStr(Xxx); end;
end;

////////////////////////////////////////////////////////////////////
//--------------------TIMER (ДИНАМИКА)----------------------!!!!!!!!!!!!!!!!
procedure TForm1.Timer1Timer(Sender: TObject);
Var s: Widestring;
    sminn: String;
begin
 ADt:=AD.SessionTime; DecodeTime(ADt, Hour, Minn, Sec, MSec); //DecodeDate(ADt,mYear,mMonth,mDay);
 if Memo1.Lines.Count>8000 then begin Memo1.SelStart:=0; Memo1.SelLength:=250000; Memo1.ClearSelection; end;
 sc:=AD.GetLocalDBData('all_trades', 'ts_time', 'paper_no=79633');                                         // ЗАМЕНА !!!!!
 if (sc<>'') and (Length(sc)>100) and (AD.Connected=true) and (BB=0) then begin
   sstime:=Copy(sc,Length(sc)-10,5);
   s:=AD.GetLocalDBData('all_trades', 'price', 'paper_no=79633 and ts_time like "'+SStime+'"');            // ЗАМЕНА !!!!!
   if ti=true then begin
     if sstime<>trm then begin
       i:=i+1; if i>=sum then begin sum:=sum+10; SetLength(max,sum); SetLength(min,sum); SetLength(t,sum); SetLength(Itime,sum); end;
       max[i]:=0; min[i]:=99999999;  t[i]:=t[i-1]+1; mxf:=false;
       FindMaxMinForDinamic(s);  Itime[i]:=ADt+StrToTime('00:01:00');
       SredneeSvechek; ti:=false;
       LineMaker1; mx:=max[i]; mn:=min[i];
       trm:=Copy(sc,Length(sc)-10,5); trs:=Copy(sc,Length(sc)-4,2);  trsi:=StrToInt(trs)+0.2;
     end;
   end else begin
     if (trsi<65) and (sstime=trm) then begin
       trsi:=trsi+0.2;
       FindMaxMinForDinamic(s);  Itime[i]:=ADt+StrToTime('00:01:00');
       SredneeSvechek;
       if (mx<>max[i]) or (mn<>min[i]) then LineMaker1;
     end else begin
       sminn:=IntToStr(Hour)+':'+IntToStr(Minn);
       if trm=sminn then Itime[i]:=ADt+StrToTime('00:01:00')-StrToTime('00:00:'+IntToStr(Sec)) else Itime[i]:=ADt-StrToTime('00:00:'+IntToStr(Sec));
       sminn:=Copy(sc,Length(sc)-7,2); Minn:=StrToInt(sminn);
       if trm<>sstime then begin if Minn=0 then begin Hour:=Hour-1; Minn:=59; end else Minn:=Minn-1; end;
       if Minn<10 then sminn:='0'+IntToStr(Minn) else sminn:=IntToStr(Minn);
       SStime:=IntToStr(Hour)+':'+sminn+':5';
       s:=AD.GetLocalDBData('all_trades', 'price', 'paper_no=79633 and ts_time like "'+SStime+'"');    // ЗАМЕНА !!!!!  // в Tform, объект "ADO ?", свойство SQL (TStrings)
       FindMaxMinForDinamic(s); SredneeSvechek;
       ti:=true; LineMaker1;
       if SaveButton.Caption='WAIT PLZ' then begin U1SaveToIniFile; SaveButton.Caption:='SaveComplete'; end;
     end;
     mx:=max[i]; mn:=min[i];
   end;
 end else begin
   if AD.Connected=false then AA:=AA+1;
   if (AD.Connected=true) and (AA<120) then AA:=0;
   if (AA=120) or (BB>0) then Alarm;
 end;
 if (sec>0) and (mx=max[i]) and (mn=min[i]) and ((step1>0) or (step2>0) or (step3>0) or (step6>0)) then GoToStar;
 //zn2:=StrToInt(szn);
 if zn>zn2 then begin
   iniTS:=TIniFile.Create(extractfilepath(Application.ExeName)+'IniTs.ini'); iniTs.WriteInteger('OOO','zn',zn); inits.Free;
   //AssignFile(Nfile, 'parametrs.txt'); Rewrite(Nfile); Write(Nfile,IntToStr(zn)); CloseFile(Nfile); szn:=IntToStr(zn);
   zn2:=zn;
 end;
 //Itime[i]:=StrToDateTime(IntToStr(mDay)+'.'+IntToStr(mMonth)+'.'+IntToStr(mYear)+' '+IntToStr(Hour)+':'+IntToStr(Minn)+':00');
 edit1.Text:=IntToStr(i)+'__'+IntToStr(j);
 edit2.Text:=floattostr(max[i])+'__'+floattostr(min[i]);
 edit3.Text:=floattostr(max[i-1])+'__'+floattostr(min[i-1]);
 Edit4.Text:=sstime+'  '+IntTOStr(sec)+'  '+FloatToStr(trsi);
 ZNEdit.Text:=IntToStr(zn); TpvnEdit.Text:=FloatToStr(tpvn); TpvrEdit.Text:=FloatToStr(tpvr); TrvEdit.Text:=FloatToStr(trv); TsvEdit.Text:=FloatToStr(tsv); EditCho.Text:=IntToStr(cho);
 EditCho.Text:=IntToStr(cho); EditStus.Text:=stus; EditBp.Text:=b_p;
 if Xxx>0 then Parametrs;
end;

////определение макс и мин из таблицы сделки
procedure TForm1.FindMaxMinForDinamic(s:WideString);
var ii:integer;
    ss:WideString;
    //price:Real;
begin
 ss:='';
 if Length(s)>1 then begin
   for ii:=1 to Length(s) do begin
     case s[ii] of
       '0','1','2','3','4','5','6','7','8','9',',': ss:=ss+s[ii];
       '|': begin  price:=strtofloat(ss); ss:='';
          if price>max[i] then max[i]:=price; if price<min[i] then min[i]:=price;
       end;
     end;
   end;
 end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if timer1.Enabled=true then timer1.Enabled:=false else timer1.Enabled:=true;  //вкл/выкл таймера
end;

procedure TForm1.SredneeSvechek;
Var ii: Integer;
begin
 if ti=true then begin
   if y>=Length(smv)-1 then begin
     for ii:=0 to 48 do begin smv[ii]:=smv[ii+1]; smn[ii]:=smn[ii+1]; nv[ii]:=nv[ii+1]; nm[ii]:=nm[ii+1]; end;
     y:=y-1;
   end;
   y:=y+1; n1:=0; srs:=0; smv[y]:=0; smn[y]:=0; nv[y]:=0; nm[y]:=0;
 end;
 if (y=0) or (ti=true) or ((mx<>max[i]) and (mn<>min[i])) or ((mx<>max[i]) and (mn=min[i]) and (min[i]=price))
 or ((mx=max[i]) and (mn<>min[i]) and (max[i]=price)) then begin
   smv[y]:=smv[y]+max[i]+min[i]; smn[y]:=smn[y]+max[i]+min[i]; nv[y]:=nv[y]+2; nm[y]:=nm[y]+2;
 end else if (mx<max[i]) or ((mx=max[i]) and (mx=price)) then begin
   if ((max[i-1]>max[i]) and (min[i-1]>min[i])) or ((max[i-1]<=max[i]) and (min[i-1]>=min[i])) then begin
     smv[y]:=smv[y]+max[i]; nv[y]:=nv[y]+1; n1:=smv[y];
   end else begin smv[y]:=smv[y]+smn[y]+max[i]; nv[y]:=nv[y]+nm[y]+1; smn[y]:=max[i]; nm[y]:=1; n1:=smv[y]; end;
 end else if (mn>min[i]) or ((mn=min[i]) and (mn=price)) then begin
   if ((max[i-1]<max[i]) and (min[i-1]<min[i])) or ((max[i-1]<=max[i]) and (min[i-1]>=min[i])) then begin
     smn[y]:=smn[y]+min[i]; nm[y]:=nm[y]+1; n1:=smn[y];
   end else begin smn[y]:=smn[y]+smv[y]+min[i]; nm[y]:=nm[y]+nv[y]+1; smv[y]:=min[i]; nv[y]:=1; n1:=smn[y]; end;
 end else if n1=smn[y] then begin
   if (max[i-1]<max[i]) and (min[i-1]<min[i]) then begin smn[y]:=smn[y]+price; nm[y]:=nm[y]+1; n1:=smn[y];
   end else begin smv[y]:=smv[y]+price; nv[y]:=nv[y]+1; end;
 end else if n1=smv[y] then begin
   if (max[i-1]>max[i]) and (min[i-1]>min[i]) then begin smv[y]:=smv[y]+price; nv[y]:=nv[y]+1; n1:=smv[y];
   end else begin smn[y]:=smn[y]+price; nm[y]:=nm[y]+1; end;
 end else begin smv[y]:=smv[y]+max[i]+min[i]; smn[y]:=smn[y]+max[i]+min[i]; nv[y]:=nv[y]+2; nm[y]:=nm[y]+2; end;
end;

procedure TForm1.SaveButtonClick(Sender: TObject);
begin
 if SaveButton.Caption='SaveButton'then SaveButton.Caption:='WAIT PLZ';
 if SaveButton.Caption='SaveComplete' then begin SaveButton.Caption:='SaveButton'; CheckBox1.Checked:=false; end;
 if CheckBox1.Checked=true then begin U1SaveToIniFile; SaveButton.Caption:='SaveComplete'; end;
end;


end.

















