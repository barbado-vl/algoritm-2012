unit ADLite_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 26.12.2014 13:53:29 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files (x86)\AlfaDirect\ADirect.exe (1)
// LIBID: {5D5ED85D-36C7-43A1-B349-78E115607574}
// LCID: 0
// Helpfile: 
// HelpString: Alfa Direct Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ADLiteMajorVersion = 1;
  ADLiteMinorVersion = 0;

  LIBID_ADLite: TGUID = '{5D5ED85D-36C7-43A1-B349-78E115607574}';

  IID_IAlfaDirect: TGUID = '{D92B219D-6A18-44D6-8D96-58CAA1FB9701}';
  DIID_IAlfaDirectEvents: TGUID = '{E3E3D289-6675-4C9B-8B2C-34DEC46B05AE}';
  CLASS_AlfaDirect: TGUID = '{A0AD8986-E9EF-4340-B0AB-062D7A2966F5}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum tagStateCodes
type
  tagStateCodes = TOleEnum;
const
  stcSuccess = $00000000;
  stcCriticalClientError = $00000001;
  stcClientError = $00000002;
  stcNotConnected = $00000003;
  stcServerError = $00000004;
  stcTimeout = $00000005;
  stcWarning = $00000006;

// Constants for enum eConnectionState
type
  eConnectionState = TOleEnum;
const
  Connected = $00000000;
  Disconnected = $00000001;

// Constants for enum eSubsctibeOptions
type
  eSubsctibeOptions = TOleEnum;
const
  Default = $00000000;
  UpdatesOnly = $00000001;
  ForInternalUse = $00000002;

// Constants for enum eCommandResult
type
  eCommandResult = TOleEnum;
const
  crSuccess = $00000000;
  crError = $00000001;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IAlfaDirect = interface;
  IAlfaDirectDisp = dispinterface;
  IAlfaDirectEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  AlfaDirect = IAlfaDirect;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//

  StateCodes = tagStateCodes; 

