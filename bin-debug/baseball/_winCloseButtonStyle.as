package 
{
    import _winCloseButtonStyle.*;
    import mx.core.*;
    import mx.styles.*;

    public class _winCloseButtonStyle extends Object
    {
        private static var _embed_css_win_close_up_png_623627169:Class = _winCloseButtonStyle__embed_css_win_close_up_png_623627169;
        private static var _embed_css_win_close_over_png_1966928853:Class = _winCloseButtonStyle__embed_css_win_close_over_png_1966928853;
        private static var _embed_css_win_close_down_png_238952555:Class = _winCloseButtonStyle__embed_css_win_close_down_png_238952555;

        public function _winCloseButtonStyle()
        {
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            var fbs:* = param1;
            var style:* = StyleManager.getStyleDeclaration(".winCloseButton");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration(".winCloseButton", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.upSkin = _embed_css_win_close_up_png_623627169;
                this.overSkin = _embed_css_win_close_over_png_1966928853;
                this.downSkin = _embed_css_win_close_down_png_238952555;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
