package 
{
    import _winMaxButtonStyle.*;
    import mx.core.*;
    import mx.styles.*;

    public class _winMaxButtonStyle extends Object
    {
        private static var _embed_css_win_max_up_png_1184193711:Class = _winMaxButtonStyle__embed_css_win_max_up_png_1184193711;
        private static var _embed_css_win_max_dis_png_1803882633:Class = _winMaxButtonStyle__embed_css_win_max_dis_png_1803882633;
        private static var _embed_css_win_max_down_png_299227037:Class = _winMaxButtonStyle__embed_css_win_max_down_png_299227037;
        private static var _embed_css_win_max_over_png_1092958045:Class = _winMaxButtonStyle__embed_css_win_max_over_png_1092958045;

        public function _winMaxButtonStyle()
        {
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            var fbs:* = param1;
            var style:* = StyleManager.getStyleDeclaration(".winMaxButton");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration(".winMaxButton", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.upSkin = _embed_css_win_max_up_png_1184193711;
                this.downSkin = _embed_css_win_max_down_png_299227037;
                this.overSkin = _embed_css_win_max_over_png_1092958045;
                this.disabledSkin = _embed_css_win_max_dis_png_1803882633;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
