@STATIC;1.0;p;22;BKShowcaseController.jI;16;AppKit/CPTheme.jI;15;AppKit/CPView.ji;13;BKUtilities.jc;7220;


{var the_class = objj_allocateClassPair(CPObject, "BKShowcaseController"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function(self, _cmd, aNotification)
{ with(self)
{
    var theWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMakeZero(), CPBorderlessBridgeWindowMask),
        contentView = objj_msgSend(theWindow, "contentView"),
        bounds = objj_msgSend(contentView, "bounds"),
        themeDescriptorClasses = BKThemeDescriptorClasses();

    var tabView = objj_msgSend(objj_msgSend(CPTabView, "alloc"), "initWithFrame:", bounds);

    objj_msgSend(tabView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);

    objj_msgSend(contentView, "addSubview:", tabView);

    var index = 0,
        count = objj_msgSend(themeDescriptorClasses, "count");

    for (; index < count; ++index)
    {
        var theClass = themeDescriptorClasses[index],
            item = objj_msgSend(objj_msgSend(CPTabViewItem, "alloc"), "initWithIdentifier:", objj_msgSend(theClass, "themeName")),
            templates = BKThemeObjectTemplatesForClass(theClass),
            templatesCount = objj_msgSend(templates, "count"),
            viewTemplates = [],
            itemSize = CGSizeMake(0.0, 0.0);

        while (templatesCount--)
        {
            var template = templates[templatesCount],
                object = objj_msgSend(template, "valueForKey:", "themedObject");

            if (objj_msgSend(object, "isKindOfClass:", objj_msgSend(CPView, "class")))
            {
                var size = objj_msgSend(object, "frame").size,
                    labelWidth = objj_msgSend(objj_msgSend(template, "valueForKey:", "label"), "sizeWithFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 12.0)).width + 20.0;

                if (size.width > itemSize.width)
                    itemSize.width = size.width;

                if (labelWidth > itemSize.width)
                    itemSize.width = labelWidth;

                if (size.height > itemSize.height)
                    itemSize.height = size.height;

                objj_msgSend(viewTemplates, "addObject:", template);
            }
        }

        itemSize.width += 20.0;
        itemSize.height += 30.0;

        var collectionView = objj_msgSend(objj_msgSend(CPCollectionView, "alloc"), "initWithFrame:", CGRectMakeZero()),
            collectionViewItem = objj_msgSend(objj_msgSend(CPCollectionViewItem, "alloc"), "init");

        var backgroundColor = nil;

        if (objj_msgSend(theClass, "respondsToSelector:", sel_getUid("themeShowcaseBackgroundColor")))
            backgroundColor = objj_msgSend(theClass, "themeShowcaseBackgroundColor");

        objj_msgSend(collectionViewItem, "setView:", objj_msgSend(objj_msgSend(BKShowcaseCell, "alloc"), "initWithShowcaseBackgroundColor:", backgroundColor));

        objj_msgSend(collectionView, "setItemPrototype:", collectionViewItem);
        objj_msgSend(collectionView, "setMinItemSize:", itemSize);
        objj_msgSend(collectionView, "setMaxItemSize:", itemSize);
        objj_msgSend(collectionView, "setVerticalMargin:", 5.0);
        objj_msgSend(collectionView, "setContent:", viewTemplates);

        objj_msgSend(item, "setLabel:", objj_msgSend(theClass, "themeName"));
        objj_msgSend(item, "setView:", collectionView);

        objj_msgSend(tabView, "addTabViewItem:", item);
    }

    objj_msgSend(theWindow, "orderFront:", self);
}
})]);
}


