import "dart:uri" as eC;import "dart:html" as n;import "dart:async" as kB;import "dart:collection" as QC;class RC{static const  SC="Chrome";static const  TC="Firefox";static const  UC="Internet Explorer";static const  VC="Safari";final  KC;final  minimumVersion;const RC(this.KC,[this.minimumVersion]);}class WC{final  name;const WC(this.name);}var SB='pumpernickel';var FB=SB.split("");var GB=SB.replaceAll(new RegExp('.'),'-').split("");var AB=new List();var q='';var HB=false;var IB=false; lB(){} mB(){const  g=7;if(FB.contains(q)){nB();if(!GB.contains('-')){IB=true;}}else{AB.add(q);if(AB.length==g){HB=true;}}q='';} nB(){for(int g=0;g<FB.length;g++ ){if(FB[g]==q){GB[g]=q;}}} oB(){var gC=n.document.body;final hC=new n.InputElement(),iC=new n.Element.html('<p>\n              <template></template>\n            </p>'),jC=new n.Element.html('<p id="wrong">\n              <template></template>\n            </p>');var kC,lC,mC,nC;var oC=new WB(gC);kC=gC.nodes[3].nodes[1];oC.loop(kC,()=>GB,(h,g,oC){var p=h[g];var pC=oC.fB(()=>p,false);oC.addAll([new n.Text(' '),pC,new n.Text(' ')]);});mC=gC.nodes[5].nodes[1];oC.DB(mC,()=>!HB&&!IB,(oC){var qC,rC,sC,tC,uC;qC=hC.clone(true);oC.listen(qC.onInput,(i){q=qC.value;});oC.listen(qC.onKeyUp,(i){i=new dD(i);mB();});oC.MC(()=>q,(j){if(qC.value!=j)qC.value=j;},false,false);sC=iC.clone(true);rC=sC.nodes[1];oC.DB(rC,()=>AB.length!=0,(oC){oC.add(new n.Text(' Sorry! The word contains no: '));});uC=jC.clone(true);tC=uC.nodes[1];oC.loop(tC,()=>AB,(h,g,oC){var RB=h[g];var vC=oC.fB(()=>RB,false);oC.addAll([new n.Text(' '),vC,new n.Text(' ')]);});oC.addAll([new n.Text('\n            Guess a letter...\n            '),qC,new n.Text('\n            '),sC,new n.Text('\n            '),uC,new n.Text('\n          ')]);});nC=gC.nodes[5].nodes[3];oC.DB(nC,()=>HB,(oC){oC.add(new n.Text(' You\'re dead! '));});lC=gC.nodes[5].nodes[5];oC.DB(lC,()=>IB,(oC){oC.add(new n.Text(' You Win! '));});oC.w();oC.insert();}main(){YB=false;lB();oB();}typedef  t( e);typedef  pB( changes);typedef  o();typedef  qB();class JB{final oldValue;final newValue;final  changes;JB(this.oldValue,this.newValue,[this.changes]); operator==(g){return g is JB&&oldValue==g.oldValue&&newValue==g.newValue&&changes==g.changes;} get hashCode=>yB(oldValue,newValue,changes); toString(){if(changes!=null)return '#<ChangeNotification to ${newValue}: ${changes}>';return '#<ChangeNotification from ${oldValue} to ${newValue}>';}}class TB{TB();} rB(g, i,[ debugName]){if(g is s){var h=g;return KB(h,(p){i(new JB(h,h,p));});}var j=new MB(g,i,debugName);if(!j.wC()){return sB;}return j.xC;} KB( g, i){if(g.dB==null)g.dB=new NB();var h=g.dB.add(i);return h.remove;}class s{} sB(){}var BB;var LB;class MB{static var tB=0;final  yC= ++MB.tB;final  zC;final  AD;final  BD;final  CD=new Map();final  DD=[] ;var ED=false;var FD;MB(this.zC,this.AD,this.BD); toString()=>BD!=null?'<observer ${yC}: ${BD}>':'<observer ${yC}>'; wC(){var h=BB;BB=this;try {FD=zC();if(FD is Iterable&&FD is !List&&FD is !s){FD=(FD as Iterable).toList();}}catch (g,i){UB(g,i,zC,'from ${this}');FD=null;}CD.forEach(GD);CD.clear();assert(BB==this);BB=h;HD();return DD.length>0;} ID( i){try {AD(i);}catch (g,h){UB(g,h,AD,'from ${this}');}} HD(){var g=FD;if(g is !s)return;DD.add(KB(g,(h){ID(new JB(g,g,h));}));} GD( i, j){DD.add(KB(i,(p){if(ED)return;for(var g in p){var h=j[g.key];if(h!=null&&(h&g.type)!=0){ED=true;if(LB==null){LB=new QC.SplayTreeMap();}LB[yC]=this;return;}}}));} xC(){for(var g in DD){g();}ED=false;}}typedef  uB(error,stackTrace,obj, message);var UB=vB; vB(i,g,h, j){print('web_ui.observe: unhandled error calling ${h} ${j}.\n' 'error:\n${i}\n\nstack trace:\n${g}');}class wB{wB();}class xB{xB();}class l<m>{var JD;var KD;var LD;var MD;l.fC( g,this.LD):MD=g{if(LD!=null)LD.ND++ ;} get next=>KD; get value=>MD;set value( g)=>MD=g; OD( g, h){KD=h;JD=g;if(g!=null)g.KD=this;if(h!=null)h.JD=this;return this;} append( g)=>new l<m>.fC(g,LD).OD(this,KD); remove(){if(LD==null)return;LD.ND-- ;if(JD!=null){JD.KD=KD;}else{LD.PD=KD;}if(KD!=null){KD.JD=JD;}else{LD.QD=JD;}KD=null;JD=null;LD=null;}}class NB<m> extends QC.IterableBase<m>{var PD;var QD; get length=>ND;var ND=0;NB(){} get head=>PD; add( h){var g=new l<m>.fC(h,this);if(QD==null)return PD=QD=g;return QD=g.OD(QD,null);} addLast( g)=>add(g); addAll( g)=>g.forEach(add); get iterator=>new XC<m>(this);}class XC<m> implements Iterator<m>{var RD;var LD;var SD;var TD=-1;XC(this.LD){RD=new List<l>(LD.length);var h=0;var g=LD.head;while (g!=null){RD[h++ ]=g;g=g.next;}} get current=>SD; moveNext(){do{TD++ ;}while(TD<RD.length&&RD[TD].LD!=LD);if(TD<RD.length){SD=RD[TD].value;return true;}else{SD=null;return false;}}}VB(h,g)=>h.hashCode*31+g.hashCode;yB(h,g,i)=>VB(VB(h,g),i); zB(h, g,[ stringValue]){var i=h is wB;if(stringValue==null){stringValue=h.toString();}if(!i&&g is n.Text){g.text=stringValue;}else{var j=g;g=i?new n.Element.html(stringValue):new n.Text(stringValue);j.replaceWith(g);}return g;} AC(g){if(g is xB)return g.toString();g=g.toString();return CC(g)?g:'#';}const BC=const["http","https","ftp","mailto"]; CC( h){var g=new eC.Uri(h).scheme;if(g=='')return true;return BC.contains(g.toLowerCase())||"MAILTO"==g.toUpperCase();}abstract class u{ w(){} insert(); remove();}class YC extends u{final  gB;var UD;final  listener;YC(this.gB,this.listener); insert(){UD=gB.listen(listener);} remove(){UD.cancel();UD=null;}}class ZC extends u{final exp;final  action;final  isFinal;var k;ZC(this.exp,this.action,this.isFinal); insert(){if(isFinal){action(new JB(null,exp()));}else if(k!=null){throw new StateError('binding already attached');}else{k=CB(exp,action,'generic-binding');}} remove(){if(!isFinal){k();k=null;}}}class aC extends u{final  jB;final  PB;final  hB;final  isFinal;var k;aC(this.PB,this.jB,this.hB,this.isFinal); VD(g){jB(hB?AC(g):g);} insert(){if(isFinal){VD(PB());}else if(k!=null){throw new StateError('data binding already attached.');}else{k=CB(PB,(g)=>VD(g.newValue),'dom-property-binding');}} remove(){if(!isFinal){k();k=null;}}}class WB extends u{final  QB;final  children=[] ;final  nodes=[] ;WB(this.QB); listen( i, h){children.add(new YC(i,(g){h(g);HC();}));} fB( h,i){var g=new n.Text('');children.add(new ZC(()=>'${h()}',(j){g=zB(h(),g,j.newValue);},i));return g;} MC(g,i,h,[isUrl=false]){children.add(new aC(g,i,isUrl,h));} DB( h,g,i){children.add(new EC(h,g,i));} loop( h,g,i){children.add(new bC(h,g,i));} add( g)=>nodes.add(g); addAll( g)=>nodes.addAll(g); w(){for(var g=0,h=children.length;g<h;g++ ){children[g].w();}} insert(){for(var g=0,h=children.length;g<h;g++ ){children[g].insert();}} remove(){for(var g=children.length-1;g>=0;g-- ){children[g].remove();}children.clear();}}abstract class XB extends WB{final exp;var k;XB( g,this.exp):super(g); w(){} insert(){super.w();if(nodes.length>0){var i=QB.parentNode;var j=QB.nextNode;for(var g=0,h=nodes.length;g<h;g++ ){i.insertBefore(nodes[g],j);}}super.insert();} remove(){super.remove();for(var g=nodes.length-1;g>=0;g-- ){nodes[g].remove();}nodes.clear();}}typedef  DC( template);class EC extends XB{var EB=false;final  eB;EC( h,g,this.eB):super(h,g); insert(){k=CB(exp,(g){if(!EB&&g.newValue){eB(this);super.insert();EB=true;}else if(EB&&!g.newValue){super.remove();EB=false;}},'conditional-binding');} remove(){super.remove();k();k=null;}}typedef  FC( list, index, template);class bC extends XB{final  iB;bC( h,g,this.iB):super(h,g); insert(){k=CB(exp,(i){super.remove();var h=i.newValue;for(int g=0;g<h.length;g++ ){iB(h,g,this);}super.insert();},'loop-binding');} remove(){super.remove();k();k=null;}}var YB=false; GC(g, j,[ debugName]){if(YB)return rB(g,j);if(j==null)return (){};if(v==null)v=new NB<ZB>();var h;var i=false;if(g is cB){h=(g as cB).WD;}else if(g is Function){h=g;try {var p=g();if(p is List){i=true;}else if(p is Iterable){i=true;h=()=>g().toList();}}catch (RB,NC){print('error: evaluating ${debugName!=null?debugName:"<unnamed>"} ' 'watcher threw error (${RB}, ${NC})');}}else if(g is List){h=()=>g;i=true;}else if(g is Iterable){h=()=>g.toList();i=true;}var OC=i?new cC(h,j,debugName):new ZB(h,j,debugName);var PC=v.add(OC);return PC.remove;} CB(h,i,[debugName]){var j=GC(h,i,debugName);var g=h;if(g is Function){g=g();}if(g is Iterable&&g is !List){g=g.toList();}i(new JB(null,g));return j;}var v;class ZB{final  OB;final  WD;final  XD;var YD;ZB(this.WD,this.XD,this.OB){YD=WD();} toString()=>OB==null?'<unnamed>':OB; LC(){var g=ZD();if(aD(g)){var h=YD;bD(g);XD(new JB(h,g));return true;}return false;} aD(g)=>YD!=g; bD(g){YD=g;}ZD(){try {return WD();}catch (g,h){print('error: evaluating ${this} watcher threw an exception (${g}, ${h})');}return YD;}}final  aB=10; HC(){if(v==null)return;var g;var h=0;do{g=false;for(var i in v){if(i.LC()){g=true;}}}while(g&& ++h<aB);if(h==aB){print('Possible loop in watchers propagation, stopped dispatch.');}}typedef  bB<IC>();typedef  JC<IC>( value);class cB<IC>{cB();}class cC<IC> extends ZB{cC(g, i, h):super(g,i,h){bD(ZD());} aD( h){if(YD.length!=h.length)return true;for(int g=0;g<YD.length;g++ ){if(YD[g]!=h[g])return true;}return false;} bD(g){YD=new List<IC>.from(g);}}//@ sourceMappingURL=simplehangman.html_bootstrap.dart.map
