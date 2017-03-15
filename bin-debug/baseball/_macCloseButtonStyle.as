package 
{
    import _macCloseButtonStyle.*;
    import mx.core.*;
    import mx.styles.*;

    public class _macCloseButtonStyle extends Object
    {
        private static var _embed_css_mac_close_down_png_2093155375:Class = _macCloseButtonStyle__embed_css_mac_close_down_png_2093155375;
        private static var _embed_css_mac_close_over_png_600580207:Class = _macCloseButtonStyle__embed_css_mac_close_over_png_600580207;
        private static var _embed_css_mac_close_up_png_1633147997:Class = _macCloseButtonStyle__embed_css_mac_close_up_png_1633147997;

        public function _macCloseButtonStyle()
        {
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            var fbs:* = param1;
            var style:* = StyleManager.getStyleDeclaration(".macCloseButton");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration(".macCloseButton", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.upSkin = _embed_css_mac_close_up_png_1633147997;
                this.overSkin = _embed_css_mac_close_over_png_600580207;
                this.downSkin = _embed_css_mac_close_down_png_2093155375;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