// *********************************************************************//
// Interface: IAlfaDirect
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D92B219D-6A18-44D6-8D96-58CAA1FB9701}
// *********************************************************************//
  IAlfaDirect = interface(IDispatch)
    ['{D92B219D-6A18-44D6-8D96-58CAA1FB9701}']
    procedure Set_GlobalFilter(const Name: WideString; const Value: WideString); safecall;
    function Get_GlobalFilter(const Name: WideString): WideString; safecall;
    function Get_Version: OleVariant; safecall;
    function Get_LastResult: StateCodes; safecall;
    function Get_LastResultMsg: WideString; safecall;
    function Get_UserName: WideString; safecall;
    procedure Set_UserName(const Value: WideString); safecall;
    procedure Set_Password(const Param1: WideString); safecall;
    function Get_Connected: WordBool; safecall;
    procedure Set_Connected(Value: WordBool); safecall;
    procedure GetDBData(const TableName: WideString; const FieldNames: WideString; 
                        const Where: WideString; out Data: OleVariant; out FieldTypes: OleVariant); safecall;
    function GetArchiveFinInfo(const PlaceCode: WideString; const PCode: WideString; 
                               Period: Integer; DateFrom: TDateTime; DateTo: TDateTime; 
                               Mode: Integer; Timeout: Integer): OleVariant; safecall;
    function GetUpdatedTables: WideString; safecall;
    function GetOrderLimit(const Account: WideString; const PlaceCode: WideString; 
                           const PCode: WideString; const Currency: WideString; Price: Double; 
                           const BuySell: WideString; Timeout: Integer): Integer; safecall;
    procedure DepoReserve(const FromAccount: WideString; const FromPlaceCode: WideString; 
                          const ToAccount: WideString; const ToPlaceCode: WideString; 
                          const ToDepoAccount: WideString; const ToDepositary: WideString; 
                          const ToDepoPart: WideString; const PCode: WideString; Quantity: Integer; 
                          Nominal: Double; const Comment: WideString); safecall;
    procedure DepoOrder(const Direction: WideString; const Account: WideString; 
                        const PlaceCode: WideString; const PCode: WideString; 
                        const Currency: WideString; Quantity: Integer; Nominal: Double; 
                        Volume: Double; const Contragent: WideString; 
                        const ContragentDetailes: WideString; const ContragentStatus: WideString; 
                        const ContragentAccount: WideString; const Reason: WideString; 
                        const Comment: WideString); safecall;
    procedure MoneyReserve(const Currency: WideString; const FromAccount: WideString; 
                           const FromPlaceCode: WideString; const ToAccount: WideString; 
                           const ToPlaceCode: WideString; Volume: Double; const Comment: WideString); safecall;
    procedure SetRepo(const Account: WideString; const PlaceCode: WideString; 
                      const PCode: WideString; const BuySell: WideString; Price: Double; 
                      Quantity: Integer; SetDate: TDateTime; Timeout: Integer); safecall;
    procedure MoneyRecall(const Currency: WideString; const Account: WideString; 
                          const PlaceCode: WideString; const CardNo: WideString; 
                          const AccountNo: WideString; const Branch: WideString; 
                          const Bic: WideString; const Bank: WideString; 
                          const CorrAccount: WideString; const CorrPlace: WideString; 
                          const Properties: WideString; Volume: Double; const Comment: WideString); safecall;
    function CreateLimitOrder(const Account: WideString; const PlaceCode: WideString; 
                              const PCode: WideString; EndDate: TDateTime; 
                              const Comments: WideString; const Currency: WideString; 
                              const BuySell: WideString; Quantity: Integer; Price: Double; 
                              ActivateIfPriceHasGrow: OleVariant; 
                              ActivateIfPriceHasFall: OleVariant; ActivateIfOrderExec: OleVariant; 
                              ActivateIfOrderCancel: OleVariant; ActivateIfDateReached: OleVariant; 
                              CheckLimitsOnActivate: OleVariant; ChangeTo: OleVariant; 
                              ChangeIfPriceHasGrow: OleVariant; ChangeIfPriceHasFall: OleVariant; 
                              ChangeIfOrderExec: OleVariant; ChangeIfOrderCancel: OleVariant; 
                              ChangeIfDateReached: OleVariant; DeleteIfPriceHasGrow: OleVariant; 
                              DeleteIfPriceHasFall: OleVariant; DeleteIfOrderExec: OleVariant; 
                              DeleteIfOrderCancel: OleVariant; Timeout: Integer): Integer; safecall;
    function UpdateLimitOrder(OrderNo: Integer; NewPrice: OleVariant; NewQuantity: OleVariant; 
                              NewEndDate: OleVariant; Timeout: Integer): Integer; safecall;
    function CreateStopOrder(const Account: WideString; const PlaceCode: WideString; 
                             const PCode: WideString; EndDate: TDateTime; 
                             const Comments: WideString; const Currency: WideString; 
                             const BuySell: WideString; Quantity: Integer; StopPrice: Double; 
                             Slippage: Double; TakeProfit: OleVariant; Timeout: Integer): Integer; safecall;
    function UpdateStopOrder(OrderNo: Integer; NewStopPrice: OleVariant; NewSlippage: OleVariant; 
                             NewTakeProfit: OleVariant; NewQuantity: OleVariant; 
                             NewEndDate: OleVariant; Timeout: Integer): Integer; safecall;
    function CreateTrailingOrder(const Account: WideString; const PlaceCode: WideString; 
                                 const PCode: WideString; EndDate: TDateTime; 
                                 const Comments: WideString; const Currency: WideString; 
                                 const BuySell: WideString; Quantity: Integer; StartPrice: Double; 
                                 Level: Double; Slippage: Double; Timeout: Integer): Integer; safecall;
    function UpdateTrailingOrder(OrderNo: Integer; NewLevel: OleVariant; NewSlippage: OleVariant; 
                                 NewQuantity: OleVariant; NewEndDate: OleVariant; Timeout: Integer): Integer; safecall;
    function CreateAddressOrder(const Account: WideString; const PlaceCode: WideString; 
                                const PCode: WideString; EndDate: TDateTime; 
                                const Comments: WideString; const Currency: WideString; 
                                const BuySell: WideString; Quantity: Integer; Price: Double; 
                                const Contragent: WideString; Timeout: Integer): Integer; safecall;
    function UpdateAddressOrder(OrderNo: Integer; NewPrice: OleVariant; NewQuantity: OleVariant; 
                                NewEndDate: OleVariant; NewContragent: OleVariant; Timeout: Integer): Integer; safecall;
    function CreateAuctionOrder(const Account: WideString; const PlaceCode: WideString; 
                                const PCode: WideString; EndDate: TDateTime; 
                                const Comments: WideString; const Currency: WideString; 
                                const BuySell: WideString; Quantity: Integer; Price: Double; 
                                Rate: Double; Contragent: OleVariant; Timeout: Integer): Integer; safecall;
    function UpdateAuctionOrder(OrderNo: Integer; NewPrice: OleVariant; NewQuantity: OleVariant; 
                                NewEndDate: OleVariant; NewContragent: OleVariant; 
                                NewRate: OleVariant; Timeout: Integer): Integer; safecall;
    procedure DropOrder(OrderNo: OleVariant; BuySell: OleVariant; Treaty: OleVariant; 
                        Account: OleVariant; PlaceCode: OleVariant; PCode: OleVariant; 
                        Timeout: Integer); safecall;
    function Get_SessionTime: TDateTime; safecall;
    function GetArchiveFinInfoFromDB(const PlaceCode: WideString; const PCode: WideString; 
                                     Period: Integer; DateFrom: OleVariant; DateTo: OleVariant): WideString; safecall;
    function GetLocalDBData(const TableName: WideString; const FieldNames: WideString; 
                            const Where: WideString): WideString; safecall;
    function GetLocalDBStruct(const TableName: WideString): WideString; safecall;
    function SubscribeTable(const TableName: WideString; const FieldNames: WideString; 
                            const Where: WideString; Options: eSubsctibeOptions; 
                            out Message: WideString): tagStateCodes; safecall;
    function UnSubscribeTable(const TableName: WideString; const Where: WideString; 
                              out Message: WideString): tagStateCodes; safecall;
    property GlobalFilter[const Name: WideString]: WideString read Get_GlobalFilter write Set_GlobalFilter;
    property Version: OleVariant read Get_Version;
    property LastResult: StateCodes read Get_LastResult;
    property LastResultMsg: WideString read Get_LastResultMsg;
    property UserName: WideString read Get_UserName write Set_UserName;
    property Password: WideString write Set_Password;
    property Connected: WordBool read Get_Connected write Set_Connected;
    property SessionTime: TDateTime read Get_SessionTime;
  end;

