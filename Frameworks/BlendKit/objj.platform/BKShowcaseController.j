I;16;AppKit/CPTheme.jI;15;AppKit/CPView.ji;13;BKUtilities.jc;5383;
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