{var the_class = objj_allocateClassPair(CPView, "BKShowcaseCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_showcaseBackgroundColor"), new objj_ivar("_backgroundView"), new objj_ivar("_view"), new objj_ivar("_label")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithShowcaseBackgroundColor:"), function(self, _cmd, aColor)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "init");

    if (self)
        _showcaseBackgroundColor = aColor;

    return self;
}
}), new objj_method(sel_getUid("setSelected:"), function(self, _cmd, isSelected)
{ with(self)
{
}
}), new objj_method(sel_getUid("setRepresentedObject:"), function(self, _cmd, anObject)
{ with(self)
{
    if (!_label)
    {
        _label = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());

        objj_msgSend(_label, "setAlignment:", CPCenterTextAlignment);
        objj_msgSend(_label, "setAutoresizingMask:", CPViewMinYMargin | CPViewWidthSizable);
        objj_msgSend(_label, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 12.0));

        objj_msgSend(self, "addSubview:", _label);
    }

    objj_msgSend(_label, "setStringValue:", objj_msgSend(anObject, "valueForKey:", "label"));
    objj_msgSend(_label, "sizeToFit");

    objj_msgSend(_label, "setFrame:", CGRectMake(0.0, CGRectGetHeight(objj_msgSend(self, "bounds")) - CGRectGetHeight(objj_msgSend(_label, "frame")),
        CGRectGetWidth(objj_msgSend(self, "bounds")), CGRectGetHeight(objj_msgSend(_label, "frame"))));

    if (!_backgroundView)
    {
        _backgroundView = objj_msgSend(objj_msgSend(CPView, "alloc"), "init");

        objj_msgSend(_backgroundView, "setBackgroundColor:", _showcaseBackgroundColor);

        objj_msgSend(self, "addSubview:", _backgroundView);
    }

    objj_msgSend(_backgroundView, "setFrame:", CGRectMake(0.0, 0.0, CGRectGetWidth(objj_msgSend(self, "bounds")), CGRectGetMinY(objj_msgSend(_label, "frame"))));
    objj_msgSend(_backgroundView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);

    if (_view)
        objj_msgSend(_view, "removeFromSuperview");

    _view = objj_msgSend(anObject, "valueForKey:", "themedObject");

    objj_msgSend(_view, "setTheme:", nil);
    objj_msgSend(_view, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin);
    objj_msgSend(_view, "setFrameOrigin:", CGPointMake((CGRectGetWidth(objj_msgSend(_backgroundView, "bounds")) - CGRectGetWidth(objj_msgSend(_view, "frame"))) / 2.0,
        (CGRectGetHeight(objj_msgSend(_backgroundView, "bounds")) - CGRectGetHeight(objj_msgSend(_view, "frame"))) / 2.0));

    objj_msgSend(_backgroundView, "addSubview:", _view);
}
}), new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithCoder:", aCoder);

    if (self)
        _showcaseBackgroundColor = objj_msgSend(aCoder, "decodeObjectForKey:", "showcase-background-color");

    return self
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "encodeWithCoder:", aCoder);

    objj_msgSend(aCoder, "encodeObject:forKey:", _showcaseBackgroundColor, "showcase-background-color");
}
})]);
}

p;13;BKUtilities.jc;4385;


{var the_class = objj_allocateClassPair(CPObject, "BKThemeTemplate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_name"), new objj_ivar("_description")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");

    if (self)
    {
        _name = objj_msgSend(aCoder, "decodeObjectForKey:", "BKThemeTemplateName");
        _description = objj_msgSend(aCoder, "decodeObjectForKey:", "BKThemeTemplateDescription");
    }

    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _name, "BKThemeTemplateName");
    objj_msgSend(aCoder, "encodeObject:forKey:", _description, "BKThemeTemplateDescription");
}
})]);
}

{var the_class = objj_allocateClassPair(CPView, "BKThemeObjectTemplate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_label"), new objj_ivar("_themedObject")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "init");

    if (self)
    {
        _label = objj_msgSend(aCoder, "decodeObjectForKey:", "BKThemeObjectTemplateLabel");
        _themedObject = objj_msgSend(aCoder, "decodeObjectForKey:", "BKThemeObjectTemplateThemedObject");
    }

    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _label, "BKThemeObjectTemplateLabel");
    objj_msgSend(aCoder, "encodeObject:forKey:", _themedObject, "BKThemeObjectTemplateThemedObject");
}
})]);
}

BKThemeDescriptorClasses= function()
{

    var themeDescriptorClasses = [];

    for (candidate in window)
    {
        var theClass = objj_getClass(candidate),
            theClassName = class_getName(theClass),
            index = theClassName.indexOf("ThemeDescriptor");

        if ((index >= 0) && (index === theClassName.length - "ThemeDescriptor".length))
            themeDescriptorClasses.push(theClass);
    }

    return themeDescriptorClasses;
}

BKThemeObjectTemplatesForClass= function(aClass)
{
    var templates = [],
        methods = class_copyMethodList(aClass.isa),
        count = objj_msgSend(methods, "count");

    while (count--)
    {
        var method = methods[count],
            selector = method_getName(method);

        if (selector.indexOf("themed") === 0)
        {
            var impl = method_getImplementation(method),
                object = impl(aClass, selector);

            if (object)
            {
                var template = objj_msgSend(objj_msgSend(BKThemeObjectTemplate, "alloc"), "init");

                objj_msgSend(template, "setValue:forKey:", object, "themedObject");
                objj_msgSend(template, "setValue:forKey:", BKLabelFromIdentifier(selector), "label");

                objj_msgSend(templates, "addObject:", template);
            }
        }
    }

    return templates;
}

BKLabelFromIdentifier= function(anIdentifier)
{
    var string = anIdentifier.substr("themed".length);
        index = 0,
        count = string.length,
        label = "",
        lastCapital = null,
        isLeadingCapital = YES;

    for (; index < count; ++index)
    {
        var character = string.charAt(index),
            isCapital = /^[A-Z]/.test(character);

        if (isCapital)
        {
            if (!isLeadingCapital)
            {
                if (lastCapital === null)
                    label += ' ' + character.toLowerCase();
                else
                    label += character;
            }

            lastCapital = character;
        }
        else
        {
            if (isLeadingCapital && lastCapital !== null)
                label += lastCapital;

            label += character;

            lastCapital = null;
            isLeadingCapital = NO;
        }
    }

    return label;
}

p;10;BlendKit.ji;22;BKShowcaseController.ji;13;BKUtilities.j