// *********************************************************************//
// DispIntf:  IAlfaDirectDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D92B219D-6A18-44D6-8D96-58CAA1FB9701}
// *********************************************************************//
  IAlfaDirectDisp = dispinterface
    ['{D92B219D-6A18-44D6-8D96-58CAA1FB9701}']
    property GlobalFilter[const Name: WideString]: WideString dispid 207;
    property Version: OleVariant readonly dispid 203;
    property LastResult: StateCodes readonly dispid 101;
    property LastResultMsg: WideString readonly dispid 102;
    property UserName: WideString dispid 204;
    property Password: WideString writeonly dispid 205;
    property Connected: WordBool dispid 206;
    procedure GetDBData(const TableName: WideString; const FieldNames: WideString; 
                        const Where: WideString; out Data: OleVariant; out FieldTypes: OleVariant); dispid 301;
    function GetArchiveFinInfo(const PlaceCode: WideString; const PCode: WideString; 
                               Period: Integer; DateFrom: TDateTime; DateTo: TDateTime; 
                               Mode: Integer; Timeout: Integer): OleVariant; dispid 321;
    function GetUpdatedTables: WideString; dispid 303;
    function GetOrderLimit(const Account: WideString; const PlaceCode: WideString; 
                           const PCode: WideString; const Currency: WideString; Price: Double; 
                           const BuySell: WideString; Timeout: Integer): Integer; dispid 322;
    procedure DepoReserve(const FromAccount: WideString; const FromPlaceCode: WideString; 
                          const ToAccount: WideString; const ToPlaceCode: WideString; 
                          const ToDepoAccount: WideString; const ToDepositary: WideString; 
                          const ToDepoPart: WideString; const PCode: WideString; Quantity: Integer; 
                          Nominal: Double; const Comment: WideString); dispid 323;
    procedure DepoOrder(const Direction: WideString; const Account: WideString; 
                        const PlaceCode: WideString; const PCode: WideString; 
                        const Currency: WideString; Quantity: Integer; Nominal: Double; 
                        Volume: Double; const Contragent: WideString; 
                        const ContragentDetailes: WideString; const ContragentStatus: WideString; 
                        const ContragentAccount: WideString; const Reason: WideString; 
                        const Comment: WideString); dispid 306;
    procedure MoneyReserve(const Currency: WideString; const FromAccount: WideString; 
                           const FromPlaceCode: WideString; const ToAccount: WideString; 
                           const ToPlaceCode: WideString; Volume: Double; const Comment: WideString); dispid 307;
    procedure SetRepo(const Account: WideString; const PlaceCode: WideString; 
                      const PCode: WideString; const BuySell: WideString; Price: Double; 
                      Quantity: Integer; SetDate: TDateTime; Timeout: Integer); dispid 308;
    procedure MoneyRecall(const Currency: WideString; const Account: WideString; 
                          const PlaceCode: WideString; const CardNo: WideString; 
                          const AccountNo: WideString; const Branch: WideString; 
                          const Bic: WideString; const Bank: WideString; 
                          const CorrAccount: WideString; const CorrPlace: WideString; 
                          const Properties: WideString; Volume: Double; const Comment: WideString); dispid 309;
    function CreateLimitOrder(const Account: WideString; const PlaceCode: WideString; 
                              const PCode: WideString; EndDate: TDateTime; 
                              const Comments: WideString; const Currency: WideString; 
                              const BuySell: WideString; Quantity: Integer; Price: Double; 
                              ActivateIfPriceHasGrow: OleVariant; 
                              ActivateIfPriceHasFall: OleVariant; ActivateIfOrderExec: OleVariant; 
                              ActivateIfOrderCancel: OleVariant; ActivateIfDateReached: OleVariant; 
                              CheckLimitsOnActivate: OleVariant; ChangeTo: OleVariant; 
                              ChangeIfPriceHasGrow: OleVariant; ChangeIfPriceHasFall: OleVariant; 
                              ChangeIfOrderExec: OleVariant; ChangeIfOrderCancel: OleVariant; 
                              ChangeIfDateReached: OleVariant; DeleteIfPriceHasGrow: OleVariant; 
                              DeleteIfPriceHasFall: OleVariant; DeleteIfOrderExec: OleVariant; 
                              DeleteIfOrderCancel: OleVariant; Timeout: Integer): Integer; dispid 310;
    function UpdateLimitOrder(OrderNo: Integer; NewPrice: OleVariant; NewQuantity: OleVariant; 
                              NewEndDate: OleVariant; Timeout: Integer): Integer; dispid 311;
    function CreateStopOrder(const Account: WideString; const PlaceCode: WideString; 
                             const PCode: WideString; EndDate: TDateTime; 
                             const Comments: WideString; const Currency: WideString; 
                             const BuySell: WideString; Quantity: Integer; StopPrice: Double; 
                             Slippage: Double; TakeProfit: OleVariant; Timeout: Integer): Integer; dispid 312;
    function UpdateStopOrder(OrderNo: Integer; NewStopPrice: OleVariant; NewSlippage: OleVariant; 
                             NewTakeProfit: OleVariant; NewQuantity: OleVariant; 
                             NewEndDate: OleVariant; Timeout: Integer): Integer; dispid 313;
    function CreateTrailingOrder(const Account: WideString; const PlaceCode: WideString; 
                                 const PCode: WideString; EndDate: TDateTime; 
                                 const Comments: WideString; const Currency: WideString; 
                                 const BuySell: WideString; Quantity: Integer; StartPrice: Double; 
                                 Level: Double; Slippage: Double; Timeout: Integer): Integer; dispid 324;
    function UpdateTrailingOrder(OrderNo: Integer; NewLevel: OleVariant; NewSlippage: OleVariant; 
                                 NewQuantity: OleVariant; NewEndDate: OleVariant; Timeout: Integer): Integer; dispid 325;
    function CreateAddressOrder(const Account: WideString; const PlaceCode: WideString; 
                                const PCode: WideString; EndDate: TDateTime; 
                                const Comments: WideString; const Currency: WideString; 
                                const BuySell: WideString; Quantity: Integer; Price: Double; 
                                const Contragent: WideString; Timeout: Integer): Integer; dispid 326;
    function UpdateAddressOrder(OrderNo: Integer; NewPrice: OleVariant; NewQuantity: OleVariant; 
                                NewEndDate: OleVariant; NewContragent: OleVariant; Timeout: Integer): Integer; dispid 327;
    function CreateAuctionOrder(const Account: WideString; const PlaceCode: WideString; 
                                const PCode: WideString; EndDate: TDateTime; 
                                const Comments: WideString; const Currency: WideString; 
                                const BuySell: WideString; Quantity: Integer; Price: Double; 
                                Rate: Double; Contragent: OleVariant; Timeout: Integer): Integer; dispid 328;
    function UpdateAuctionOrder(OrderNo: Integer; NewPrice: OleVariant; NewQuantity: OleVariant; 
                                NewEndDate: OleVariant; NewContragent: OleVariant; 
                                NewRate: OleVariant; Timeout: Integer): Integer; dispid 319;
    procedure DropOrder(OrderNo: OleVariant; BuySell: OleVariant; Treaty: OleVariant; 
                        Account: OleVariant; PlaceCode: OleVariant; PCode: OleVariant; 
                        Timeout: Integer); dispid 320;
    property SessionTime: TDateTime readonly dispid 201;
    function GetArchiveFinInfoFromDB(const PlaceCode: WideString; const PCode: WideString; 
                                     Period: Integer; DateFrom: OleVariant; DateTo: OleVariant): WideString; dispid 202;
    function GetLocalDBData(const TableName: WideString; const FieldNames: WideString; 
                            const Where: WideString): WideString; dispid 208;
    function GetLocalDBStruct(const TableName: WideString): WideString; dispid 209;
    function SubscribeTable(const TableName: WideString; const FieldNames: WideString; 
                            const Where: WideString; Options: eSubsctibeOptions; 
                            out Message: WideString): tagStateCodes; dispid 210;
    function UnSubscribeTable(const TableName: WideString; const Where: WideString; 
                              out Message: WideString): tagStateCodes; dispid 211;
  end;

