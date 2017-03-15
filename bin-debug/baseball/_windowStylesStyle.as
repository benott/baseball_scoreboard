﻿package 
{
    import mx.core.*;
    import mx.styles.*;

    public class _windowStylesStyle extends Object
    {

        public function _windowStylesStyle()
        {
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            var fbs:* = param1;
            var style:* = StyleManager.getStyleDeclaration(".windowStyles");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration(".windowStyles", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
