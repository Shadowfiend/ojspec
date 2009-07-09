@STATIC;1.0;p;22;BKShowcaseController.jI;16;AppKit/CPTheme.jI;15;AppKit/CPView.ji;13;BKUtilities.jc;5383;
var _1=objj_allocateClassPair(CPObject,"BKShowcaseController"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("applicationDidFinishLaunching:"),function(_3,_4,_5){
with(_3){
var _6=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMakeZero(),CPBorderlessBridgeWindowMask),_7=objj_msgSend(_6,"contentView"),_8=objj_msgSend(_7,"bounds"),_9=BKThemeDescriptorClasses();
var _a=objj_msgSend(objj_msgSend(CPTabView,"alloc"),"initWithFrame:",_8);
objj_msgSend(_a,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_7,"addSubview:",_a);
var _b=0,_c=objj_msgSend(_9,"count");
for(;_b<_c;++_b){
var _d=_9[_b],_e=objj_msgSend(objj_msgSend(CPTabViewItem,"alloc"),"initWithIdentifier:",objj_msgSend(_d,"themeName")),_f=BKThemeObjectTemplatesForClass(_d),_10=objj_msgSend(_f,"count"),_11=[],_12=CGSizeMake(0,0);
while(_10--){
var _13=_f[_10],_14=objj_msgSend(_13,"valueForKey:","themedObject");
if(objj_msgSend(_14,"isKindOfClass:",objj_msgSend(CPView,"class"))){
var _15=objj_msgSend(_14,"frame").size,_16=objj_msgSend(objj_msgSend(_13,"valueForKey:","label"),"sizeWithFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12)).width+20;
if(_15.width>_12.width){
_12.width=_15.width;
}
if(_16>_12.width){
_12.width=_16;
}
if(_15.height>_12.height){
_12.height=_15.height;
}
objj_msgSend(_11,"addObject:",_13);
}
}
_12.width+=20;
_12.height+=30;
var _17=objj_msgSend(objj_msgSend(CPCollectionView,"alloc"),"initWithFrame:",CGRectMakeZero()),_18=objj_msgSend(objj_msgSend(CPCollectionViewItem,"alloc"),"init");
var _19=nil;
if(objj_msgSend(_d,"respondsToSelector:",sel_getUid("themeShowcaseBackgroundColor"))){
_19=objj_msgSend(_d,"themeShowcaseBackgroundColor");
}
objj_msgSend(_18,"setView:",objj_msgSend(objj_msgSend(BKShowcaseCell,"alloc"),"initWithShowcaseBackgroundColor:",_19));
objj_msgSend(_17,"setItemPrototype:",_18);
objj_msgSend(_17,"setMinItemSize:",_12);
objj_msgSend(_17,"setMaxItemSize:",_12);
objj_msgSend(_17,"setVerticalMargin:",5);
objj_msgSend(_17,"setContent:",_11);
objj_msgSend(_e,"setLabel:",objj_msgSend(_d,"themeName"));
objj_msgSend(_e,"setView:",_17);
objj_msgSend(_a,"addTabViewItem:",_e);
}
objj_msgSend(_6,"orderFront:",_3);
}
})]);
var _1=objj_allocateClassPair(CPView,"BKShowcaseCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_showcaseBackgroundColor"),new objj_ivar("_backgroundView"),new objj_ivar("_view"),new objj_ivar("_label")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithShowcaseBackgroundColor:"),function(_1a,_1b,_1c){
with(_1a){
_1a=objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("CPView")},"init");
if(_1a){
_showcaseBackgroundColor=_1c;
}
return _1a;
}
}),new objj_method(sel_getUid("setSelected:"),function(_1d,_1e,_1f){
with(_1d){
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_20,_21,_22){
with(_20){
if(!_label){
_label=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_label,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_label,"setAutoresizingMask:",CPViewMinYMargin|CPViewWidthSizable);
objj_msgSend(_label,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_20,"addSubview:",_label);
}
objj_msgSend(_label,"setStringValue:",objj_msgSend(_22,"valueForKey:","label"));
objj_msgSend(_label,"sizeToFit");
objj_msgSend(_label,"setFrame:",CGRectMake(0,CGRectGetHeight(objj_msgSend(_20,"bounds"))-CGRectGetHeight(objj_msgSend(_label,"frame")),CGRectGetWidth(objj_msgSend(_20,"bounds")),CGRectGetHeight(objj_msgSend(_label,"frame"))));
if(!_backgroundView){
_backgroundView=objj_msgSend(objj_msgSend(CPView,"alloc"),"init");
objj_msgSend(_backgroundView,"setBackgroundColor:",_showcaseBackgroundColor);
objj_msgSend(_20,"addSubview:",_backgroundView);
}
objj_msgSend(_backgroundView,"setFrame:",CGRectMake(0,0,CGRectGetWidth(objj_msgSend(_20,"bounds")),CGRectGetMinY(objj_msgSend(_label,"frame"))));
objj_msgSend(_backgroundView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
if(_view){
objj_msgSend(_view,"removeFromSuperview");
}
_view=objj_msgSend(_22,"valueForKey:","themedObject");
objj_msgSend(_view,"setTheme:",nil);
objj_msgSend(_view,"setAutoresizingMask:",CPViewMinXMargin|CPViewMaxXMargin|CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(_view,"setFrameOrigin:",CGPointMake((CGRectGetWidth(objj_msgSend(_backgroundView,"bounds"))-CGRectGetWidth(objj_msgSend(_view,"frame")))/2,(CGRectGetHeight(objj_msgSend(_backgroundView,"bounds"))-CGRectGetHeight(objj_msgSend(_view,"frame")))/2));
objj_msgSend(_backgroundView,"addSubview:",_view);
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_23,_24,_25){
with(_23){
_23=objj_msgSendSuper({receiver:_23,super_class:objj_getClass("CPView")},"initWithCoder:",_25);
if(_23){
_showcaseBackgroundColor=objj_msgSend(_25,"decodeObjectForKey:","showcase-background-color");
}
return _23;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_26,_27,_28){
with(_26){
objj_msgSendSuper({receiver:_26,super_class:objj_getClass("CPView")},"encodeWithCoder:",_28);
objj_msgSend(_28,"encodeObject:forKey:",_showcaseBackgroundColor,"showcase-background-color");
}
})]);
p;13;BKUtilities.jc;3002;
var _1=objj_allocateClassPair(CPObject,"BKThemeTemplate"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_name"),new objj_ivar("_description")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_name=objj_msgSend(_5,"decodeObjectForKey:","BKThemeTemplateName");
_description=objj_msgSend(_5,"decodeObjectForKey:","BKThemeTemplateDescription");
}
return _3;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_6,_7,_8){
with(_6){
objj_msgSend(_8,"encodeObject:forKey:",_name,"BKThemeTemplateName");
objj_msgSend(_8,"encodeObject:forKey:",_description,"BKThemeTemplateDescription");
}
})]);
var _1=objj_allocateClassPair(CPView,"BKThemeObjectTemplate"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_label"),new objj_ivar("_themedObject")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_9,_a,_b){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPView")},"init");
if(_9){
_label=objj_msgSend(_b,"decodeObjectForKey:","BKThemeObjectTemplateLabel");
_themedObject=objj_msgSend(_b,"decodeObjectForKey:","BKThemeObjectTemplateThemedObject");
}
return _9;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_c,_d,_e){
with(_c){
objj_msgSend(_e,"encodeObject:forKey:",_label,"BKThemeObjectTemplateLabel");
objj_msgSend(_e,"encodeObject:forKey:",_themedObject,"BKThemeObjectTemplateThemedObject");
}
})]);
BKThemeDescriptorClasses=function(){
var _f=[];
for(candidate in window){
var _10=objj_getClass(candidate),_11=class_getName(_10),_12=_11.indexOf("ThemeDescriptor");
if((_12>=0)&&(_12===_11.length-"ThemeDescriptor".length)){
_f.push(_10);
}
}
return _f;
};
BKThemeObjectTemplatesForClass=function(_13){
var _14=[],_15=class_copyMethodList(_13.isa),_16=objj_msgSend(_15,"count");
while(_16--){
var _17=_15[_16],_18=method_getName(_17);
if(_18.indexOf("themed")===0){
var _19=method_getImplementation(_17),_1a=_19(_13,_18);
if(_1a){
var _1b=objj_msgSend(objj_msgSend(BKThemeObjectTemplate,"alloc"),"init");
objj_msgSend(_1b,"setValue:forKey:",_1a,"themedObject");
objj_msgSend(_1b,"setValue:forKey:",BKLabelFromIdentifier(_18),"label");
objj_msgSend(_14,"addObject:",_1b);
}
}
}
return _14;
};
BKLabelFromIdentifier=function(_1c){
var _1d=_1c.substr("themed".length);
index=0,count=_1d.length,label="",lastCapital=null,isLeadingCapital=YES;
for(;index<count;++index){
var _1e=_1d.charAt(index),_1f=/^[A-Z]/.test(_1e);
if(_1f){
if(!isLeadingCapital){
if(lastCapital===null){
label+=" "+_1e.toLowerCase();
}else{
label+=_1e;
}
}
lastCapital=_1e;
}else{
if(isLeadingCapital&&lastCapital!==null){
label+=lastCapital;
}
label+=_1e;
lastCapital=null;
isLeadingCapital=NO;
}
}
return label;
};
p;10;BlendKit.ji;22;BKShowcaseController.ji;13;BKUtilities.j