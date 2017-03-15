package 
{
    import _macMinButtonStyle.*;
    import mx.core.*;
    import mx.styles.*;

    public class _macMinButtonStyle extends Object
    {
        private static var _embed_css_mac_min_up_png_1988238499:Class = _macMinButtonStyle__embed_css_mac_min_up_png_1988238499;
        private static var _embed_css_mac_min_down_png_1277884305:Class = _macMinButtonStyle__embed_css_mac_min_down_png_1277884305;
        private static var _embed_css_mac_min_over_png_1585719359:Class = _macMinButtonStyle__embed_css_mac_min_over_png_1585719359;
        private static var _embed_css_mac_min_dis_png_1820614733:Class = _macMinButtonStyle__embed_css_mac_min_dis_png_1820614733;

        public function _macMinButtonStyle()
        {
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            var fbs:* = param1;
            var style:* = StyleManager.getStyleDeclaration(".macMinButton");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration(".macMinButton", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.upSkin = _embed_css_mac_min_up_png_1988238499;
                this.overSkin = _embed_css_mac_min_over_png_1585719359;
                this.downSkin = _embed_css_mac_min_down_png_1277884305;
                this.alpha = 0.5;
                this.disabledSkin = _embed_css_mac_min_dis_png_1820614733;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
