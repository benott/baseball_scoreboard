package 
{
    import _macMaxButtonStyle.*;
    import mx.core.*;
    import mx.styles.*;

    public class _macMaxButtonStyle extends Object
    {
        private static var _embed_css_mac_max_over_png_266471535:Class = _macMaxButtonStyle__embed_css_mac_max_over_png_266471535;
        private static var _embed_css_mac_max_down_png_629595089:Class = _macMaxButtonStyle__embed_css_mac_max_down_png_629595089;
        private static var _embed_css_mac_max_dis_png_755830905:Class = _macMaxButtonStyle__embed_css_mac_max_dis_png_755830905;
        private static var _embed_css_mac_max_up_png_1233459227:Class = _macMaxButtonStyle__embed_css_mac_max_up_png_1233459227;

        public function _macMaxButtonStyle()
        {
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            var fbs:* = param1;
            var style:* = StyleManager.getStyleDeclaration(".macMaxButton");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration(".macMaxButton", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.upSkin = _embed_css_mac_max_up_png_1233459227;
                this.overSkin = _embed_css_mac_max_over_png_266471535;
                this.downSkin = _embed_css_mac_max_down_png_629595089;
                this.disabledSkin = _embed_css_mac_max_dis_png_755830905;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