// *********************************************************************//
// DispIntf:  IAlfaDirectEvents
// Flags:     (4096) Dispatchable
// GUID:      {E3E3D289-6675-4C9B-8B2C-34DEC46B05AE}
// *********************************************************************//
  IAlfaDirectEvents = dispinterface
    ['{E3E3D289-6675-4C9B-8B2C-34DEC46B05AE}']
    procedure OnConnectionChanged(State: eConnectionState); dispid 201;
    procedure OnTableChanged(const TableName: WideString; const TableParams: WideString; 
                             Data: OleVariant; FieldTypes: OleVariant); dispid 202;
    procedure OrderConfirmed(ID: Integer; OrderNum: Integer; const Message: WideString; 
                             Status: eCommandResult); dispid 203;
  end;

// *********************************************************************//
// The Class CoAlfaDirect provides a Create and CreateRemote method to          
// create instances of the default interface IAlfaDirect exposed by              
// the CoClass AlfaDirect. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAlfaDirect = class
    class function Create: IAlfaDirect;
    class function CreateRemote(const MachineName: string): IAlfaDirect;
  end;

implementation

uses ComObj;

class function CoAlfaDirect.Create: IAlfaDirect;
begin
  Result := CreateComObject(CLASS_AlfaDirect) as IAlfaDirect;
end;

class function CoAlfaDirect.CreateRemote(const MachineName: string): IAlfaDirect;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AlfaDirect) as IAlfaDirect;
end;

end.
