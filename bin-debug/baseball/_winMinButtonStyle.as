package 
{
    import _winMinButtonStyle.*;
    import mx.core.*;
    import mx.styles.*;

    public class _winMinButtonStyle extends Object
    {
        private static var _embed_css_win_min_dis_png_1820906509:Class = _winMinButtonStyle__embed_css_win_min_dis_png_1820906509;
        private static var _embed_css_win_min_down_png_976536611:Class = _winMinButtonStyle__embed_css_win_min_down_png_976536611;
        private static var _embed_css_win_min_up_png_1460330479:Class = _winMinButtonStyle__embed_css_win_min_up_png_1460330479;
        private static var _embed_css_win_min_over_png_1901583237:Class = _winMinButtonStyle__embed_css_win_min_over_png_1901583237;

        public function _winMinButtonStyle()
        {
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            var fbs:* = param1;
            var style:* = StyleManager.getStyleDeclaration(".winMinButton");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration(".winMinButton", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.upSkin = _embed_css_win_min_up_png_1460330479;
                this.downSkin = _embed_css_win_min_down_png_976536611;
                this.overSkin = _embed_css_win_min_over_png_1901583237;
                this.disabledSkin = _embed_css_win_min_dis_png_1820906509;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
