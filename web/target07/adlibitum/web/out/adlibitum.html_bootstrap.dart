import "dart:async" as IC;import "dart:collection" as wB;import "dart:uri" as MD;import "dart:html" as u;import "dart:isolate" as LD;class wC{static const  xC="Chrome";static const  yC="Safari";final  sC;final  minimumVersion;const wC(this.sC,[this.minimumVersion]);}class zC{final  name;const zC(this.name);}final k=new n();var ZB=''; get aB{if(FB){GB(k,l.p,'sillyword');}return ZB;}set aB( g){if(EB(k)){HB(k,l.p,'sillyword',ZB,g);}ZB=g;}var bB=''; get cB{if(FB){GB(k,l.p,'adjective');}return bB;}set cB( g){if(EB(k)){HB(k,l.p,'adjective',bB,g);}bB=g;}var dB=''; get eB{if(FB){GB(k,l.p,'animal');}return dB;}set eB( g){if(EB(k)){HB(k,l.p,'animal',dB,g);}dB=g;}var fB=''; get gB{if(FB){GB(k,l.p,'bodypart');}return fB;}set gB( g){if(EB(k)){HB(k,l.p,'bodypart',fB,g);}fB=g;}var hB=''; get iB{if(FB){GB(k,l.p,'verb');}return hB;}set iB( g){if(EB(k)){HB(k,l.p,'verb',hB,g);}hB=g;}var jB=''; get kB{if(FB){GB(k,l.p,'adverb');}return jB;}set kB( g){if(EB(k)){HB(k,l.p,'adverb',jB,g);}jB=g;} JC(){}bool KC(){if(aB!=''&&cB!=''&&eB!=''&&gB!=''&&iB!=''&&kB!=''){return true;}else{return false;}} LC(){var QD=u.document.body;final RD=new u.ParagraphElement(),SD=new u.ParagraphElement(),TD=new u.ParagraphElement();var UD,VD,WD,XD,YD,ZD,aD;var bD=new hC(QD);UD=QD.nodes[3];bD.listen(UD.onInput,(h){aB=UD.value;});bD.MB(()=>aB,(g){if(UD.value!=g)UD.value=g;},false,false);VD=QD.nodes[5];bD.listen(VD.onInput,(h){cB=VD.value;});bD.MB(()=>cB,(g){if(VD.value!=g)VD.value=g;},false,false);XD=QD.nodes[7];bD.listen(XD.onInput,(h){eB=XD.value;});bD.MB(()=>eB,(g){if(XD.value!=g)XD.value=g;},false,false);YD=QD.nodes[9];bD.listen(YD.onInput,(h){gB=YD.value;});bD.MB(()=>gB,(g){if(YD.value!=g)YD.value=g;},false,false);ZD=QD.nodes[11];bD.listen(ZD.onInput,(h){iB=ZD.value;});bD.MB(()=>iB,(g){if(ZD.value!=g)ZD.value=g;},false,false);aD=QD.nodes[13];bD.listen(aD.onInput,(h){kB=aD.value;});bD.MB(()=>kB,(g){if(aD.value!=g)aD.value=g;},false,false);WD=QD.nodes[15];bD.uC(WD,()=>KC(),(bD){var cD,dD,eD;eD=RD.clone(true);var fD=bD.LB(()=>aB,false);eD.nodes.addAll([new u.Text('Dear Ms. '),fD,new u.Text(',')]);cD=SD.clone(true);var gD=bD.LB(()=>cB,false);var hD=bD.LB(()=>eB,false);var iD=bD.LB(()=>gB,false);var jD=bD.LB(()=>iB,false);cD.nodes.addAll([new u.Text('Little '),gD,new u.Text(' Billy missed school\n        because he was sick with wild-'),hD,new u.Text(' flu.\n        His '),iD,new u.Text(' swelled up and fell off.\n        He can no longer '),jD,new u.Text('.')]);dD=TD.clone(true);var kD=bD.LB(()=>kB,false);dD.nodes.addAll([new u.Text('Most '),kD,new u.Text(' yours, Billy\'s mother')]);bD.addAll([new u.Text('\n        '),eD,new u.Text('\n        \n        '),cD,new u.Text('\n        \n        '),dD,new u.Text('\n      ')]);});bD.TB();bD.insert();}main(){AC=true;JC();LC();}const AD=const BD();typedef  v( e);typedef  MC( changes);typedef  w();typedef  NC();class VB{final oldValue;final newValue;final  changes;VB(this.oldValue,this.newValue,[this.changes]); operator==(g){return g is VB&&oldValue==g.oldValue&&newValue==g.newValue&&changes==g.changes;} get hashCode=>aC(oldValue,newValue,changes); toString(){if(changes!=null)return '#<ChangeNotification to ${newValue}: ${changes}>';return '#<ChangeNotification from ${oldValue} to ${newValue}>';}}class l{static const p=1;static const lB=2;static const xB=lB|4;static const yB=lB|8;final  type;final key;final oldValue;final newValue;l(this.type,this.key,this.oldValue,this.newValue); operator==(g){return g is l&&type==g.type&&key==g.key&&oldValue==g.oldValue&&newValue==g.newValue;} get hashCode=>bC(type,key,oldValue,newValue); toString(){var g;switch (type){case p:g='field';break;case lB:g='index';break;case xB:g='insert';break;case yB:g='remove';break;}return '#<ChangeRecord ${g} ${key} from ${oldValue} to ${newValue}>';}} OC(g, i,[ debugName]){if(g is n){var h=g;return mB(h,(m){i(new VB(h,h,m));});}var j=new WB(g,i,debugName);if(!j.lD()){return QC;}return j.mD;} mB( g, i){if(g.KB==null)g.KB=new nB();var h=g.KB.add(i);return h.remove;}class n{var KB;var JB;final  hashCode= ++n.PC;static var PC=0;} EB( g)=>g.KB!=null&&g.KB.head!=null; get FB=>IB!=null; GB( g, h,i)=>IB.nD(g,h,i); HB( g, j,m, h, i){if((j&(l.xB|l.yB))==0){if(h==i)return;}if(BB==null){BB=[] ;cC(RC);}if(g.JB==null){g.JB=[] ;BB.add(g);}g.JB.add(new l(j,m,h,i));} QC(){}var IB;var zB=100;var BB;var CB; RC(){var AB=0;while (BB!=null||CB!=null){var j=BB;BB=null;var i=CB;CB=null;if(AB++ ==zB){SC(j,i);return;}if(j!=null){for(var h in j){var UB=h.JB;h.JB=null;for(var g=h.KB.head;g!=null;g=g.next){var m=g.value;try {m(UB);}catch (vB,DB){NB(vB,DB,m,'from ${h}');}}}}if(i!=null){i.forEach((KD,vC){vC.oD();});}}} SC( m, j){var g=[] ;if(m!=null){for(var i in m){var UB=i.JB;g.add('${i} ${UB}');}}if(j!=null){for(var AB in j.values){var h=AB.oD();if(h!=null)g.add('${AB} ${h}');}}BB=null;CB=null;var DB='exceeded notifiction limit of ${zB}, possible ' 'circular reference in observer callbacks: ${g.take(10).join(", ")}';VC(DB);}class WB{static var TC=0;final  pD= ++WB.TC;final  qD;final  rD;final  sD;final  tD=new Map();final  uD=[] ;var vD=false;var wD;WB(this.qD,this.rD,this.sD); toString()=>sD!=null?'<observer ${pD}: ${sD}>':'<observer ${pD}>'; lD(){var h=IB;IB=this;try {wD=qD();if(wD is Iterable&&wD is !List&&wD is !n){wD=(wD as Iterable).toList();}}catch (g,i){NB(g,i,qD,'from ${this}');wD=null;}tD.forEach(xD);tD.clear();assert(IB==this);IB=h;yD();return uD.length>0;} zD( i){try {rD(i);}catch (g,h){NB(g,h,rD,'from ${this}');}} yD(){var g=wD;if(g is !n)return;uD.add(mB(g,(h){zD(new VB(g,g,h));}));} nD( AB, DB,g){var i=tD.putIfAbsent(AB,()=>new Map());try {var h=i[g];if(h==null)h=0;i[g]=h|DB;}catch (j,m){NB(j,m,g,'hashCode or operator == from ${this}');}} xD( i, j){uD.add(mB(i,(m){if(vD)return;for(var g in m){var h=j[g.key];if(h!=null&&(h&g.type)!=0){vD=true;if(CB==null){CB=new wB.SplayTreeMap();}CB[pD]=this;return;}}}));} mD(){for(var g in uD){g();}vD=false;} oD(){if(!vD)return null;var g=wD;mD();lD();try {if(g==wD)return null;}catch (i,j){NB(i,j,g,'operator == from ${this}');return null;}var h=new VB(g,wD);zD(h);return h;}}typedef  UC( message);var VC=(g)=>print(g);typedef  WC(error,stackTrace,obj, message);var NB=XC; XC(i,g,h, j){print('web_ui.observe: unhandled error calling ${h} ${j}.\n' 'error:\n${i}\n\nstack trace:\n${g}');}class BD{const BD();}class YC{YC();}class ZC{ZC();}class q<s>{var AE;var BE;var CE;var DE;q.ND( g,this.CE):DE=g{if(CE!=null)CE.EE++ ;} get next=>BE; get value=>DE;set value( g)=>DE=g; FE( g, h){BE=h;AE=g;if(g!=null)g.BE=this;if(h!=null)h.AE=this;return this;} append( g)=>new q<s>.ND(g,CE).FE(this,BE); remove(){if(CE==null)return;CE.EE-- ;if(AE!=null){AE.BE=BE;}else{CE.GE=BE;}if(BE!=null){BE.AE=AE;}else{CE.HE=AE;}BE=null;AE=null;CE=null;}}class nB<s> extends wB.IterableBase<s>{var GE;var HE; get length=>EE;var EE=0;nB(){} get head=>GE; add( h){var g=new q<s>.ND(h,this);if(HE==null)return GE=HE=g;return HE=g.FE(HE,null);} addLast( g)=>add(g); addAll( g)=>g.forEach(add); get iterator=>new CD<s>(this);}class CD<s> implements Iterator<s>{var IE;var CE;var JE;var KE=-1;CD(this.CE){IE=new List<q>(CE.length);var h=0;var g=CE.head;while (g!=null){IE[h++ ]=g;g=g.next;}} get current=>JE; moveNext(){do{KE++ ;}while(KE<IE.length&&IE[KE].CE!=CE);if(KE<IE.length){JE=IE[KE].value;return true;}else{JE=null;return false;}}}OB(h,g)=>h.hashCode*31+g.hashCode;aC(h,g,i)=>OB(OB(h,g),i);bC(g,i,h,j)=>OB(OB(g,i),OB(h,j)); cC( h()){var g=new LD.ReceivePort();g.receive((i,j){g.close();h();});g.toSendPort().send(null);} dC(h, g,[ stringValue]){var i=h is YC;if(stringValue==null){stringValue=h.toString();}if(!i&&g is u.Text){g.text=stringValue;}else{var j=g;g=i?new u.Element.html(stringValue):new u.Text(stringValue);j.replaceWith(g);}return g;} eC(g){if(g is ZC)return g.toString();g=g.toString();return gC(g)?g:'#';}const fC=const["http","https","ftp","mailto"]; gC( h){var g=new MD.Uri(h).scheme;if(g=='')return true;return fC.contains(g.toLowerCase())||"MAILTO"==g.toUpperCase();}abstract class PB{ TB(){} insert(); remove();}class DD extends PB{final  FC;var LE;final  listener;DD(this.FC,this.listener); insert(){LE=FC.listen(listener);} remove(){LE.cancel();LE=null;}}class ED extends PB{final exp;final  action;final  isFinal;var t;ED(this.exp,this.action,this.isFinal); insert(){if(isFinal){action(new VB(null,exp()));}else if(t!=null){throw new StateError('binding already attached');}else{t=oB(exp,action,'generic-binding');}} remove(){if(!isFinal){t();t=null;}}}class FD extends PB{final  HC;final  tB;final  GC;final  isFinal;var t;FD(this.tB,this.HC,this.GC,this.isFinal); ME(g){HC(GC?eC(g):g);} insert(){if(isFinal){ME(tB());}else if(t!=null){throw new StateError('data binding already attached.');}else{t=oB(tB,(g)=>ME(g.newValue),'dom-property-binding');}} remove(){if(!isFinal){t();t=null;}}}class hC extends PB{final  uB;final  children=[] ;final  nodes=[] ;hC(this.uB); listen( i, h){children.add(new DD(i,(g){h(g);nC();}));} LB( h,i){var g=new u.Text('');children.add(new ED(()=>'${h()}',(j){g=dC(h(),g,j.newValue);},i));return g;} MB(g,i,h,[isUrl=false]){children.add(new FD(g,i,isUrl,h));} uC( h,g,i){children.add(new kC(h,g,i));} add( g)=>nodes.add(g); addAll( g)=>nodes.addAll(g); TB(){for(var g=0,h=children.length;g<h;g++ ){children[g].TB();}} insert(){for(var g=0,h=children.length;g<h;g++ ){children[g].insert();}} remove(){for(var g=children.length-1;g>=0;g-- ){children[g].remove();}children.clear();}}abstract class iC extends hC{final exp;var t;iC( g,this.exp):super(g); TB(){} insert(){super.TB();if(nodes.length>0){var i=uB.parentNode;var j=uB.nextNode;for(var g=0,h=nodes.length;g<h;g++ ){i.insertBefore(nodes[g],j);}}super.insert();} remove(){super.remove();for(var g=nodes.length-1;g>=0;g-- ){nodes[g].remove();}nodes.clear();}}typedef  jC( template);class kC extends iC{var YB=false;final  EC;kC( h,g,this.EC):super(h,g); insert(){t=oB(exp,(g){if(!YB&&g.newValue){EC(this);super.insert();YB=true;}else if(YB&&!g.newValue){super.remove();YB=false;}},'conditional-binding');} remove(){super.remove();t();t=null;}}var AC=false; lC(g, m,[ debugName]){if(AC)return OC(g,m);if(m==null)return (){};if(QB==null)QB=new nB<RB>();var i;var h=o.rC;if(g is DC){i=(g as DC).NE;}else if(g is Function){i=g;try {var j=g();if(j is List){h=o.SB;}else if(j is Iterable){h=o.SB;i=()=>g().toList();}else if((j is wB.LinkedHashMap)||(j is wB.SplayTreeMap)){h=o.rB;}else if(j is Map){h=o.qB;}}catch (AB,vB){print('error: evaluating ${debugName!=null?debugName:"<unnamed>"} ' 'watcher threw error (${AB}, ${vB})');}}else if(g is List){i=()=>g;h=o.SB;}else if(g is Iterable){i=()=>g.toList();h=o.SB;}else if((g is wB.LinkedHashMap)||(g is wB.SplayTreeMap)){i=()=>g;h=o.rB;}else if(g is Map){i=()=>g;h=o.qB;}var DB=mC(h,i,m,debugName);var UB=QB.add(DB);return UB.remove;} mC( j, g, i, h){switch (j){case o.SB:return new GD(g,i,h);case o.rB:return new ID(g,i,h);case o.qB:return new HD(g,i,h);default:return new RB(g,i,h);}} oB(h,i,[debugName]){var j=lC(h,i,debugName);var g=h;if(g is Function){g=g();}if(g is Iterable&&g is !List){g=g.toList();}i(new VB(null,g));return j;}var QB;class RB{final  sB;final  NE;final  OE;var PE;RB(this.NE,this.OE,this.sB){PE=NE();} toString()=>sB==null?'<unnamed>':sB; tC(){var g=QE();if(RE(g)){var h=PE;SE(g);OE(new VB(h,g));return true;}return false;} RE(g)=>PE!=g; SE(g){PE=g;}QE(){try {return NE();}catch (g,h){print('error: evaluating ${this} watcher threw an exception (${g}, ${h})');}return PE;}}final  BC=10; nC(){if(QB==null)return;var g;var h=0;do{g=false;for(var i in QB){if(i.tC()){g=true;}}}while(g&& ++h<BC);if(h==BC){print('Possible loop in watchers propagation, stopped dispatch.');}}typedef  CC<oC>();typedef  pC<oC>( value);class DC<oC>{DC();}class GD<oC> extends RB{GD(g, i, h):super(g,i,h){SE(QE());} RE( g){return pB(PE,g);} SE(g){PE=new List<oC>.from(g);}}class HD<XB,qC> extends RB{HD(g, i, h):super(g,i,h){SE(QE());} RE( g){var i=PE.keys;if(i.length!=g.keys.length)return true;var j=i.iterator;while (j.moveNext()){var h=j.current;if(!g.containsKey(h))return true;if(PE[h]!=g[h])return true;}return false;} SE(g){PE=new Map<XB,qC>.from(g);}}class ID<XB,qC> extends RB{ID(g, i, h):super(g,i,h){SE(QE());} RE( g){return pB(g.keys,PE.keys)||pB(g.values,PE.values);} SE(g){PE=new wB.LinkedHashMap.from(g);}} pB( i, j){var h=i.iterator;var g=j.iterator;while (h.moveNext()){if(!g.moveNext())return true;if(h.current!=g.current)return true;}return g.moveNext();}class o{final TE;const o.OD(this.TE);toString()=>'Enum.${TE}';static const SB=const o.OD('LIST');static const qB=const o.OD('HASH_MAP');static const rB=const o.OD('ORDERED_MAP');static const rC=const o.OD('OTHER');}//@ sourceMappingURL=adlibitum.html_bootstrap.dart.map
