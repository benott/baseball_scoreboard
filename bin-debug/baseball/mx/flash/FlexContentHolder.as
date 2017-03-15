package mx.flash
{
    import flash.display.*;
    import flash.utils.*;
    import mx.core.*;

    dynamic public class FlexContentHolder extends ContainerMovieClip
    {
        private var flexContent:IUIComponent;
        private var pendingFlexContent:IUIComponent;

        public function FlexContentHolder()
        {
            trackSizeChanges = false;
            showInAutomationHierarchy = false;
            return;
        }// end function

        override public function get content() : IUIComponent
        {
            return flexContent;
        }// end function

        override protected function notifySizeChanged() : void
        {
            super.notifySizeChanged();
            sizeFlexContent();
            return;
        }// end function

        override public function set content(param1:IUIComponent) : void
        {
            if (initialized)
            {
                setFlexContent(param1);
            }
            else
            {
                pendingFlexContent = param1;
            }
            return;
        }// end function

        override public function initialize() : void
        {
            super.initialize();
            _width = bounds.width;
            _height = bounds.height;
            getChildAt(0).alpha = 0;
            if (pendingFlexContent)
            {
                setFlexContent(pendingFlexContent);
                pendingFlexContent = null;
            }
            return;
        }// end function

        override public function setActualSize(param1:Number, param2:Number) : void
        {
            if (sizeChanged(_width, param1) || sizeChanged(_height, param2))
            {
                dispatchResizeEvent();
            }
            _width = param1;
            _height = param2;
            var _loc_3:* = 1;
            scaleY = 1;
            scaleX = _loc_3;
            if (flexContent)
            {
                sizeFlexContent();
            }
            return;
        }// end function

        protected function setFlexContent(param1:IUIComponent) : void
        {
            var uiComponentClass:Class;
            var uicParent:Object;
            var p:DisplayObjectContainer;
            var applicationClass:Class;
            var child:Object;
            var value:* = param1;
            if (flexContent)
            {
                removeChild(DisplayObject(flexContent));
                flexContent = null;
            }
            flexContent = value;
            if (flexContent)
            {
                addChild(DisplayObject(flexContent));
                try
                {
                    uiComponentClass = Class(getDefinitionByName("mx.core::UIComponent"));
                }
                catch (e:Error)
                {
                }
                if (uiComponentClass)
                {
                    p = parent;
                    while (p)
                    {
                        
                        if (p is uiComponentClass)
                        {
                            uicParent = p;
                            break;
                        }
                        p = p.parent;
                    }
                    if (!uicParent)
                    {
                        try
                        {
                            applicationClass = Class(getDefinitionByName("mx.core::ApplicationGlobals"));
                            uicParent = applicationClass.application;
                        }
                        catch (e:Error)
                        {
                        }
                    }
                    if (!uicParent)
                    {
                        return;
                    }
                    flexContent.initialize();
                    if (!flexContent.document)
                    {
                        flexContent.document = uicParent.document;
                    }
                    if (flexContent is InteractiveObject)
                    {
                        if (doubleClickEnabled)
                        {
                            InteractiveObject(flexContent).doubleClickEnabled = true;
                        }
                    }
                    if (flexContent is uiComponentClass)
                    {
                        mx_internal::_parent = this;
                        child = flexContent;
                        child.nestLevel = uicParent.nestLevel + 1;
                        mx_internal::_parent = uicParent;
                        child.regenerateStyleCache(true);
                        child.styleChanged(null);
                        child.notifyStyleChangeInChildren(null, true);
                        var _loc_3:* = child;
                        _loc_3.mx_internal::initThemeColor();
                        mx_internal::_parent = this;
                        _loc_3.stylesInitialized();
                    }
                    _width = _width * scaleX;
                    _height = _height * scaleY;
                    var _loc_3:* = 1;
                    scaleY = 1;
                    scaleX = _loc_3;
                    sizeFlexContent();
                }
            }
            return;
        }// end function

        protected function sizeFlexContent() : void
        {
            if (!flexContent)
            {
                return;
            }
            flexContent.scaleX = 1;
            flexContent.scaleY = 1;
            var _loc_1:* = _width;
            var _loc_2:* = _height;
            if (flexContent.explicitWidth)
            {
                _loc_1 = Math.min(_loc_1, flexContent.explicitWidth);
            }
            if (flexContent.explicitHeight)
            {
                _loc_2 = Math.min(_loc_2, flexContent.explicitHeight);
            }
            flexContent.setActualSize(_loc_1, _loc_2);
            return;
        }// end function

    }
}
