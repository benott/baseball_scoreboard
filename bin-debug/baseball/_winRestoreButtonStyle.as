package 
{
    import _winRestoreButtonStyle.*;
    import mx.core.*;
    import mx.styles.*;

    public class _winRestoreButtonStyle extends Object
    {
        private static var _embed_css_win_restore_up_png_532885615:Class = _winRestoreButtonStyle__embed_css_win_restore_up_png_532885615;
        private static var _embed_css_win_restore_over_png_495462307:Class = _winRestoreButtonStyle__embed_css_win_restore_over_png_495462307;
        private static var _embed_css_win_restore_down_png_81723899:Class = _winRestoreButtonStyle__embed_css_win_restore_down_png_81723899;

        public function _winRestoreButtonStyle()
        {
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            var fbs:* = param1;
            var style:* = StyleManager.getStyleDeclaration(".winRestoreButton");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration(".winRestoreButton", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.upSkin = _embed_css_win_restore_up_png_532885615;
                this.downSkin = _embed_css_win_restore_down_png_81723899;
                this.overSkin = _embed_css_win_restore_over_png_495462307;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
