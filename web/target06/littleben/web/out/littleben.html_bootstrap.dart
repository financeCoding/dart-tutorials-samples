import "dart:async" as PC;import "dart:collection" as ZB;import "dart:html" as w;import "dart:isolate" as eC;class QC{static const  RC="Chrome";static const  SC="Safari";final  LC;final  minimumVersion;const QC(this.LC,[this.minimumVersion]);}class TC{final  name;const TC(this.name);}final MB=new l();var NB; get gB{if(pB){qB(MB,q.OB,'currentTime');}return NB;}set gB( g){if(oB(MB)){rB(MB,q.OB,'currentTime',NB,g);}NB=g;} hB(){var g=new Duration(seconds:1);new PC.Timer.periodic(g,aB);aB(null);} aB( iC){var g=new DateTime.now();gB=iB(g.hour,g.minute,g.second);} iB( g, h, i){if(g>12){g=g-12;}var j=(h<=9)?'0${h}':'${h}';var k=(i<=9)?'0${i}':'${i}';return '${g}:${j}:${k}';} jB(){var jC=w.document.body;var kC;var lC=new WC(jC);kC=jC.nodes[3];var mC=lC.MC(()=>gB,false);kC.nodes.addAll([new w.Text('\n      The current time is: '),mC,new w.Text('\n    ')]);lC.WB();lC.insert();}main(){eB=true;hB();jB();}typedef  p( e);typedef  kB( changes);typedef  AB();typedef  lB();class JB{final oldValue;final newValue;final  changes;JB(this.oldValue,this.newValue,[this.changes]); operator==(g){return g is JB&&oldValue==g.oldValue&&newValue==g.newValue&&changes==g.changes;} get hashCode=>BC(oldValue,newValue,changes); toString(){if(changes!=null)return '#<ChangeNotification to ${newValue}: ${changes}>';return '#<ChangeNotification from ${oldValue} to ${newValue}>';}}class q{static const OB=1;static const PB=2;static const bB=PB|4;static const cB=PB|8;final  type;final key;final oldValue;final newValue;q(this.type,this.key,this.oldValue,this.newValue); operator==(g){return g is q&&type==g.type&&key==g.key&&oldValue==g.oldValue&&newValue==g.newValue;} get hashCode=>CC(type,key,oldValue,newValue); toString(){var g;switch (type){case OB:g='field';break;case PB:g='index';break;case bB:g='insert';break;case cB:g='remove';break;}return '#<ChangeRecord ${g} ${key} from ${oldValue} to ${newValue}>';}} mB(g, i,[ debugName]){if(g is l){var h=g;return QB(h,(k){i(new JB(h,h,k));});}var j=new KB(g,i,debugName);if(!j.nC()){return sB;}return j.oC;} QB( g, i){if(g.DB==null)g.DB=new RB();var h=g.DB.add(i);return h.remove;}class l{var DB;var CB;final  hashCode= ++l.nB;static var nB=0;} oB( g)=>g.DB!=null&&g.DB.head!=null; get pB=>BB!=null; qB( g, h,i)=>BB.pC(g,h,i); rB( g, j,k, h, i){if((j&(q.bB|q.cB))==0){if(h==i)return;}if(t==null){t=[] ;DC(tB);}if(g.CB==null){g.CB=[] ;t.add(g);}g.CB.add(new q(j,k,h,i));} sB(){}var BB;var dB=100;var t;var u; tB(){var s=0;while (t!=null||u!=null){var j=t;t=null;var i=u;u=null;if(s++ ==dB){uB(j,i);return;}if(j!=null){for(var h in j){var IB=h.CB;h.CB=null;for(var g=h.DB.head;g!=null;g=g.next){var k=g.value;try {k(IB);}catch (YB,v){EB(YB,v,k,'from ${h}');}}}}if(i!=null){i.forEach((dC,OC){OC.qC();});}}} uB( k, j){var g=[] ;if(k!=null){for(var i in k){var IB=i.CB;g.add('${i} ${IB}');}}if(j!=null){for(var s in j.values){var h=s.qC();if(h!=null)g.add('${s} ${h}');}}t=null;u=null;var v='exceeded notifiction limit of ${dB}, possible ' 'circular reference in observer callbacks: ${g.take(10).join(", ")}';xB(v);}class KB{static var vB=0;final  rC= ++KB.vB;final  sC;final  tC;final  uC;final  vC=new Map();final  wC=[] ;var xC=false;var yC;KB(this.sC,this.tC,this.uC); toString()=>uC!=null?'<observer ${rC}: ${uC}>':'<observer ${rC}>'; nC(){var h=BB;BB=this;try {yC=sC();if(yC is Iterable&&yC is !List&&yC is !l){yC=(yC as Iterable).toList();}}catch (g,i){EB(g,i,sC,'from ${this}');yC=null;}vC.forEach(zC);vC.clear();assert(BB==this);BB=h;AD();return wC.length>0;} BD( i){try {tC(i);}catch (g,h){EB(g,h,tC,'from ${this}');}} AD(){var g=yC;if(g is !l)return;wC.add(QB(g,(h){BD(new JB(g,g,h));}));} pC( s, v,g){var i=vC.putIfAbsent(s,()=>new Map());try {var h=i[g];if(h==null)h=0;i[g]=h|v;}catch (j,k){EB(j,k,g,'hashCode or operator == from ${this}');}} zC( i, j){wC.add(QB(i,(k){if(xC)return;for(var g in k){var h=j[g.key];if(h!=null&&(h&g.type)!=0){xC=true;if(u==null){u=new ZB.SplayTreeMap();}u[rC]=this;return;}}}));} oC(){for(var g in wC){g();}xC=false;} qC(){if(!xC)return null;var g=yC;oC();nC();try {if(g==yC)return null;}catch (i,j){EB(i,j,g,'operator == from ${this}');return null;}var h=new JB(g,yC);BD(h);return h;}}typedef  wB( message);var xB=(g)=>print(g);typedef  yB(error,stackTrace,obj, message);var EB=zB; zB(i,g,h, j){print('web_ui.observe: unhandled error calling ${h} ${j}.\n' 'error:\n${i}\n\nstack trace:\n${g}');}class AC{AC();}class n<o>{var CD;var DD;var ED;var FD;n.fC( g,this.ED):FD=g{if(ED!=null)ED.GD++ ;} get next=>DD; get value=>FD;set value( g)=>FD=g; HD( g, h){DD=h;CD=g;if(g!=null)g.DD=this;if(h!=null)h.CD=this;return this;} append( g)=>new n<o>.fC(g,ED).HD(this,DD); remove(){if(ED==null)return;ED.GD-- ;if(CD!=null){CD.DD=DD;}else{ED.ID=DD;}if(DD!=null){DD.CD=CD;}else{ED.JD=CD;}DD=null;CD=null;ED=null;}}class RB<o> extends ZB.IterableBase<o>{var ID;var JD; get length=>GD;var GD=0;RB(){} get head=>ID; add( h){var g=new n<o>.fC(h,this);if(JD==null)return ID=JD=g;return JD=g.HD(JD,null);} addLast( g)=>add(g); addAll( g)=>g.forEach(add); get iterator=>new UC<o>(this);}class UC<o> implements Iterator<o>{var KD;var ED;var LD;var MD=-1;UC(this.ED){KD=new List<n>(ED.length);var h=0;var g=ED.head;while (g!=null){KD[h++ ]=g;g=g.next;}} get current=>LD; moveNext(){do{MD++ ;}while(MD<KD.length&&KD[MD].ED!=ED);if(MD<KD.length){LD=KD[MD].value;return true;}else{LD=null;return false;}}}FB(h,g)=>h.hashCode*31+g.hashCode;BC(h,g,i)=>FB(FB(h,g),i);CC(g,i,h,j)=>FB(FB(g,i),FB(h,j)); DC( h()){var g=new eC.ReceivePort();g.receive((i,j){g.close();h();});g.toSendPort().send(null);} EC(h, g,[ stringValue]){var i=h is AC;if(stringValue==null){stringValue=h.toString();}if(!i&&g is w.Text){g.text=stringValue;}else{var j=g;g=i?new w.Element.html(stringValue):new w.Text(stringValue);j.replaceWith(g);}return g;}abstract class SB{ WB(){} insert(); remove();}class VC extends SB{final exp;final  action;final  isFinal;var LB;VC(this.exp,this.action,this.isFinal); insert(){if(isFinal){action(new JB(null,exp()));}else if(LB!=null){throw new StateError('binding already attached');}else{LB=HC(exp,action,'generic-binding');}} remove(){if(!isFinal){LB();LB=null;}}}class WC extends SB{final  NC;final  children=[] ;final  nodes=[] ;WC(this.NC); MC( h,i){var g=new w.Text('');children.add(new VC(()=>'${h()}',(j){g=EC(h(),g,j.newValue);},i));return g;} add( g)=>nodes.add(g); addAll( g)=>nodes.addAll(g); WB(){for(var g=0,h=children.length;g<h;g++ ){children[g].WB();}} insert(){for(var g=0,h=children.length;g<h;g++ ){children[g].insert();}} remove(){for(var g=children.length-1;g>=0;g-- ){children[g].remove();}children.clear();}}var eB=false; FC(g, k,[ debugName]){if(eB)return mB(g,k);if(k==null)return (){};if(TB==null)TB=new RB<GB>();var i;var h=m.KC;if(g is fB){i=(g as fB).ND;}else if(g is Function){i=g;try {var j=g();if(j is List){h=m.HB;}else if(j is Iterable){h=m.HB;i=()=>g().toList();}else if((j is ZB.LinkedHashMap)||(j is ZB.SplayTreeMap)){h=m.VB;}else if(j is Map){h=m.UB;}}catch (s,YB){print('error: evaluating ${debugName!=null?debugName:"<unnamed>"} ' 'watcher threw error (${s}, ${YB})');}}else if(g is List){i=()=>g;h=m.HB;}else if(g is Iterable){i=()=>g.toList();h=m.HB;}else if((g is ZB.LinkedHashMap)||(g is ZB.SplayTreeMap)){i=()=>g;h=m.VB;}else if(g is Map){i=()=>g;h=m.UB;}var v=GC(h,i,k,debugName);var IB=TB.add(v);return IB.remove;} GC( j, g, i, h){switch (j){case m.HB:return new XC(g,i,h);case m.VB:return new bC(g,i,h);case m.UB:return new YC(g,i,h);default:return new GB(g,i,h);}} HC(h,i,[debugName]){var j=FC(h,i,debugName);var g=h;if(g is Function){g=g();}if(g is Iterable&&g is !List){g=g.toList();}i(new JB(null,g));return j;}var TB;class GB{final  XB;final  ND;final  OD;var PD;GB(this.ND,this.OD,this.XB){PD=ND();} toString()=>XB==null?'<unnamed>':XB; QD(g){PD=g;}RD(){try {return ND();}catch (g,h){print('error: evaluating ${this} watcher threw an exception (${g}, ${h})');}return PD;}}typedef  IC<JC>();class fB<JC>{fB();}class XC<JC> extends GB{XC(g, i, h):super(g,i,h){QD(RD());} QD(g){PD=new List<JC>.from(g);}}class YC<ZC,aC> extends GB{YC(g, i, h):super(g,i,h){QD(RD());} QD(g){PD=new Map<ZC,aC>.from(g);}}class bC<ZC,aC> extends GB{bC(g, i, h):super(g,i,h){QD(RD());} QD(g){PD=new ZB.LinkedHashMap.from(g);}}class m{final SD;const m.gC(this.SD);toString()=>'Enum.${SD}';static const HB=const m.gC('LIST');static const UB=const m.gC('HASH_MAP');static const VB=const m.gC('ORDERED_MAP');static const KC=const m.gC('OTHER');}//@ sourceMappingURL=littleben.html_bootstrap.dart.map
